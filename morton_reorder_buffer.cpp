#include "morton_reorder_buffer.h"
#include "dynamic_access.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif

/**
 * main morton reorder buffer with trigger coordination
 * this is the brain of stage 3 - it manages memory access optimization and coordinates with convolution stage
 * the "integrated" part means it combines memory reordering with trigger generation in one function
 */
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
#pragma HLS INTERFACE m_axi port = feature_dram depth = 134217728 bundle = gmem0 \
    max_read_burst_length = 256 max_write_burst_length = 256 num_read_outstanding = 32 num_write_outstanding = 32 latency = 32 offset = slave
#pragma HLS INTERFACE bram port = L3_bitmap_bram
#pragma HLS INTERFACE bram port = L2_bitmap_pruned_bram
#pragma HLS INTERFACE bram port = L1_bitmap_pruned_bram
#pragma HLS INTERFACE bram port = L0_bitmap_pruned_bram
#pragma HLS INTERFACE s_axilite port = enable
#pragma HLS INTERFACE s_axilite port = return

    // static storage arrays, these persist across function calls
    static MortonBufferEntry buffer[MORTON_BUFFER_SIZE];
#pragma HLS ARRAY_PARTITION variable = buffer cyclic factor = 16
    static MortonDramMapping mapping_table[MORTON_BUFFER_SIZE];
#pragma HLS BIND_STORAGE variable = mapping_table type = ram_2p impl = bram

    // control and status variables
    static MortonBufferStatus buffer_status;
    static ap_uint<8> buffer_fill = 0;         // how many entries in buffer
    static ap_uint<32> mapping_count = 0;      // how many mappings we've created
    static ap_uint<8> next_req_id = 0;         // for generating unique request ids
    static ap_uint<32> ready_for_systolic = 0; // priority counter for systolic array
    static MemResponse pending_responses[MORTON_BUFFER_SIZE];
    static ap_uint<1> response_valid[MORTON_BUFFER_SIZE];
    static ap_uint<32> burst_buffer[256]; // for optimized dram bursts
#pragma HLS ARRAY_PARTITION variable = burst_buffer cyclic factor = 16
    static ap_uint<32> total_voxels_received = 0; // total voxels we've processed
#pragma HLS ARRAY_PARTITION variable = response_valid complete

// Process memory write requests with Morton-based addressing
PROCESS_MORTON_WRITE_REQUESTS:
    while (!req_in.empty())
    {
        MemRequest req = req_in.read();

        if (req.is_write && req.should_store)
        {
            // Extract row information from Morton code for optimal placement
            MortonAddress morton_addr = extract_morton_address(req.morton_addr);

            // Calculate row-optimized DRAM address
            ap_uint<32> voxel_idx = req.request_id / FEATURE_DIM;
            ap_uint<32> feature_idx = req.request_id % FEATURE_DIM;
            ap_uint<32> write_addr = morton_to_dram_address(req.morton_addr, feature_idx);

            feature_dram[write_addr] = req.data;

            // Update row buffer hit statistics
            static ap_uint<MORTON_BITS> last_morton = 0;
            update_row_buffer_stats(req.morton_addr, last_morton);
            last_morton = req.morton_addr;

            // Send response back
            MemResponse write_resp;
            write_resp.request_id = req.request_id;
            write_resp.data = req.data;
            if (!resp_out.full())
            {
                resp_out.write(write_resp);
            }
        }
    }
    if (!enable)
        return;

    // initialize streaming pointers for octree traversal if needed
    if (!access_pointers.initialized)
    {
        initialize_streaming_pointers(access_pointers);
    }

#ifndef __SYNTHESIS__
    std::cout << "morton_reorder_buffer: buffer_fill=" << buffer_fill
              << " retained_blocks_empty=" << retained_blocks_in.empty() << std::endl;
    std::cout << "Bitmap sizes - L0:" << bitmap_info.L0_size
              << " L1:" << bitmap_info.L1_size << " L2:" << bitmap_info.L2_size << std::endl;
