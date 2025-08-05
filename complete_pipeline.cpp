#include "complete_pipeline.h"
#include "systolic_array.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
// global convolution engine
static ConvolutionEngine conv_engine;
static ap_uint<1> engine_initialized = 0;
/**
 * Event-driven systolic array controller - handles convolution triggers and manages computation
 * This is the main interface between the pipeline and the convolution engine
 */
void event_driven_systolic_array_with_triggers(
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
    hls::stream<ConvolutionTrigger> &trigger_in,
    hls::stream<ConvolutionResponse> &response_out,
    hls::stream<EarlyTriggerSignal> &early_trigger_stream,
    ap_uint<32> available_voxels,
    ap_uint<1> &computation_active,
    ap_uint<32> *feature_dram_read,
    ap_uint<32> *feature_dram_write)
{
#pragma HLS INLINE off
    // consume any early trigger signals (these come from bitmap stage when L0 regions are ready)
    while (!early_trigger_stream.empty())
    {
        EarlyTriggerSignal signal = early_trigger_stream.read();
#ifndef __SYNTHESIS__
        std::cout << "Received early trigger signal: valid=" << (int)signal.valid_l0_ready
                  << " voxel_count=" << signal.voxel_count << std::endl;
#endif
    }
    // simple state machine, idle -> processing -> idle
    static enum { SYS_IDLE,
                  SYS_PROCESSING } systolic_state = SYS_IDLE;
    // one-time initialization of the convolution engine with weights/bias
    if (!engine_initialized)
    {
#ifndef __SYNTHESIS__
        std::cout << "Initializing convolution engine..." << std::endl;
#endif
        conv_engine.initialize(weights, bias);
        engine_initialized = 1;
    }
    // check for convolution trigger from morton stage
    if (!trigger_in.empty() && systolic_state == SYS_IDLE)
    {
        ConvolutionTrigger trigger = trigger_in.read();
#ifndef __SYNTHESIS__
        std::cout << "Received convolution trigger: available_voxels = " << trigger.available_voxels << std::endl;
#endif
        // only start processing if we have voxels and the trigger is valid
        if (trigger.available_voxels > 0 && (trigger.start_processing || trigger.data_ready))
        {
            systolic_state = SYS_PROCESSING;
            computation_active = 1;
        }
    }
    // main convolution processing, uses z-buffer streaming approach
    if (systolic_state == SYS_PROCESSING)
    {
#ifndef __SYNTHESIS__
        std::cout << "Starting streaming convolution processing..." << std::endl;
#endif
        // call the actual convolution engine, processes all voxels using sparse 3D convolution
        conv_engine.process_sparse_convolution_streaming(
            morton_list,
            available_voxels,
            L3_bitmap_bram,
            L2_bitmap_pruned_bram,
            L1_bitmap_pruned_bram,
            L0_bitmap_pruned_bram,
            bitmap_info,
            feature_dram_read,
            feature_dram_write);
        num_processed_voxels = available_voxels;
        systolic_state = SYS_IDLE;
        computation_active = 0;
#ifndef __SYNTHESIS__
        std::cout << "Completed streaming convolution processing" << std::endl;
#endif
        // send completion response back to morton stage
        ConvolutionResponse response;
        response.processing_complete = 1;
        response.voxels_processed = available_voxels;
        response.ready_for_next = 1;
        if (!response_out.full())
        {
            response_out.write(response);
        }
    }
}
/**
 * linear search to find feature index by morton code
 * this could be optimized with binary search since morton_list should be sorted
 */
int find_feature_index(ap_uint<MORTON_BITS> target_morton,
                       ap_uint<MORTON_BITS> *morton_list,
                       ap_uint<32> num_voxels)
{
#pragma HLS INLINE off
    for (ap_uint<32> i = 0; i < num_voxels; i++)
    {
#pragma HLS PIPELINE II = 1
        if (morton_list[i] == target_morton)
        {
            return i;
        }
    }
    return -1;
}

/**
 * write final convolution results back to DRAM
 * results are stored in the output region of the feature_dram buffer
 */
