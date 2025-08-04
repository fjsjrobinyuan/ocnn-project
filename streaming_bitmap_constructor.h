#ifndef STREAMING_BITMAP_CONSTRUCTOR_H
#define STREAMING_BITMAP_CONSTRUCTOR_H
#include "octree_bitmap.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
#include <hls_stream.h>
#include "octree_master.h"
struct EarlyTriggerSignal
{
    ap_uint<1> valid_l0_ready;
    ap_uint<32> l0_region_idx;
    ap_uint<32> voxel_count;
    ap_uint<MORTON_BITS> base_morton;
};
struct RetainedBlockInfo
{
    ap_uint<MORTON_BITS> morton_code;
    ap_uint<32> dram_offset;
    ap_uint<8> valid_voxels;
};
void streaming_bitmap_constructor(
    hls::stream<VoxelData> &voxel_stream,
    hls::stream<VoxelData> &feature_data_out,
    hls::stream<ap_uint<MORTON_BITS>> &write_addr_out,
    hls::stream<EarlyTriggerSignal> &early_trigger_out,
    hls::stream<RetainedBlockInfo> &retained_blocks_out,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    PrunedBitmapInfo &bitmap_info,
    ap_uint<32> &processed_input_voxels);
void process_z_plane_pair(
    ap_uint<32> z_pair_idx,
    VoxelData *z_plane_buffer,
    hls::stream<EarlyTriggerSignal> &early_trigger_out,
    hls::stream<RetainedBlockInfo> &retained_blocks_out,
    ap_uint<32> &retained_block_count,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    ap_uint<1> *L1_temp,
    ap_uint<1> *L2_temp,
    ap_uint<1> *L3_temp,
    ap_uint<32> &l3_write_pos,
    ap_uint<32> &l2_write_pos,
    ap_uint<32> &l1_write_pos,
    ap_uint<32> &l0_write_pos,
    hls::stream<VoxelData> &feature_data_out,
    hls::stream<ap_uint<MORTON_BITS>> &write_addr_out);
void process_l1_to_l2_pruning(
    ap_uint<32> z_pair_idx,
    ap_uint<1> *L1_temp,
    ap_uint<1> *L2_temp,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<32> &l1_write_pos);
void process_l2_to_l3_pruning(
    ap_uint<32> l3_block_idx,
    ap_uint<1> *L2_temp,
    ap_uint<1> *L3_temp,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<32> &l2_write_pos);
#endif
