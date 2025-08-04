#include "morton_reorder_buffer.h"
#include "dynamic_access.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
void integrated_morton_reorder_buffer_with_triggers(
    hls::stream<MemRequest> &req_in,
    hls::stream<MortonBitmapInterface> &bitmap_interface,
    hls::stream<RetainedBlockInfo> &retained_blocks_in,
    hls::stream<MemResponse> &resp_out,
    hls::stream<ConvolutionTrigger> &trigger_out,
    hls::stream<ConvolutionResponse> &response_in,
    ap_uint<32> *feature_dram,
    ap_uint<BRAM_WIDTH> *L3_bitmap_bram,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned_bram,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned_bram,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned_bram,
    PrunedBitmapInfo &bitmap_info,
    StreamingPointers &access_pointers,
    ap_uint<1> enable)
{
#pragma HLS INTERFACE axis port = req_in
#pragma HLS INTERFACE axis port = bitmap_interface
#pragma HLS INTERFACE axis port = retained_blocks_in
#pragma HLS INTERFACE axis port = resp_out
#pragma HLS INTERFACE axis port = trigger_out
#pragma HLS INTERFACE axis port = response_in
#pragma HLS INTERFACE m_axi port=feature_dram depth=134217728 bundle=gmem0 \
    max_read_burst_length=256 max_write_burst_length=256 \
    num_read_outstanding=32 num_write_outstanding=32 \
    latency=32 offset=slave
#pragma HLS INTERFACE bram port = L3_bitmap_bram
#pragma HLS INTERFACE bram port = L2_bitmap_pruned_bram
#pragma HLS INTERFACE bram port = L1_bitmap_pruned_bram
#pragma HLS INTERFACE bram port = L0_bitmap_pruned_bram
#pragma HLS INTERFACE s_axilite port = enable
#pragma HLS INTERFACE s_axilite port = return
    static MortonBufferEntry buffer[MORTON_BUFFER_SIZE];
#pragma HLS ARRAY_PARTITION variable = buffer cyclic factor=16
    static MortonDramMapping mapping_table[MORTON_BUFFER_SIZE];
#pragma HLS BIND_STORAGE variable = mapping_table type = ram_2p impl=bram
    static MortonBufferStatus buffer_status;
    static ap_uint<8> buffer_fill = 0;
    static ap_uint<32> mapping_count = 0;
    static ap_uint<8> next_req_id = 0;
    static ap_uint<32> ready_for_systolic = 0;
    static MemResponse pending_responses[MORTON_BUFFER_SIZE];
    static ap_uint<1> response_valid[MORTON_BUFFER_SIZE];
    static ap_uint<32> burst_buffer[256];
    #pragma HLS ARRAY_PARTITION variable=burst_buffer cyclic factor=16
        static ap_uint<32> total_voxels_received = 0; 
#pragma HLS ARRAY_PARTITION variable = response_valid complete
CONSUME_WRITE_REQUESTS:
    while (!req_in.empty()) {
        MemRequest req = req_in.read();
    }
    if (!enable)
        return;
    if (!access_pointers.initialized) {
        initialize_streaming_pointers(access_pointers);
    }
        #ifndef __SYNTHESIS__
    std::cout << "morton_reorder_buffer: buffer_fill=" << buffer_fill
              << " retained_blocks_empty=" << retained_blocks_in.empty() << std::endl;
             std::cout << "Bitmap sizes - L0:" << bitmap_info.L0_size 
              << " L1:" << bitmap_info.L1_size << " L2:" << bitmap_info.L2_size << std::endl;
    #endif
    bool more_data_available = true;
    while (more_data_available)
    {
        while (!retained_blocks_in.empty() && buffer_fill < MORTON_BUFFER_SIZE)
        {
#pragma HLS PIPELINE II = 1
            RetainedBlockInfo retained = retained_blocks_in.read();
            if (retained.morton_code == 0xFFFFFFFFFFFFFFFF)
            {
                #ifndef __SYNTHESIS__
                std::cout << "Morton buffer: Received end marker" << std::endl;
                #endif
                more_data_available = false;
                break;
            }
            ap_uint<32> x, y, z;
            morton_decode(retained.morton_code, x, y, z);
            if (x >= DIM_L0 || y >= DIM_L0 || z >= DIM_L0) {
                #ifndef __SYNTHESIS__
                std::cout << "Warning: Invalid morton code, skipping" << std::endl;
                #endif
                continue;
            }
            MortonBufferEntry entry;
            entry.request.morton_addr = retained.morton_code;
            entry.request.is_write = 0;
            entry.valid = 1;
            entry.is_retained = 1;
            entry.dram_offset = retained.dram_offset;
            entry.access_priority = ready_for_systolic++;
            buffer[buffer_fill] = entry;
            buffer_fill++;
            MemResponse response;
            response.request_id = buffer_fill;
            response.data = retained.dram_offset;
            if (!resp_out.full()) {
                resp_out.write(response);
            }
            MortonBitmapInterface interface;
            interface.should_enqueue = 1;
            interface.access_request = 1;
            interface.target_morton = retained.morton_code;
            interface.access_granted = 1;
            if (!bitmap_interface.full()) {
                bitmap_interface.write(interface);
            }
            ap_uint<32> l2_x = x >> 2, l2_y = y >> 2, l2_z = z >> 2;
            access_pointers.current_l2_idx = l2_z * 4 + l2_y * 2 + l2_x;
            ap_uint<8> block_voxels = retained.valid_voxels;
            for (int i = 0; i < 8; i++) {
                if (block_voxels[i]) {
                    total_voxels_received++;
                }
            }
            mapping_table[mapping_count].morton_code = retained.morton_code;
            mapping_table[mapping_count].dram_offset = retained.dram_offset;
            mapping_table[mapping_count].valid = 1;
            mapping_count++;
        }
        if (buffer_fill > 0)
        {
            #ifndef __SYNTHESIS__
            std::cout << "Processing batch of " << buffer_fill << " blocks" << std::endl;
            #endif
            ConvolutionTrigger trigger;
            trigger.start_processing = 1;
            trigger.available_voxels = total_voxels_received;
            trigger.data_ready = 1;
            #ifndef __SYNTHESIS__
            std::cout << "Sending trigger: available_voxels=" << trigger.available_voxels
                      << " (from " << buffer_fill << " blocks)" << std::endl;
                      #endif
            if (!trigger_out.full())
            {
                trigger_out.write(trigger);
            }
            for (int i = 0; i < buffer_fill; i++)
            {
                if (!buffer[i].valid || !buffer[i].is_retained)
                    continue;
                ap_uint<32> read_addr = INPUT_FEATURE_REGION_START + buffer[i].dram_offset;
                if (mapping_count <= 64 || i < 5)
                {
                    #ifndef __SYNTHESIS__
                    std::cout << "Would read from DRAM addr: " << read_addr
                              << " for morton: " << buffer[i].request.morton_addr << std::endl;
                              #endif
                }
                buffer[i].valid = 0;
            }
            buffer_fill = 0;
        }
        while (!response_in.empty()) {
            ConvolutionResponse response = response_in.read();
            #ifndef __SYNTHESIS__
            std::cout << "Morton received completion: processed=" << response.voxels_processed << std::endl;
            #endif
            if (response.processing_complete) {
                total_voxels_received = 0;
            }
        }
        if (!more_data_available)
        {
            #ifndef __SYNTHESIS__
            std::cout << "Morton buffer: No more retained blocks to process" << std::endl;
            #endif
            break;
        }
        if (retained_blocks_in.empty() && buffer_fill == 0)
        {
            static int empty_count = 0;
            empty_count++;
            if (empty_count > 100)
            {
                #ifndef __SYNTHESIS__
                std::cout << "Morton buffer: No data for " << empty_count << " iterations, assuming done" << std::endl;
                #endif
                if (mapping_count > 0)
                {
                    more_data_available = false;
                }
                empty_count = 0;
            }
        }
        else
        {
            static int empty_count = 0;
            empty_count = 0;
        }
    }
    #ifndef __SYNTHESIS__
    std::cout << "Morton buffer: Sending final completion signal" << std::endl;
    #endif
     ConvolutionTrigger final_trigger;
    final_trigger.start_processing = 0;
    final_trigger.available_voxels = 0;
    final_trigger.data_ready = 0;
    if (!trigger_out.full())
    {
        trigger_out.write(final_trigger);
    }
}
void process_retained_blocks_only(
    hls::stream<RetainedBlockInfo> &retained_blocks,
    MortonBufferEntry buffer[MORTON_BUFFER_SIZE],
    MortonDramMapping mapping_table[MORTON_BUFFER_SIZE],
    ap_uint<32> &buffer_fill,
    ap_uint<32> &mapping_count)
{
#pragma HLS INLINE off
PROCESS_RETAINED_LOOP:
    while (!retained_blocks.empty() && buffer_fill < MORTON_BUFFER_SIZE)
    {
#pragma HLS PIPELINE II = 1
        RetainedBlockInfo info = retained_blocks.read();
        MortonBufferEntry entry;
        entry.request.morton_addr = info.morton_code;
        entry.request.is_write = 0;
        entry.valid = 1;
        entry.is_retained = 1;
        entry.dram_offset = info.dram_offset;
        entry.access_priority = buffer_fill;
        buffer[buffer_fill] = entry;
        mapping_table[mapping_count] = {info.morton_code, info.dram_offset, 1};
        buffer_fill++;
        mapping_count++;
    }
}
void optimized_dram_burst_retained(
    MortonBufferEntry buffer[MORTON_BUFFER_SIZE],
    ap_uint<32> *feature_dram,
    ap_uint<32> buffer_fill,
    hls::stream<MemResponse> &resp_out)
{
#pragma HLS INLINE off
SORT_MORTON:
    for (int i = 0; i < buffer_fill - 1; i++)
    {
        for (int j = 0; j < buffer_fill - i - 1; j++)
        {
#pragma HLS PIPELINE II = 1
            if (buffer[j].valid && buffer[j + 1].valid &&
                buffer[j].request.morton_addr > buffer[j + 1].request.morton_addr)
            {
                MortonBufferEntry temp = buffer[j];
                buffer[j] = buffer[j + 1];
                buffer[j + 1] = temp;
            }
        }
    }
    ap_uint<32> burst_data[64];
    ap_uint<32> burst_start = 0;
    ap_uint<32> burst_len = 0;
BURST_PROCESS:
    for (int i = 0; i < buffer_fill; i++)
    {
#pragma HLS PIPELINE II = 1
        if (!buffer[i].valid || !buffer[i].is_retained)
            continue;
        ap_uint<32> dram_addr = buffer[i].dram_offset;
        if (burst_len == 0 || (dram_addr == burst_start + burst_len && burst_len < 64))
        {
            if (burst_len == 0)
                burst_start = dram_addr;
            burst_len++;
        }
        else
        {
            if (burst_len > 0)
            {
            BURST_READ:
                for (int j = 0; j < burst_len; j++)
                {
#pragma HLS UNROLL factor = 16
                    burst_data[j] = feature_dram[burst_start + j];
                }
                MemResponse response;
                response.request_id = i;
                response.data = burst_start;
                if (!resp_out.full()) {
                    resp_out.write(response);
                }
            }
            burst_start = dram_addr;
            burst_len = 1;
        }
    }
    if (burst_len > 0)
    {
    FINAL_BURST:
        for (int j = 0; j < burst_len; j++)
        {
#pragma HLS UNROLL factor = 16
            burst_data[j] = feature_dram[burst_start + j];
        }
        MemResponse response;
        response.request_id = buffer_fill;
        response.data = burst_start;
        if (!resp_out.full()) {
            resp_out.write(response);
        }
    }
}