void write_results_to_dram(
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<32> *feature_dram)
{ // results are already in dram at OUTPUT_FEATURE_REGION_START
    // this function is not implemented
}

/**
 * pipeline stage 1: bitmap construction
 * take streaming voxel data and builds octree bitmaps + retained block info
 * this is the first stage in the dataflow pipeline
 */
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
    ap_uint<32> &processed_voxels)
{
#pragma HLS INLINE off
#pragma HLS INTERFACE axis port = voxel_in
#pragma HLS INTERFACE axis port = feature_data_out
#pragma HLS INTERFACE axis port = write_addr_out
#pragma HLS INTERFACE axis port = retained_blocks_out
#pragma HLS INTERFACE axis port = early_trigger_out
#pragma HLS INTERFACE bram port = L3_bitmap
#pragma HLS INTERFACE bram port = L2_bitmap_pruned
#pragma HLS INTERFACE bram port = L1_bitmap_pruned
#pragma HLS INTERFACE bram port = L0_bitmap_pruned
#ifndef __SYNTHESIS__
    std::cout << "Pipeline bitmap stage: Starting sophisticated bitmap constructor" << std::endl;
#endif
    // call the main bitmap constructor, this build the 4-level octree structure
    streaming_bitmap_constructor(
        voxel_in,            // Input voxel stream
        feature_data_out,    // Valid voxel features to next stage
        write_addr_out,      // Morton addresses for feature storage
        early_trigger_out,   // Early signals when regions are ready
        retained_blocks_out, // Block info for Morton stage
        L3_bitmap,           // Coarsest level bitmap
        L2_bitmap_pruned,    // Level 2 pruned bitmap
        L1_bitmap_pruned,    // Level 1 pruned bitmap
        L0_bitmap_pruned,    // Finest level pruned bitmap
        bitmap_info,         // Size information for each level
        processed_voxels);   // Total voxels processed
#ifndef __SYNTHESIS__
    std::cout << "Pipeline bitmap stage: Completed, processed " << processed_voxels << " voxels" << std::endl;
    std::cout << "Bitmap sizes - L3:" << bitmap_info.L3_size << " L2:" << bitmap_info.L2_size
              << " L1:" << bitmap_info.L1_size << " L0:" << bitmap_info.L0_size << std::endl;
#endif
}
/**
 * pipeline stage 2: feature buffer management
 * stores incoming voxel features in BRAM and generates memory request
 * this stage feeds data to the morton reorder stage
 */
