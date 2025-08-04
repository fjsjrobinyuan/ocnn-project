#include "complete_pipeline.h"
#include "systolic_array.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
static ConvolutionEngine conv_engine;
static ap_uint<1> engine_initialized = 0;
void event_driven_systolic_array_with_triggers(
    FeatureBuffer *input_features_bram,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> &num_processed_voxels,
    ap_uint<BRAM_WIDTH> *L3_bitmap_bram,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned_bram,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned_bram,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned_bram,
    PrunedBitmapInfo &bitmap_info,
    StreamingPointers &access_pointers,  
    float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
    float bias[FEATURE_DIM],
    FeatureBuffer *output_features_bram,
    hls::stream<ConvolutionTrigger> &trigger_in,
    hls::stream<ConvolutionResponse> &response_out,
    hls::stream<EarlyTriggerSignal> &early_trigger_stream,
    ap_uint<32> available_voxels,
    ap_uint<1> &computation_active)
{
#pragma HLS INLINE off
    while (!early_trigger_stream.empty()) {
        EarlyTriggerSignal signal = early_trigger_stream.read();
        #ifndef __SYNTHESIS__
        std::cout << "Received early trigger signal: valid=" << (int)signal.valid_l0_ready 
                  << " voxel_count=" << signal.voxel_count << std::endl;
        #endif
    }
    static enum { SYS_IDLE, SYS_PROCESSING } systolic_state = SYS_IDLE;
    if (!engine_initialized) {
        #ifndef __SYNTHESIS__
        std::cout << "Initializing convolution engine..." << std::endl;
        #endif
        conv_engine.initialize(weights, bias);
        engine_initialized = 1;
    }
    if (!trigger_in.empty() && systolic_state == SYS_IDLE) {
        ConvolutionTrigger trigger = trigger_in.read();
        #ifndef __SYNTHESIS__
        std::cout << "Received convolution trigger: available_voxels = " << trigger.available_voxels << std::endl;
        #endif
        if (trigger.available_voxels > 0 && (trigger.start_processing || trigger.data_ready)) {
            systolic_state = SYS_PROCESSING;
            computation_active = 1;
        }
    }
    if (systolic_state == SYS_PROCESSING) {
        #ifndef __SYNTHESIS__
        std::cout << "Starting streaming convolution processing..." << std::endl;
        #endif
        conv_engine.process_sparse_convolution_streaming(
            input_features_bram,
            morton_list,
            available_voxels,
            L3_bitmap_bram,
            L2_bitmap_pruned_bram,
            L1_bitmap_pruned_bram,
            L0_bitmap_pruned_bram,
            bitmap_info,
            output_features_bram);
        num_processed_voxels = available_voxels;
        systolic_state = SYS_IDLE;
        computation_active = 0;
        #ifndef __SYNTHESIS__
        std::cout << "Completed streaming convolution processing" << std::endl;
        #endif
        ConvolutionResponse response;
        response.processing_complete = 1;
        response.voxels_processed = available_voxels;
        response.ready_for_next = 1;
        if (!response_out.full()) {
            response_out.write(response);
        }
    }
}
int find_feature_index(ap_uint<MORTON_BITS> target_morton,
                       ap_uint<MORTON_BITS> *morton_list,
                    ap_uint<32> num_voxels) {
                        #pragma HLS INLINE off
                        for (ap_uint<32> i = 0; i < num_voxels; i++) {
                            #pragma HLS PIPELINE II = 1
                            if (morton_list[i] == target_morton) {
                                return i;
                            }
                        }
                        return -1;
                    }
