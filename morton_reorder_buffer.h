#ifndef MORTON_REORDER_BUFFER_H
#define MORTON_REORDER_BUFFER_H
#ifndef __SYNTHESIS__
#include <iostream>
#endif
#include <ap_int.h>
#include <hls_stream.h>
#include "octree_master.h"
#include "streaming_bitmap_constructor.h"
struct MortonBufferEntry
{
    MemRequest request;
    ap_uint<1> valid;
    ap_uint<1> is_retained;
    ap_uint<32> dram_offset;
    ap_uint<32> access_priority;
};
struct MortonDramMapping
{
    ap_uint<MORTON_BITS> morton_code;
    ap_uint<32> dram_offset;
    ap_uint<1> valid;
};
struct MortonBufferStatus
{
    ap_uint<32> ready_entries;
    ap_uint<32> pending_reads;
    ap_uint<1> burst_ready;
    ap_uint<MORTON_BITS> next_burst_addr;
    ap_uint<32> retained_blocks_only;
};
void integrated_morton_reorder_buffer_with_triggers(
    hls::stream<MemRequest> &req_in,
    hls::stream<MortonBitmapInterface> &bitmap_interface,
    hls::stream<RetainedBlockInfo> &retained_blocks_in,
    hls::stream<MemResponse> &resp_out,
    hls::stream<ConvolutionTrigger> &trigger_out,
    hls::stream<ConvolutionResponse> &response_in, ap_uint<32> *feature_dram,
    ap_uint<BRAM_WIDTH> *L3_bitmap_bram,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned_bram,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned_bram,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned_bram,
    PrunedBitmapInfo &bitmap_info,
    StreamingPointers &access_pointers,
    ap_uint<1> enable);
void process_retained_blocks_only(
    hls::stream<RetainedBlockInfo> &retained_blocks,
    MortonBufferEntry buffer[MORTON_BUFFER_SIZE],
    MortonDramMapping mapping_table[MORTON_BUFFER_SIZE],
    ap_uint<32> &buffer_fill,
    ap_uint<32> &mapping_count);
void optimized_dram_burst_retained(
    MortonBufferEntry buffer[MORTON_BUFFER_SIZE],
    ap_uint<32> *feature_dram,
    ap_uint<32> buffer_fill,
    hls::stream<MemResponse> &resp_out);
void update_row_buffer_stats(ap_uint<MORTON_BITS> current_morton,
                             ap_uint<MORTON_BITS> previous_morton);
#endif