#endif

    bool more_data_available = true;

    // main processing loop - keep going while we have data to process
    while (more_data_available)
    {
        // phase 1: collect retained blocks from bitmap stage into our buffer
        while (!retained_blocks_in.empty() && buffer_fill < MORTON_BUFFER_SIZE)
        {
#pragma HLS PIPELINE II = 1
            RetainedBlockInfo retained = retained_blocks_in.read();

            // check for end of data marker from bitmap stage
            if (retained.morton_code == 0xFFFFFFFFFFFFFFFF)
            {
#ifndef __SYNTHESIS__
                std::cout << "Morton buffer: Received end marker" << std::endl;
#endif
                more_data_available = false;
                break;
            }

            // decode morton code to make sure it's valid
            ap_uint<32> x, y, z;
            morton_decode(retained.morton_code, x, y, z);
            if (x >= DIM_L0 || y >= DIM_L0 || z >= DIM_L0)
            {
#ifndef __SYNTHESIS__
                std::cout << "Warning: Invalid morton code, skipping" << std::endl;
#endif
                continue;
            }

            // create buffer entry for this retained block
            MortonBufferEntry entry;
            entry.request.morton_addr = retained.morton_code;
            entry.request.is_write = 0;
            entry.valid = 1;
            entry.is_retained = 1;                        // this block has actual data
            entry.dram_offset = retained.dram_offset;     // where in dram to find this block
            entry.access_priority = ready_for_systolic++; // assign priority for processing order
            buffer[buffer_fill] = entry;
            buffer_fill++;

            // send a memory response
            MemResponse response;
            response.request_id = buffer_fill;
            response.data = retained.dram_offset;
            if (!resp_out.full())
            {
                resp_out.write(response);
            }

            // send bitmap interface signal
            MortonBitmapInterface interface;
            interface.should_enqueue = 1;
            interface.access_request = 1;
            interface.target_morton = retained.morton_code;
            interface.access_granted = 1;
            if (!bitmap_interface.full())
            {
                bitmap_interface.write(interface);
            }

            // update streaming pointers based on this block's location
            ap_uint<32> l2_x = x >> 2, l2_y = y >> 2, l2_z = z >> 2;
            access_pointers.current_l2_idx = l2_z * 4 + l2_y * 2 + l2_x;

            // count how many individual voxels this block contains
            ap_uint<8> block_voxels = retained.valid_voxels;
            for (int i = 0; i < 8; i++)
            {
                if (block_voxels[i])
                {
                    total_voxels_received++;
                }
            }

            // store mapping from morton code to dram localtion
            mapping_table[mapping_count].morton_code = retained.morton_code;
            mapping_table[mapping_count].dram_offset = retained.dram_offset;
            mapping_table[mapping_count].valid = 1;
            mapping_count++;
        }

        // phase 2: process the buffer when we have enough data
        if (buffer_fill > 0)
        {
#ifndef __SYNTHESIS__
            std::cout << "Processing batch of " << buffer_fill << " blocks" << std::endl;
#endif

            // send trigger to convolution stage, saying data is ready
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

            // process buffer entries with optimized dram burst reads
            if (buffer_fill > 0)
            {
                optimized_dram_burst_retained(buffer, feature_dram, buffer_fill, resp_out);
            }

            // mark all entries as processed
            for (int i = 0; i < buffer_fill; i++)
            {
                buffer[i].valid = 0;
            }

            // reset buffer for next batch
            buffer_fill = 0;
        }

        // phase 3: handle responses from convolution stage
        while (!response_in.empty())
        {
            ConvolutionResponse response = response_in.read();
#ifndef __SYNTHESIS__
            std::cout << "Morton received completion: processed=" << response.voxels_processed << std::endl;
#endif

            // if convolution is done, reset our voxel counter
            if (response.processing_complete)
            {
                total_voxels_received = 0;
            }
        }

        // phase 4: check if we should exit the main loop
        if (!more_data_available)
        {
#ifndef __SYNTHESIS__
            std::cout << "Morton buffer: No more retained blocks to process" << std::endl;
#endif
            break;
        }

        // timeout mechanism - if we haven't seen data for a while, assume we're done
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
            empty_count = 0; // reset timeout counter
        }
    }
#ifndef __SYNTHESIS__
    std::cout << "Morton buffer: Sending final completion signal" << std::endl;
#endif

    // send final trigger to convolution stage to indicate we are completely done
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
    // loop to collect retained blocks into buffer
PROCESS_RETAINED_LOOP:
    while (!retained_blocks.empty() && buffer_fill < MORTON_BUFFER_SIZE)
    {
#pragma HLS PIPELINE II = 1
        RetainedBlockInfo info = retained_blocks.read();

        // create buffer entry
        MortonBufferEntry entry;
        entry.request.morton_addr = info.morton_code;
        entry.request.is_write = 0;
        entry.valid = 1;
        entry.is_retained = 1;
        entry.dram_offset = info.dram_offset;
        entry.access_priority = buffer_fill; // simple priority scheme
        buffer[buffer_fill] = entry;

        // create mapping entry
        mapping_table[mapping_count] = {info.morton_code, info.dram_offset, 1};

        buffer_fill++;
        mapping_count++;
    }
}