void write_results_to_dram(
    FeatureBuffer *output_features,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<32> *feature_dram)
{
#pragma HLS INLINE off
    #ifndef __SYNTHESIS__
    std::cout << "write_results_to_dram called with num_voxels = " << num_voxels << std::endl;
    #endif
    ap_uint<32> dram_offset = OUTPUT_FEATURE_REGION_START;
    #ifndef __SYNTHESIS__
    std::cout << "Starting DRAM offset = " << dram_offset << std::endl;
    #endif
WRITE_LOOP:
for (ap_uint<32> v = 0; v < num_voxels; v++) {
#pragma HLS PIPELINE II=1
#pragma HLS DEPENDENCE variable=feature_dram inter false
    if (v >= MAX_VOXELS_L0) break;
    WRITE_FEATURES:
    for (int f = 0; f < FEATURE_DIM; f += 8) {
#pragma HLS UNROLL factor=8
        for (int k = 0; k < 8 && (f+k) < FEATURE_DIM; k++) {
#pragma HLS UNROLL
            feature_dram[dram_offset + f + k] = 
                *((ap_uint<32> *)&output_features[v].features[f + k]);
        }
    }
    dram_offset += FEATURE_DIM;
}
}
void pipeline_bitmap_stage(
    hls::stream<VoxelData> &voxel_in,
    hls::stream<VoxelData> &feature_data_out,
    hls::stream<ap_uint<MORTON_BITS>> &write_addr_out,
    hls::stream<RetainedBlockInfo> &retained_blocks_out,
    hls::stream<EarlyTriggerSignal> &early_trigger_out,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    PrunedBitmapInfo &bitmap_info,
    ap_uint<32> &processed_voxels) {
#pragma HLS INLINE off
#pragma HLS INTERFACE axis port=voxel_in
#pragma HLS INTERFACE axis port=feature_data_out
#pragma HLS INTERFACE axis port=write_addr_out
#pragma HLS INTERFACE axis port=retained_blocks_out
#pragma HLS INTERFACE axis port=early_trigger_out
#pragma HLS INTERFACE bram port=L3_bitmap
#pragma HLS INTERFACE bram port=L2_bitmap_pruned
#pragma HLS INTERFACE bram port=L1_bitmap_pruned
#pragma HLS INTERFACE bram port=L0_bitmap_pruned
    #ifndef __SYNTHESIS__
    std::cout << "Pipeline bitmap stage: Starting sophisticated bitmap constructor" << std::endl;
    #endif
    streaming_bitmap_constructor(
        voxel_in,                    
        feature_data_out,            
        write_addr_out,              
        early_trigger_out,        
        retained_blocks_out,         
        L3_bitmap,                   
        L2_bitmap_pruned,           
        L1_bitmap_pruned,           
        L0_bitmap_pruned,           
        bitmap_info,                
        processed_voxels);          
    #ifndef __SYNTHESIS__
    std::cout << "Pipeline bitmap stage: Completed, processed " << processed_voxels << " voxels" << std::endl;
    std::cout << "Bitmap sizes - L3:" << bitmap_info.L3_size << " L2:" << bitmap_info.L2_size 
              << " L1:" << bitmap_info.L1_size << " L0:" << bitmap_info.L0_size << std::endl;
    #endif
}
void pipeline_feature_stage(
    hls::stream<VoxelData> &feature_data_in,
    hls::stream<ap_uint<MORTON_BITS>> &morton_addrs_in,
    hls::stream<MemRequest> &mem_requests_out,
    FeatureBuffer *input_features,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> &features_stored) {
#pragma HLS INLINE off
#pragma HLS INTERFACE axis port=feature_data_in
#pragma HLS INTERFACE axis port=morton_addrs_in
#pragma HLS INTERFACE axis port=mem_requests_out
#pragma HLS INTERFACE bram port=input_features
#pragma HLS INTERFACE bram port=morton_list
    features_stored = 0;
    ap_uint<32> request_id_counter = 0;
    #ifndef __SYNTHESIS__
    std::cout << "Pipeline feature stage: Starting feature buffer management" << std::endl;
    #endif
    FEATURE_PROCESSING:
    while (!feature_data_in.empty() && !morton_addrs_in.empty()) {
#pragma HLS PIPELINE II=1
        VoxelData voxel = feature_data_in.read();
        ap_uint<MORTON_BITS> morton_addr = morton_addrs_in.read();
        if (features_stored < MAX_VOXELS_L0) {
            morton_list[features_stored] = morton_addr;
            STORE_FEATURE_VALUES:
            for (int f = 0; f < FEATURE_DIM; f++) {
#pragma HLS UNROLL factor=8
                input_features[features_stored].features[f] = voxel.features[f];
            }
            GENERATE_MEM_REQUESTS:
            for (int f = 0; f < FEATURE_DIM; f++) {
#pragma HLS UNROLL factor=4
                MemRequest write_req;
                write_req.morton_addr = morton_addr;
                write_req.is_write = 1;
                write_req.request_id = request_id_counter++;
                write_req.should_store = 1;
                write_req.data = *((ap_uint<32> *)&voxel.features[f]);
                if (!mem_requests_out.full()) {
                    mem_requests_out.write(write_req);
                } else {
                    #ifndef __SYNTHESIS__
                    std::cout << "Warning: Memory request stream full" << std::endl;
                    #endif
                }
            }
            features_stored++;
            if (features_stored <= 5) {
                #ifndef __SYNTHESIS__
                std::cout << "Stored feature " << features_stored-1 << " morton=0x" 
                          << std::hex << morton_addr << std::dec << std::endl;
                #endif
            }
        } else {
            #ifndef __SYNTHESIS__
            std::cout << "Warning: Feature buffer full, dropping voxel" << std::endl;
            #endif
            break;
        }
    }
    #ifndef __SYNTHESIS__
    std::cout << "Pipeline feature stage: Completed, stored " << features_stored 
              << " features, generated " << request_id_counter << " memory requests" << std::endl;
    #endif
}
void pipeline_morton_stage(
    hls::stream<MemRequest> &mem_requests_in,
    hls::stream<RetainedBlockInfo> &retained_blocks_in,
    hls::stream<ConvolutionTrigger> &trigger_out,
    hls::stream<ConvolutionResponse> &response_in,
    hls::stream<MortonBitmapInterface> &bitmap_interface_out,
    hls::stream<MemResponse> &mem_response_out,
    ap_uint<32> *feature_dram,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    PrunedBitmapInfo &bitmap_info) {
#pragma HLS INLINE off
#pragma HLS INTERFACE axis port=mem_requests_in
#pragma HLS INTERFACE axis port=retained_blocks_in
#pragma HLS INTERFACE axis port=trigger_out
#pragma HLS INTERFACE axis port=response_in
#pragma HLS INTERFACE axis port=bitmap_interface_out
#pragma HLS INTERFACE axis port=mem_response_out
#pragma HLS INTERFACE m_axi port=feature_dram depth=134217728 bundle=gmem0
#pragma HLS INTERFACE bram port=L3_bitmap
#pragma HLS INTERFACE bram port=L2_bitmap_pruned
#pragma HLS INTERFACE bram port=L1_bitmap_pruned
#pragma HLS INTERFACE bram port=L0_bitmap_pruned
    static StreamingPointers access_pointers;
    static ap_uint<1> pointers_initialized = 0;
    static ap_uint<32> total_voxels_ready = 0;
    #ifndef __SYNTHESIS__
    std::cout << "Pipeline morton stage: Starting sophisticated morton reorder buffer" << std::endl;
    #endif
    if (!pointers_initialized) {
        initialize_streaming_pointers(access_pointers);
        pointers_initialized = 1;
    }
    ap_uint<1> enable_flag = 1;
    integrated_morton_reorder_buffer_with_triggers(  
        mem_requests_in,
        bitmap_interface_out,
        retained_blocks_in,
        mem_response_out,
        trigger_out,           
        response_in,           
        feature_dram,
        L3_bitmap,
        L2_bitmap_pruned,
        L1_bitmap_pruned,
        L0_bitmap_pruned,
        bitmap_info,
        access_pointers,       
        enable_flag);                  
    #ifndef __SYNTHESIS__
    std::cout << "Pipeline morton stage: Completed sophisticated morton reordering" << std::endl;
    #endif
}
void pipeline_convolution_stage(
hls::stream<ConvolutionTrigger> &trigger_in,         
    hls::stream<ConvolutionResponse> &response_out,      
        hls::stream<EarlyTriggerSignal> &early_trigger_in,
    hls::stream<MortonBitmapInterface> &bitmap_interface_in,
    hls::stream<MemResponse> &mem_response_in,
    FeatureBuffer *input_features,
    ap_uint<MORTON_BITS> *morton_list,
    FeatureBuffer *output_features,
    float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
    float bias[FEATURE_DIM],
    ap_uint<BRAM_WIDTH> *L3_bitmap_conv,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned_conv,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned_conv,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned_conv,
    PrunedBitmapInfo &bitmap_info,
    ap_uint<32> available_voxels,
    ap_uint<32> &voxels_processed) {
#pragma HLS INLINE off
#pragma HLS INTERFACE axis port=trigger_in
#pragma HLS INTERFACE axis port=response_out
#pragma HLS INTERFACE axis port=early_trigger_in
#pragma HLS INTERFACE axis port=bitmap_interface_in
#pragma HLS INTERFACE axis port=mem_response_in
#pragma HLS INTERFACE bram port=input_features
#pragma HLS INTERFACE bram port=morton_list
#pragma HLS INTERFACE bram port=output_features
#pragma HLS INTERFACE bram port=L3_bitmap_conv
#pragma HLS INTERFACE bram port=L2_bitmap_pruned_conv
#pragma HLS INTERFACE bram port=L1_bitmap_pruned_conv
#pragma HLS INTERFACE bram port=L0_bitmap_pruned_conv
    static StreamingPointers access_pointers;
    static ap_uint<1> computation_active = 0;
    static ap_uint<1> pointers_initialized = 0;
    #ifndef __SYNTHESIS__
    std::cout << "Pipeline convolution stage: Starting sophisticated convolution engine" << std::endl;
    #endif
    if (!pointers_initialized) {
        initialize_streaming_pointers(access_pointers);
        pointers_initialized = 1;
    }
    event_driven_systolic_array_with_triggers(
        input_features,             
        morton_list,                
        voxels_processed,           
        L3_bitmap_conv,                  
        L2_bitmap_pruned_conv,          
        L1_bitmap_pruned_conv,          
        L0_bitmap_pruned_conv,          
        bitmap_info,                
        access_pointers,            
        weights,                    
        bias,                       
        output_features,            
        trigger_in,
        response_out,                 
        early_trigger_in,       
        available_voxels,           
        computation_active);        
        while (!bitmap_interface_in.empty()) {
            MortonBitmapInterface interface = bitmap_interface_in.read();
            #ifndef __SYNTHESIS__
        std::cout << "Consumed bitmap interface signal" << std::endl;
        #endif
        }
        while (!mem_response_in.empty()) {
        MemResponse resp = mem_response_in.read();
        #ifndef __SYNTHESIS__
        std::cout << "Consumed memory response, request_id=" << (int)resp.request_id << std::endl;
        #endif
    }
    #ifndef __SYNTHESIS__
    std::cout << "Pipeline convolution stage: Completed, processed " << voxels_processed 
              << " voxels, computation_active=" << (int)computation_active << std::endl;
    #endif
}
static ap_uint<1> pipeline_active = 0;
static ap_uint<1> finalization_done = 0;
void complete_octree_pipeline(
    hls::stream<VoxelData> &sensor_data,
    ap_uint<32> *feature_dram,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    float conv_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
    float conv_bias[FEATURE_DIM],
    ap_uint<1> start,
    ap_uint<1> *done) {
#pragma HLS INTERFACE axis port=sensor_data
#pragma HLS INTERFACE m_axi port=feature_dram depth=134217728 bundle=gmem0 \
        max_read_burst_length=256 max_write_burst_length=256 offset=slave
#pragma HLS INTERFACE bram port=L3_bitmap
#pragma HLS INTERFACE bram port=L2_bitmap_pruned
#pragma HLS INTERFACE bram port=L1_bitmap_pruned
#pragma HLS INTERFACE bram port=L0_bitmap_pruned
#pragma HLS INTERFACE s_axilite port=start
#pragma HLS INTERFACE s_axilite port=done
#pragma HLS INTERFACE s_axilite port=return
    static hls::stream<VoxelData> feature_data_stream("feature_data_main");
    static hls::stream<ap_uint<MORTON_BITS>> morton_addrs_stream("morton_addrs_main");
    static hls::stream<RetainedBlockInfo> retained_blocks_stream("retained_blocks_main");
    static hls::stream<MemRequest> mem_requests_stream("mem_requests_main");
    static hls::stream<EarlyTriggerSignal> early_trigger_stream("early_trigger_main");
    static hls::stream<MortonBitmapInterface> bitmap_interface_stream("bitmap_interface_main");
    static hls::stream<MemResponse> mem_response_stream("mem_response_main");
#pragma HLS STREAM variable=feature_data_stream depth=1024
#pragma HLS STREAM variable=morton_addrs_stream depth=1024
#pragma HLS STREAM variable=retained_blocks_stream depth=256
#pragma HLS STREAM variable=mem_requests_stream depth=512
#pragma HLS STREAM variable=early_trigger_stream depth=64
#pragma HLS STREAM variable=bitmap_interface_stream depth=32
#pragma HLS STREAM variable=mem_response_stream depth=128
    static FeatureBuffer input_features[MAX_VOXELS_L0];
    static FeatureBuffer output_features[MAX_VOXELS_L0];
    static ap_uint<MORTON_BITS> morton_list[MAX_VOXELS_L0];
    static PrunedBitmapInfo bitmap_info;
    static ap_uint<BRAM_WIDTH> L3_bitmap_conv[L3_WORDS];
     static ap_uint<BRAM_WIDTH> L2_bitmap_pruned_conv[1024];
    static ap_uint<BRAM_WIDTH> L1_bitmap_pruned_conv[1024];
    static ap_uint<BRAM_WIDTH> L0_bitmap_pruned_conv[1024];
    #pragma HLS BIND_STORAGE variable=L3_bitmap_conv type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=L2_bitmap_pruned_conv type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=L1_bitmap_pruned_conv type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=L0_bitmap_pruned_conv type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=input_features type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=output_features type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=morton_list type=ram_2p impl=bram
 static ap_uint<32> processed_voxels = 0;
    static ap_uint<32> features_stored = 0;
    static ap_uint<32> voxels_processed = 0;
    static ap_uint<32> pipeline_cycles = 0;
        static hls::stream<ConvolutionTrigger> conv_trigger_stream("conv_trigger");
    static hls::stream<ConvolutionResponse> conv_response_stream("conv_response");
    #pragma HLS STREAM variable=conv_trigger_stream depth=8
#pragma HLS STREAM variable=conv_response_stream depth=8
    *done = 0;
    if (start && !pipeline_active) {
        #ifndef __SYNTHESIS__
        std::cout << "=== COMPLETE OCTREE PIPELINE STARTING ===" << std::endl;
        #endif
        pipeline_active = 1;
        finalization_done = 0;
        processed_voxels = 0;
        features_stored = 0;
        voxels_processed = 0;
        pipeline_cycles = 0;
        INIT_L3:
        for (int i = 0; i < L3_WORDS; i++) {
#pragma HLS PIPELINE II=1
            L3_bitmap[i] = 0;
        }
        INIT_L2:
        for (int i = 0; i < 1024; i++) {
#pragma HLS PIPELINE II=1
            L2_bitmap_pruned[i] = 0;
        }
        INIT_L1:
        for (int i = 0; i < 1024; i++) {
#pragma HLS PIPELINE II=1
            L1_bitmap_pruned[i] = 0;
        }
        INIT_L0:
        for (int i = 0; i < 1024; i++) {
#pragma HLS PIPELINE II=1
            L0_bitmap_pruned[i] = 0;
        }
        bitmap_info.L3_size = 0;
        bitmap_info.L2_size = 0;
        bitmap_info.L1_size = 0;
        bitmap_info.L0_size = 0;
        bitmap_info.total_size = 0;
        #ifndef __SYNTHESIS__
        std::cout << "Initialization complete, starting dataflow pipeline" << std::endl;
        #endif
    }
    if (pipeline_active && !finalization_done) {
        if (!sensor_data.empty() || pipeline_cycles < 1000) { 
            run_dataflow_pipeline(
                sensor_data,
                feature_data_stream,
                morton_addrs_stream,
                retained_blocks_stream,
                mem_requests_stream,
conv_trigger_stream,
conv_response_stream,
                early_trigger_stream,
                bitmap_interface_stream,
                mem_response_stream,
                input_features,
                morton_list,
                output_features,
                conv_weights,
                conv_bias,
                L3_bitmap,
                L2_bitmap_pruned,
                L1_bitmap_pruned,
                L0_bitmap_pruned,
                L3_bitmap,
                L2_bitmap_pruned,
                L1_bitmap_pruned,
                L0_bitmap_pruned,
                bitmap_info,
                feature_dram,
                processed_voxels,
                features_stored,
                voxels_processed);
            pipeline_cycles++;
            if (sensor_data.empty() && processed_voxels > 0 && 
                feature_data_stream.empty() && morton_addrs_stream.empty() &&
                retained_blocks_stream.empty() && mem_requests_stream.empty()) {
                #ifndef __SYNTHESIS__
                std::cout << "All streams empty, transitioning to finalize" << std::endl;
                std::cout << "Final counts - processed_voxels:" << processed_voxels 
                          << " features_stored:" << features_stored 
                          << " voxels_processed:" << voxels_processed << std::endl;
                #endif
            }
        }
        bool all_streams_empty = sensor_data.empty() && feature_data_stream.empty() &&
                                morton_addrs_stream.empty() && retained_blocks_stream.empty() &&
                                mem_requests_stream.empty();
        if (all_streams_empty && processed_voxels > 0) {
write_results_to_dram(output_features, morton_list, voxels_processed, feature_dram);
        *done = 1;
        pipeline_active = 0;
        finalization_done = 1;        }
    }
}
void copy_bitmaps_for_convolution(
    ap_uint<BRAM_WIDTH> *src_L3, ap_uint<BRAM_WIDTH> *dst_L3,
    ap_uint<BRAM_WIDTH> *src_L2, ap_uint<BRAM_WIDTH> *dst_L2,
    ap_uint<BRAM_WIDTH> *src_L1, ap_uint<BRAM_WIDTH> *dst_L1,
    ap_uint<BRAM_WIDTH> *src_L0, ap_uint<BRAM_WIDTH> *dst_L0,
    PrunedBitmapInfo &bitmap_info) {
#pragma HLS INLINE off
    COPY_L3:
    for (int i = 0; i < L3_WORDS; i++) {
#pragma HLS PIPELINE II=1
        dst_L3[i] = src_L3[i];
    }
    int l2_words = (bitmap_info.L2_size + BRAM_WIDTH - 1) / BRAM_WIDTH;
    COPY_L2:
    for (int i = 0; i < l2_words && i < 1024; i++) {
#pragma HLS PIPELINE II=1
        dst_L2[i] = src_L2[i];
    }
    int l1_words = (bitmap_info.L1_size + BRAM_WIDTH - 1) / BRAM_WIDTH;
    COPY_L1:
    for (int i = 0; i < l1_words && i < 1024; i++) {
#pragma HLS PIPELINE II=1
        dst_L1[i] = src_L1[i];
    }
    int l0_words = (bitmap_info.L0_size + BRAM_WIDTH - 1) / BRAM_WIDTH;
    COPY_L0:
    for (int i = 0; i < l0_words && i < 1024; i++) {
#pragma HLS PIPELINE II=1
        dst_L0[i] = src_L0[i];
    }
}
void run_dataflow_pipeline(
    hls::stream<VoxelData> &sensor_data,
    hls::stream<VoxelData> &feature_data_stream,
    hls::stream<ap_uint<MORTON_BITS>> &morton_addrs_stream,
    hls::stream<RetainedBlockInfo> &retained_blocks_stream,
    hls::stream<MemRequest> &mem_requests_stream,
    hls::stream<ConvolutionTrigger> &conv_trigger_stream,        
    hls::stream<ConvolutionResponse> &conv_response_stream,      
    hls::stream<EarlyTriggerSignal> &early_trigger_stream,
    hls::stream<MortonBitmapInterface> &bitmap_interface_stream,
    hls::stream<MemResponse> &mem_response_stream,
    FeatureBuffer *input_features,
    ap_uint<MORTON_BITS> *morton_list,
    FeatureBuffer *output_features,
    float conv_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
    float conv_bias[FEATURE_DIM],
    ap_uint<BRAM_WIDTH> *L3_bitmap,                             
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L3_bitmap_conv,                        
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned_conv,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned_conv,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned_conv,
    PrunedBitmapInfo &bitmap_info,
    ap_uint<32> *feature_dram,
    ap_uint<32> &processed_voxels,
    ap_uint<32> &features_stored,
    ap_uint<32> &voxels_processed)  {
#pragma HLS DATAFLOW
    pipeline_bitmap_stage(
        sensor_data,
        feature_data_stream,
        morton_addrs_stream,
        retained_blocks_stream,
        early_trigger_stream,
        L3_bitmap,
        L2_bitmap_pruned,
        L1_bitmap_pruned,
        L0_bitmap_pruned,
        bitmap_info,
        processed_voxels);
    pipeline_feature_stage(
        feature_data_stream,
        morton_addrs_stream,
        mem_requests_stream,
        input_features,
        morton_list,
        features_stored);
    pipeline_morton_stage(
        mem_requests_stream,
        retained_blocks_stream,
        conv_trigger_stream,
        conv_response_stream,
        bitmap_interface_stream,
        mem_response_stream,
        feature_dram,
        L3_bitmap,
        L2_bitmap_pruned,
        L1_bitmap_pruned,
        L0_bitmap_pruned,
        bitmap_info);
    pipeline_convolution_stage(
        conv_trigger_stream,
        conv_response_stream,
        early_trigger_stream,
        bitmap_interface_stream,
        mem_response_stream,
        input_features,
        morton_list,
        output_features,
        conv_weights,
        conv_bias,
        L3_bitmap_conv,
        L2_bitmap_pruned_conv,
        L1_bitmap_pruned_conv,
        L0_bitmap_pruned_conv,
        bitmap_info,
        features_stored,
        voxels_processed);
}