void pipeline_feature_stage(
    hls::stream<VoxelData> &feature_data_in,
    hls::stream<ap_uint<MORTON_BITS>> &morton_addrs_in,
    hls::stream<MemRequest> &mem_requests_out,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> &features_stored)
{
#pragma HLS INLINE off
#pragma HLS INTERFACE axis port = feature_data_in
#pragma HLS INTERFACE axis port = morton_addrs_in
#pragma HLS INTERFACE axis port = mem_requests_out
#pragma HLS INTERFACE bram port = morton_list
    features_stored = 0;
    ap_uint<32> request_id_counter = 0;
#ifndef __SYNTHESIS__
    std::cout << "Pipeline feature stage: Starting feature buffer management" << std::endl;
#endif
// process incoming voxel data and store in feature buffers
FEATURE_PROCESSING:
    while (!feature_data_in.empty() && !morton_addrs_in.empty())
    {
#pragma HLS PIPELINE II = 1
        VoxelData voxel = feature_data_in.read();
        ap_uint<MORTON_BITS> morton_addr = morton_addrs_in.read();
        // store in local BRAM buffers if we have space
        if (features_stored < MAX_VOXELS_L0)
        {
            morton_list[features_stored] = morton_addr;
        // generates memory write requests for each feature for DRAM backup
        GENERATE_MEM_REQUESTS:
            for (int f = 0; f < FEATURE_DIM; f++)
            {
#pragma HLS UNROLL factor = 4
                MemRequest write_req;
                write_req.morton_addr = morton_addr;
                write_req.is_write = 1;
                write_req.request_id = request_id_counter++;
                write_req.should_store = 1;
                write_req.data = *((ap_uint<32> *)&voxel.features[f]); // Cast float to uint32
                if (!mem_requests_out.full())
                {
                    mem_requests_out.write(write_req);
                }
                else
                {
#ifndef __SYNTHESIS__
                    std::cout << "Warning: Memory request stream full" << std::endl;
#endif
                }
            }
            features_stored++;
            if (features_stored <= 5)
            {
#ifndef __SYNTHESIS__
                std::cout << "Stored feature " << features_stored - 1 << " morton=0x"
                          << std::hex << morton_addr << std::dec << std::endl;
#endif
            }
        }
        else
        {
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
/**
 * pipeline stage 3: morton reorder buffer
 * reorders memory access using morton codes for better spatial locality
 * send triggers to convolution stage when data is ready
 */
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
    PrunedBitmapInfo &bitmap_info)
{
#pragma HLS INLINE off
#pragma HLS INTERFACE axis port = mem_requests_in
#pragma HLS INTERFACE axis port = retained_blocks_in
#pragma HLS INTERFACE axis port = trigger_out
#pragma HLS INTERFACE axis port = response_in
#pragma HLS INTERFACE axis port = bitmap_interface_out
#pragma HLS INTERFACE axis port = mem_response_out
#pragma HLS INTERFACE m_axi port=feature_dram bundle=gmem_morton \
    max_write_burst_length=256 num_write_outstanding=32
#pragma HLS INTERFACE bram port = L3_bitmap
#pragma HLS INTERFACE bram port = L2_bitmap_pruned
#pragma HLS INTERFACE bram port = L1_bitmap_pruned
#pragma HLS INTERFACE bram port = L0_bitmap_pruned
    // static variables to maintain state across calls
    static StreamingPointers access_pointers;
    static ap_uint<1> pointers_initialized = 0;
    static ap_uint<32> total_voxels_ready = 0;
#ifndef __SYNTHESIS__
    std::cout << "Pipeline morton stage: Starting sophisticated morton reorder buffer" << std::endl;
#endif
    // initialise streaming pointers for octree traversal
    if (!pointers_initialized)
    {
        initialize_streaming_pointers(access_pointers);
        pointers_initialized = 1;
    }
    ap_uint<1> enable_flag = 1;
    // Call the main Morton reorder buffer - this handles memory optimization and triggering
    integrated_morton_reorder_buffer_with_triggers(
        mem_requests_in,      // Memory requests from feature stage
        bitmap_interface_out, // Interface signals for bitmap access
        retained_blocks_in,   // Block info from bitmap stage
        mem_response_out,     // Memory responses
        trigger_out,          // Convolution triggers
        response_in,          // Responses from convolution stage
        feature_dram,         // External DRAM interface
        L3_bitmap,
        L2_bitmap_pruned,
        L1_bitmap_pruned,
        L0_bitmap_pruned,
        bitmap_info,
        access_pointers, // Streaming pointers for efficient traversal
        enable_flag);
#ifndef __SYNTHESIS__
    std::cout << "Pipeline morton stage: Completed sophisticated morton reordering" << std::endl;
#endif
}
/**
 * pipeline stage 4: convolution processing
 * performs sparse 3D convolution using systolic arrays and z-buffer approach
 * this is the final computation stage
 */
void pipeline_convolution_stage(
    hls::stream<ConvolutionTrigger> &trigger_in,
    hls::stream<ConvolutionResponse> &response_out,
    hls::stream<EarlyTriggerSignal> &early_trigger_in,
    hls::stream<MortonBitmapInterface> &bitmap_interface_in,
    hls::stream<MemResponse> &mem_response_in,
    ap_uint<MORTON_BITS> *morton_list,
    float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
    float bias[FEATURE_DIM],
    ap_uint<BRAM_WIDTH> *L3_bitmap_conv,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned_conv,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned_conv,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned_conv,
    PrunedBitmapInfo &bitmap_info,
    ap_uint<32> available_voxels,
    ap_uint<32> &voxels_processed,
    ap_uint<32> *feature_dram_read,
    ap_uint<32> *feature_dram_write)
{
#pragma HLS INLINE off
#pragma HLS INTERFACE axis port = trigger_in
#pragma HLS INTERFACE axis port = response_out
#pragma HLS INTERFACE axis port = early_trigger_in
#pragma HLS INTERFACE axis port = bitmap_interface_in
#pragma HLS INTERFACE axis port = mem_response_in
#pragma HLS INTERFACE bram port = morton_list
#pragma HLS INTERFACE bram port = L3_bitmap_conv
#pragma HLS INTERFACE bram port = L2_bitmap_pruned_conv
#pragma HLS INTERFACE bram port = L1_bitmap_pruned_conv
#pragma HLS INTERFACE bram port = L0_bitmap_pruned_conv
#pragma HLS INTERFACE m_axi port=feature_dram_read bundle=gmem_conv_read \
    max_read_burst_length=256 num_read_outstanding=32
    #pragma HLS INTERFACE m_axi port=feature_dram_write bundle=gmem_conv_write \
    max_write_burst_length=256 num_write_outstanding=32
    // static state for convolution stage
    static StreamingPointers access_pointers;
    static ap_uint<1> computation_active = 0;
    static ap_uint<1> pointers_initialized = 0;
#ifndef __SYNTHESIS__
    std::cout << "Pipeline convolution stage: Starting sophisticated convolution engine" << std::endl;
#endif
    // initialize pointers for octree navigation
    if (!pointers_initialized)
    {
        initialize_streaming_pointers(access_pointers);
        pointers_initialized = 1;
    }
    // Main convolution processing - event-driven systolic array
    event_driven_systolic_array_with_triggers(
        morton_list,      // Morton-ordered voxel list
        voxels_processed, // Output: number processed
        L3_bitmap_conv,   // Octree bitmaps for neighbor lookup
        L2_bitmap_pruned_conv,
        L1_bitmap_pruned_conv,
        L0_bitmap_pruned_conv,
        bitmap_info,        // Bitmap size info
        access_pointers,    // Pointers for efficient traversal
        weights,            // Convolution weights
        bias,               // Convolution bias
        trigger_in,         // Triggers from Morton stage
        response_out,       // Responses back to Morton stage
        early_trigger_in,   // Early triggers from bitmap stage
        available_voxels,   // Number of voxels ready for processing
        computation_active, // Current computation status
        feature_dram_read,
        feature_dram_write
        );

    while (!bitmap_interface_in.empty())
    {
        MortonBitmapInterface interface = bitmap_interface_in.read();
#ifndef __SYNTHESIS__
        std::cout << "Consumed bitmap interface signal" << std::endl;
#endif
    }
    // consume memory responses, for synchronization
    while (!mem_response_in.empty())
    {
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
// pipeline control variables - maintain state across function calls
static ap_uint<1> pipeline_active = 0;
static ap_uint<1> finalization_done = 0;
/**
 * top level pipeline function
 * orchestrates the entire 4 stage octree convolution pipeline
 * this is the main entry point called from the testbench
 */
void complete_octree_pipeline(
    hls::stream<VoxelData> &sensor_data,
    ap_uint<32> *feature_dram_morton_write,
    ap_uint<32> *feature_dram_conv_read,
    ap_uint<32> *feature_dram_conv_write,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    float conv_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
    float conv_bias[FEATURE_DIM],
    ap_uint<1> start,
    ap_uint<1> *done)
{
#pragma HLS INTERFACE axis port = sensor_data
#pragma HLS INTERFACE m_axi port = feature_dram_morton_write depth = 134217728 bundle = gmem_morton_write \
    max_write_burst_length = 256 offset = slave
#pragma HLS INTERFACE m_axi port = feature_dram_conv_read depth = 134217728 bundle = gmem_conv_read \
    max_read_burst_length = 256 offset = slave  
#pragma HLS INTERFACE m_axi port = feature_dram_conv_write depth = 134217728 bundle = gmem_conv_write \
    max_write_burst_length = 256 offset = slave
#pragma HLS INTERFACE bram port = L3_bitmap
#pragma HLS INTERFACE bram port = L2_bitmap_pruned
#pragma HLS INTERFACE bram port = L1_bitmap_pruned
#pragma HLS INTERFACE bram port = L0_bitmap_pruned
#pragma HLS INTERFACE s_axilite port = start
#pragma HLS INTERFACE s_axilite port = done
#pragma HLS INTERFACE s_axilite port = return
    // static streams for inter-stage communication
    static hls::stream<VoxelData> feature_data_stream("feature_data_main");
    static hls::stream<ap_uint<MORTON_BITS>> morton_addrs_stream("morton_addrs_main");
    static hls::stream<RetainedBlockInfo> retained_blocks_stream("retained_blocks_main");
    static hls::stream<MemRequest> mem_requests_stream("mem_requests_main");
    static hls::stream<EarlyTriggerSignal> early_trigger_stream("early_trigger_main");
    static hls::stream<MortonBitmapInterface> bitmap_interface_stream("bitmap_interface_main");
    static hls::stream<MemResponse> mem_response_stream("mem_response_main");
#pragma HLS STREAM variable = feature_data_stream depth = 1024
#pragma HLS STREAM variable = morton_addrs_stream depth = 1024
#pragma HLS STREAM variable = retained_blocks_stream depth = 256
#pragma HLS STREAM variable = mem_requests_stream depth = 512
#pragma HLS STREAM variable = early_trigger_stream depth = 64
#pragma HLS STREAM variable = bitmap_interface_stream depth = 32
#pragma HLS STREAM variable = mem_response_stream depth = 128
    static ap_uint<MORTON_BITS> morton_list[MAX_VOXELS_L0];
    static PrunedBitmapInfo bitmap_info;
    // seperate bitmap copies for convolution stage (to avoid read/write conflicts)
    static ap_uint<BRAM_WIDTH> L3_bitmap_conv[L3_WORDS];
    static ap_uint<BRAM_WIDTH> L2_bitmap_pruned_conv[1024];
    static ap_uint<BRAM_WIDTH> L1_bitmap_pruned_conv[1024];
    static ap_uint<BRAM_WIDTH> L0_bitmap_pruned_conv[1024];
// specify BRAM implementation for these arrays
#pragma HLS BIND_STORAGE variable = L3_bitmap_conv type = ram_2p impl = bram
#pragma HLS BIND_STORAGE variable = L2_bitmap_pruned_conv type = ram_2p impl = bram
#pragma HLS BIND_STORAGE variable = L1_bitmap_pruned_conv type = ram_2p impl = bram
#pragma HLS BIND_STORAGE variable = L0_bitmap_pruned_conv type = ram_2p impl = bram
#pragma HLS BIND_STORAGE variable = morton_list type = ram_2p impl = bram
    // pipeline status counters
    static ap_uint<32> processed_voxels = 0;
    static ap_uint<32> features_stored = 0;
    static ap_uint<32> voxels_processed = 0;
    static ap_uint<32> pipeline_cycles = 0;
    // trigger/response streams for convolution coordination
    static hls::stream<ConvolutionTrigger> conv_trigger_stream("conv_trigger");
    static hls::stream<ConvolutionResponse> conv_response_stream("conv_response");
#pragma HLS STREAM variable = conv_trigger_stream depth = 8
#pragma HLS STREAM variable = conv_response_stream depth = 8

    *done = 0;

    // initialization phae - triggered by start signal
    if (start && !pipeline_active)
    {
#ifndef __SYNTHESIS__
        std::cout << "=== COMPLETE OCTREE PIPELINE STARTING ===" << std::endl;
#endif
        pipeline_active = 1;
        finalization_done = 0;
        processed_voxels = 0;
        features_stored = 0;
        voxels_processed = 0;
        pipeline_cycles = 0;
    // initialize all bitmap arrays to zero
    INIT_L3:
        for (int i = 0; i < L3_WORDS; i++)
        {
#pragma HLS PIPELINE II = 1
            L3_bitmap[i] = 0;
        }
    INIT_L2:
        for (int i = 0; i < 1024; i++)
        {
#pragma HLS PIPELINE II = 1
            L2_bitmap_pruned[i] = 0;
        }
    INIT_L1:
        for (int i = 0; i < 1024; i++)
        {
#pragma HLS PIPELINE II = 1
            L1_bitmap_pruned[i] = 0;
        }
    INIT_L0:
        for (int i = 0; i < 1024; i++)
        {
#pragma HLS PIPELINE II = 1
            L0_bitmap_pruned[i] = 0;
        }
        // initialize bitmap size info
        bitmap_info.L3_size = 0;
        bitmap_info.L2_size = 0;
        bitmap_info.L1_size = 0;
        bitmap_info.L0_size = 0;
        bitmap_info.total_size = 0;
#ifndef __SYNTHESIS__
        std::cout << "Initialization complete, starting dataflow pipeline" << std::endl;
#endif
    }
    // MAIN PROCESSING PHAE, run dataflow pipeline
    if (pipeline_active && !finalization_done)
    {
        // continue processing while we have input data or haven't reached cycle limit
        if (!sensor_data.empty() || pipeline_cycles < 1000)
        {
            run_dataflow_pipeline(
                sensor_data,
                feature_data_stream,
                morton_addrs_stream,
                retained_blocks_stream,
                mem_requests_stream,
                conv_trigger_stream,  // triggers for convolution
                conv_response_stream, // responses from convolution
                early_trigger_stream,
                bitmap_interface_stream,
                mem_response_stream,
                morton_list,
                conv_weights,
                conv_bias,
                L3_bitmap, // bitmap stage bitmaps
                L2_bitmap_pruned,
                L1_bitmap_pruned,
                L0_bitmap_pruned,
                L3_bitmap_conv, // convolution stage bitmaps
                L2_bitmap_pruned_conv,
                L1_bitmap_pruned_conv,
                L0_bitmap_pruned_conv,
                bitmap_info,
                feature_dram_morton_write,
                feature_dram_conv_read,
                feature_dram_conv_write,
                processed_voxels,
                features_stored,
                voxels_processed);
            pipeline_cycles++;

            // check if we should transition to finalization
            if (sensor_data.empty() && processed_voxels > 0 &&
                feature_data_stream.empty() && morton_addrs_stream.empty() &&
                retained_blocks_stream.empty() && mem_requests_stream.empty())
            {
#ifndef __SYNTHESIS__
                std::cout << "All streams empty, transitioning to finalize" << std::endl;
                std::cout << "Final counts - processed_voxels:" << processed_voxels
                          << " features_stored:" << features_stored
                          << " voxels_processed:" << voxels_processed << std::endl;
#endif
            }
        }

        // finalization stage - check if all processing is complete
        bool all_streams_empty = sensor_data.empty() && feature_data_stream.empty() &&
                                 morton_addrs_stream.empty() && retained_blocks_stream.empty() &&
                                 mem_requests_stream.empty();
        if (all_streams_empty && processed_voxels > 0)
        {
            // write final results to DRAM and signal completion
            *done = 1;
            pipeline_active = 0;
            finalization_done = 1;
        }
    }
}
/**
 * Utility function to copy bitmaps between different memory regions
 * Used to avoid read/write conflicts when same bitmap is used by multiple stages
 */
void copy_bitmaps_for_convolution(
    ap_uint<BRAM_WIDTH> *src_L3, ap_uint<BRAM_WIDTH> *dst_L3,
    ap_uint<BRAM_WIDTH> *src_L2, ap_uint<BRAM_WIDTH> *dst_L2,
    ap_uint<BRAM_WIDTH> *src_L1, ap_uint<BRAM_WIDTH> *dst_L1,
    ap_uint<BRAM_WIDTH> *src_L0, ap_uint<BRAM_WIDTH> *dst_L0,
    PrunedBitmapInfo &bitmap_info)
{
#pragma HLS INLINE off
    // copy l3 bitmap, always full
COPY_L3:
    for (int i = 0; i < L3_WORDS; i++)
    {
#pragma HLS PIPELINE II = 1
        dst_L3[i] = src_L3[i];
    }
    // copy l2 bitmap (only copy used words based on bitmap_info)
    int l2_words = (bitmap_info.L2_size + BRAM_WIDTH - 1) / BRAM_WIDTH;
COPY_L2:
    for (int i = 0; i < l2_words && i < 1024; i++)
    {
#pragma HLS PIPELINE II = 1
        dst_L2[i] = src_L2[i];
    }
    // copy l1 bitmap
    int l1_words = (bitmap_info.L1_size + BRAM_WIDTH - 1) / BRAM_WIDTH;
COPY_L1:
    for (int i = 0; i < l1_words && i < 1024; i++)
    {
#pragma HLS PIPELINE II = 1
        dst_L1[i] = src_L1[i];
    }
    // copy l0 bitmap
    int l0_words = (bitmap_info.L0_size + BRAM_WIDTH - 1) / BRAM_WIDTH;
COPY_L0:
    for (int i = 0; i < l0_words && i < 1024; i++)
    {
#pragma HLS PIPELINE II = 1
        dst_L0[i] = src_L0[i];
    }
}

/**
 * dataflow pipeline function
 * runs all 4 pipeline stages in paralel using HLS DATAFLOW pragma
 * all stages run concurrently
 */
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
    ap_uint<MORTON_BITS> *morton_list,
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
    ap_uint<32> *feature_dram_morton_write,
    ap_uint<32> *feature_dram_conv_read,
    ap_uint<32> *feature_dram_conv_write,
    ap_uint<32> &processed_voxels,
    ap_uint<32> &features_stored,
    ap_uint<32> &voxels_processed)
{

#pragma HLS DATAFLOW // runs in parallel

    // Stage 1: Build octree bitmaps from streaming voxel data
    pipeline_bitmap_stage(
        sensor_data,            // Input: raw voxel stream
        feature_data_stream,    // Output: valid voxel features
        morton_addrs_stream,    // Output: Morton addresses
        retained_blocks_stream, // Output: block information
        early_trigger_stream,   // Output: early trigger signals
        L3_bitmap,
        L2_bitmap_pruned,
        L1_bitmap_pruned,
        L0_bitmap_pruned,
        bitmap_info,
        processed_voxels);

    // Stage 2: Store features in BRAM and generate memory requests
    pipeline_feature_stage(
        feature_data_stream, // Input: valid voxel features
        morton_addrs_stream, // Input: Morton addresses
        mem_requests_stream, // Output: memory requests
        morton_list,         // Output: Morton-ordered list
        features_stored);

    // Stage 3: Reorder memory accesses and send convolution triggers
    pipeline_morton_stage(
        mem_requests_stream,     // Input: memory requests
        retained_blocks_stream,  // Input: block information
        conv_trigger_stream,     // Output: convolution triggers
        conv_response_stream,    // Input: convolution responses
        bitmap_interface_stream, // Output: bitmap interface signals
        mem_response_stream,     // Output: memory responses
        feature_dram_morton_write,            // External DRAM interface
        L3_bitmap,
        L2_bitmap_pruned,
        L1_bitmap_pruned,
        L0_bitmap_pruned,
        bitmap_info);

    // Stage 4: Perform sparse 3D convolution computation
    pipeline_convolution_stage(
        conv_trigger_stream,     // Input: convolution triggers
        conv_response_stream,    // Output: convolution responses
        early_trigger_stream,    // Input: early trigger signals
        bitmap_interface_stream, // Input: bitmap interface signals
        mem_response_stream,     // Input: memory responses
        morton_list,             // Input: Morton-ordered list
        conv_weights,
        conv_bias,
        L3_bitmap_conv, // Separate bitmap copies for convolution
        L2_bitmap_pruned_conv,
        L1_bitmap_pruned_conv,
        L0_bitmap_pruned_conv,
        bitmap_info,
        features_stored,  // Input: number of features available
        voxels_processed, // Output: number processed
        feature_dram_conv_read,
        feature_dram_conv_write);
}