/**
 * optimized dram burst reader for retained blocks
 * this tries to group nearby memory accesses into burst transactions for better bandwidth
 *
 */
void optimized_dram_burst_retained(
    MortonBufferEntry buffer[MORTON_BUFFER_SIZE],
    ap_uint<32> *feature_dram,
    ap_uint<32> buffer_fill,
    hls::stream<MemResponse> &resp_out)
{
#pragma HLS INLINE off
    ap_uint<32> burst_data[64];
    ap_uint<32> burst_start = 0;
    ap_uint<32> burst_len = 0;
    ap_uint<32> processed_entries = 0;
// Sort by row bits first for optimal DRAM row buffer utilization
SORT_BY_ROW_BITS:
    for (int i = 0; i < buffer_fill - 1; i++)
    {
        for (int j = 0; j < buffer_fill - i - 1; j++)
        {
#pragma HLS PIPELINE II = 1
            if (buffer[j].valid && buffer[j + 1].valid)
            {
                MortonAddress addr_j = extract_morton_address(buffer[j].request.morton_addr);
                MortonAddress addr_j1 = extract_morton_address(buffer[j + 1].request.morton_addr);

                bool should_swap = false;
                if (addr_j.row_bits > addr_j1.row_bits)
                {
                    should_swap = true;
                }
                else if (addr_j.row_bits == addr_j1.row_bits &&
                         addr_j.address_bits > addr_j1.address_bits)
                {
                    should_swap = true;
                }

                if (should_swap)
                {
                    MortonBufferEntry temp = buffer[j];
                    buffer[j] = buffer[j + 1];
                    buffer[j + 1] = temp;
                }
            }
        }
    }
BURST_PROCESS:
    for (int i = 0; i < buffer_fill; i++)
    {
#pragma HLS PIPELINE II = 1
        if (!buffer[i].valid || !buffer[i].is_retained)
            continue;

        ap_uint<32> dram_addr = INPUT_FEATURE_REGION_START + buffer[i].dram_offset;

        // check if this address can be added to current burst
        if (burst_len == 0 || (dram_addr == burst_start + burst_len * 8 * FEATURE_DIM && burst_len < 64))
        {
            // start new burst or extend current burst
            if (burst_len == 0)
                burst_start = dram_addr;
            burst_len++;
        }
        else
        {
            // current address doesn't fit in burst, so execute the current burst first
            if (burst_len > 0)
            {
            // read burst_len words starting at burst_start
            BURST_READ:
                for (int j = 0; j < burst_len * 8 * FEATURE_DIM; j++)
                {
#pragma HLS UNROLL factor = 16
                    burst_data[j] = feature_dram[burst_start + j];
                }

                // send responses for all entries in this burst
                for (int k = processed_entries; k < processed_entries + burst_len; k++)
                {
                    MemResponse response;
                    response.request_id = k;
                    response.data = burst_start + (k - processed_entries) * 8 * FEATURE_DIM;
                    if (!resp_out.full())
                    {
                        resp_out.write(response);
                    }
                }
                processed_entries += burst_len;
            }

            // start new burst
            burst_start = dram_addr;
            burst_len = 1;
        }
    }

    // handle final burst if there is one
    if (burst_len > 0)
    {
    FINAL_BURST:
        for (int j = 0; j < burst_len * 8 * FEATURE_DIM; j++)
        {
#pragma HLS UNROLL factor = 16
            burst_data[j] = feature_dram[burst_start + j];
        }

        for (int k = processed_entries; k < processed_entries + burst_len; k++)
        {
            MemResponse response;
            response.request_id = k;
            response.data = burst_data[k - processed_entries];
            if (!resp_out.full())
            {
                resp_out.write(response);
            }
        }
    }
}

void update_row_buffer_stats(ap_uint<MORTON_BITS> current_morton,
                             ap_uint<MORTON_BITS> previous_morton)
{
#pragma HLS INLINE
    static ap_uint<32> total_accesses = 0;
    static ap_uint<32> row_hits = 0;

    if (total_accesses > 0)
    {
        MortonAddress current_addr = extract_morton_address(current_morton);
        MortonAddress prev_addr = extract_morton_address(previous_morton);

        if (current_addr.row_bits == prev_addr.row_bits)
        {
            row_hits++;
        }
    }
    total_accesses++;
}
