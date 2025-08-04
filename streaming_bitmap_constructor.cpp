#include "streaming_bitmap_constructor.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
#define MICRO_BATCH_SIZE 16
void output_complete_block(
    int block_index,
    VoxelData micro_batch[MICRO_BATCH_SIZE],  
    hls::stream<VoxelData> &feature_data_out,
    hls::stream<ap_uint<MORTON_BITS>> &write_addr_out,
    hls::stream<RetainedBlockInfo> &retained_blocks_out,
    ap_uint<32> &retained_block_count,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    ap_uint<32> &l0_write_pos,
    ap_uint<1> *L1_temp)
{
#pragma HLS INLINE off
    VoxelData block_voxels[8];
    ap_uint<8> block_occupancy = 0;
    for (int bit_pos = 0; bit_pos < 8; bit_pos++) {
if (block_index < MICRO_BATCH_SIZE) {
    block_voxels[bit_pos] = micro_batch[block_index];
} else {
    block_voxels[bit_pos] = {0}; 
}        block_occupancy[bit_pos] = block_voxels[bit_pos].occupancy;
    }
    ap_uint<32> x0, y0, z0;
    morton_decode(block_voxels[0].morton_addr, x0, y0, z0);
    ap_uint<32> block_x = x0 / 2;
    ap_uint<32> block_y = y0 / 2;
    ap_uint<32> block_z = z0 / 2;
    ap_uint<32> l1_idx = block_z * DIM_L1 * DIM_L1 + block_y * DIM_L1 + block_x;
    L1_temp[l1_idx] = (block_occupancy != 0) ? 1 : 0;
    if (block_occupancy != 0) {
                #ifndef __SYNTHESIS__
        std::cout << "Block at (" << block_x << "," << block_y << "," << block_z 
                  << ") has occupancy: " << (int)block_occupancy << std::endl;
                  #endif
        for (int i = 0; i < 8; i++) {
            set_bit(L0_bitmap_pruned, l0_write_pos + i, block_occupancy[i]);
        }
        l0_write_pos += 8;
        for (int i = 0; i < 8; i++) {
            if (block_occupancy[i]) {
                if (!feature_data_out.full() && !write_addr_out.full()) {
                    feature_data_out.write(block_voxels[i]);
                    write_addr_out.write(block_voxels[i].morton_addr);
                }
            }
        }
        RetainedBlockInfo retained_info;
        retained_info.morton_code = morton3D(block_x * 2, block_y * 2, block_z * 2);
        retained_info.dram_offset = retained_block_count * 8 * FEATURE_DIM;
        retained_info.valid_voxels = block_occupancy;
        if (!retained_blocks_out.full()) {
            retained_blocks_out.write(retained_info);
        }
        retained_block_count++;
    }
    #ifndef __SYNTHESIS__
    std::cout << "Block " << block_index << " voxels: ";
    #endif
    for (int i = 0; i < 8; i++) {
        if (block_occupancy[i]) {
            ap_uint<32> vx, vy, vz;
            morton_decode(block_voxels[i].morton_addr, vx, vy, vz);
            #ifndef __SYNTHESIS__
            std::cout << "(" << vx << "," << vy << "," << vz << ") ";
            #endif
        }
    }
    #ifndef __SYNTHESIS__
    std::cout << std::endl;
    #endif
    #ifndef __SYNTHESIS__
    std::cout << "=== FPGA_ORDER_DEBUG: Block " << block_index << " voxels: ";
    #endif
    for (int i = 0; i < 8; i++) {
        if (block_occupancy[i]) {
            ap_uint<32> vx, vy, vz;
            morton_decode(block_voxels[i].morton_addr, vx, vy, vz);
            #ifndef __SYNTHESIS__
            std::cout << "(" << vx << "," << vy << "," << vz << ") ";
            #endif
        }
    }
    #ifndef __SYNTHESIS__
    std::cout << std::endl;
    #endif
}
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
    ap_uint<32> &processed_input_voxels)
{
#pragma HLS INTERFACE axis port = voxel_stream
#pragma HLS INTERFACE axis port = feature_data_out
#pragma HLS INTERFACE axis port = write_addr_out
#pragma HLS INTERFACE axis port = early_trigger_out
#pragma HLS INTERFACE axis port = retained_blocks_out
#pragma HLS INTERFACE bram port = L3_bitmap
#pragma HLS INTERFACE bram port = L2_bitmap_pruned
#pragma HLS INTERFACE bram port = L1_bitmap_pruned
#pragma HLS INTERFACE bram port = L0_bitmap_pruned
#pragma HLS INTERFACE s_axilite port = bitmap_info
#pragma HLS INTERFACE s_axilite port = return
    static VoxelData micro_batch[MICRO_BATCH_SIZE];
    static ap_uint<5> micro_count = 0;
    static ap_uint<32> voxel_count = 0;
    static ap_uint<32> retained_block_count = 0;
static ap_uint<32> l0_write_pos = 0;
static ap_uint<32> l1_write_pos = 0;
static ap_uint<32> l2_write_pos = 0;
#pragma HLS ARRAY_PARTITION variable=micro_batch complete
    static ap_uint<1> L1_temp[DIM_L1 * DIM_L1 * DIM_L1];
    static ap_uint<1> L2_temp[DIM_L2 * DIM_L2 * DIM_L2];
    static ap_uint<1> L3_temp[1];
#pragma HLS BIND_STORAGE variable = L1_temp type = ram_1p impl = bram
#pragma HLS BIND_STORAGE variable = L2_temp type = ram_1p impl = bram
#pragma HLS BIND_STORAGE variable = L3_temp type = ram_1p impl = bram
    static ap_uint<1> initialized = 0;
    if (!initialized) {
        micro_count = 0;
    voxel_count = 0;
    retained_block_count = 0;
    l0_write_pos = 0;
    l1_write_pos = 0;
    l2_write_pos = 0;
    for (int i = 0; i < DIM_L1 * DIM_L1 * DIM_L1; i++) {
        L1_temp[i] = 0;
    }
    for (int i = 0; i < DIM_L2 * DIM_L2 * DIM_L2; i++) {
        L2_temp[i] = 0;
    }
    L3_temp[0] = 0;
    initialized = 1;
    }
    #ifndef __SYNTHESIS__
    std::cout << "Bitmap constructor: processing voxels, current count=" << voxel_count << std::endl;
    #endif
    MICRO_BATCH_PROCESSING:
while (voxel_count < L0_SIZE && !voxel_stream.empty()) {
#pragma HLS PIPELINE II=1
#pragma HLS DEPENDENCE variable=micro_batch inter false
    VoxelData voxel = voxel_stream.read();
    processed_input_voxels++;
    micro_batch[micro_count] = voxel;
    micro_count++;
    voxel_count++;
    if (micro_count == MICRO_BATCH_SIZE) {
        PROCESS_MICRO_BATCH:
        for (int i = 0; i < MICRO_BATCH_SIZE; i++) {
#pragma HLS UNROLL factor=4
            VoxelData current_voxel = micro_batch[i];
            ap_uint<32> x, y, z;
            morton_decode(current_voxel.morton_addr, x, y, z);
            int dx = x % 2;
            int dy = y % 2;  
            int dz = z % 2;
            int bit_pos = dz * 4 + dy * 2 + dx;
            VoxelData block_voxels[8];
            ap_uint<8> block_occupancy = 0;
            block_voxels[bit_pos] = current_voxel;
            block_occupancy[bit_pos] = current_voxel.occupancy;
            if (block_occupancy != 0) {
                for (int j = 0; j < 8; j++) {
                    set_bit(L0_bitmap_pruned, l0_write_pos + j, block_occupancy[j]);
                }
                l0_write_pos += 8;
                if (!feature_data_out.full() && !write_addr_out.full()) {
                    feature_data_out.write(current_voxel);
                    write_addr_out.write(current_voxel.morton_addr);
                }
                ap_uint<32> block_x = x / 2;
                ap_uint<32> block_y = y / 2;
                ap_uint<32> block_z = z / 2;
                ap_uint<32> l1_idx = block_z * DIM_L1 * DIM_L1 + block_y * DIM_L1 + block_x;
                L1_temp[l1_idx] = 1;
                RetainedBlockInfo retained_info;
                retained_info.morton_code = morton3D(block_x * 2, block_y * 2, block_z * 2);
                retained_info.dram_offset = retained_block_count * 8 * FEATURE_DIM;
                retained_info.valid_voxels = block_occupancy;
                if (!retained_blocks_out.full()) {
                    retained_blocks_out.write(retained_info);
                }
                retained_block_count++;
            }
        }
        micro_count = 0;  
    }
}
    L2_CONSTRUCTION:
    for (int l2_z = 0; l2_z < DIM_L2; l2_z++) {
        for (int l2_y = 0; l2_y < DIM_L2; l2_y++) {
            #pragma HLS PIPELINE II=1
            for (int l2_x = 0; l2_x < DIM_L2; l2_x++) {
                #pragma HLS UNROLL
                bool l2_has_data = false;
                ap_uint<8> l1_group = 0;
                L1_BLOCK_PROCESSING:
                for (int dz = 0; dz < 2; dz++) {
                    for (int dy = 0; dy < 2; dy++) {
                        for (int dx = 0; dx < 2; dx++) {
                            #pragma HLS UNROLL
                            int l1_x = l2_x * 2 + dx;
                            int l1_y = l2_y * 2 + dy;
                            int l1_z = l2_z * 2 + dz;
                            int l1_idx = l1_z * DIM_L1 * DIM_L1 + l1_y * DIM_L1 + l1_x;
                            int bit_pos = dz * 4 + dy * 2 + dx;
                            l1_group[bit_pos] = L1_temp[l1_idx];
                            if (L1_temp[l1_idx]) l2_has_data = true;
                        }
                    }
                }
                int l2_idx = l2_z * DIM_L2 * DIM_L2 + l2_y * DIM_L2 + l2_x;
                L2_temp[l2_idx] = l2_has_data ? 1 : 0;
                if (l2_has_data) {
                    for (int i = 0; i < 8; i++) {
                        set_bit(L1_bitmap_pruned, l1_write_pos + i, l1_group[i]);
                    }
                    l1_write_pos += 8;
                }
            }
        }
    }
    bool l3_has_data = false;
    ap_uint<8> l2_group = 0;
    for (int i = 0; i < 8; i++) {
        if (i < DIM_L2 * DIM_L2 * DIM_L2) {
            l2_group[i] = L2_temp[i];
            if (L2_temp[i]) l3_has_data = true;
        }
    }
    L3_temp[0] = l3_has_data ? 1 : 0;
    set_bit(L3_bitmap, 0, L3_temp[0]);
    if (l3_has_data) {
        for (int i = 0; i < 8; i++) {
            set_bit(L2_bitmap_pruned, l2_write_pos + i, l2_group[i]);
        }
        l2_write_pos += 8;
    }
    bitmap_info.L3_size = 1;
    bitmap_info.L2_size = l2_write_pos;
    bitmap_info.L1_size = l1_write_pos;
    bitmap_info.L0_size = l0_write_pos;
    bitmap_info.total_size = 1 + l2_write_pos + l1_write_pos + l0_write_pos;
    if (voxel_count >= L0_SIZE) {
        RetainedBlockInfo end_marker;
        end_marker.morton_code = 0xFFFFFFFFFFFFFFFF;
        end_marker.valid_voxels = 0;
        if (!retained_blocks_out.full()) {
            retained_blocks_out.write(end_marker);
        }
        EarlyTriggerSignal trigger;
        trigger.valid_l0_ready = 1;
        trigger.l0_region_idx = 0;
        trigger.voxel_count = voxel_count;
        trigger.base_morton = 0;
        if (!early_trigger_out.full()) {
            early_trigger_out.write(trigger);
        }
    }
        #ifndef __SYNTHESIS__
    std::cout << "Bitmap construction complete. L0:" << l0_write_pos 
              << " L1:" << l1_write_pos << " L2:" << l2_write_pos << std::endl;
              #endif
    #ifndef __SYNTHESIS__
    std::cout << "=== BITMAP DEBUG ===" << std::endl;
    #endif
    #ifndef __SYNTHESIS__
    std::cout << "L3 bitmap bit 0: " << get_bit(L3_bitmap, 0) << std::endl;
    #endif
    #ifndef __SYNTHESIS__
    std::cout << "First 8 L2 bits: ";
    #endif
    for (int i = 0; i < 8; i++) {
        #ifndef __SYNTHESIS__
        std::cout << get_bit(L2_bitmap_pruned, i) << " ";
        #endif
    }
    #ifndef __SYNTHESIS__
    std::cout << std::endl;
    #endif
    #ifndef __SYNTHESIS__
    std::cout << "First 16 L1 bits: ";
    #endif
    for (int i = 0; i < 16; i++) {
        #ifndef __SYNTHESIS__
        std::cout << get_bit(L1_bitmap_pruned, i) << " ";
        #endif
    }
    #ifndef __SYNTHESIS__
    std::cout << std::endl;
    #endif
    #ifndef __SYNTHESIS__
    std::cout << "First 16 L0 bits: ";
    #endif
    for (int i = 0; i < 16; i++) {
        #ifndef __SYNTHESIS__
        std::cout << get_bit(L0_bitmap_pruned, i) << " ";
        #endif
    }
    #ifndef __SYNTHESIS__
    std::cout << std::endl;
    #endif
}
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
    hls::stream<ap_uint<MORTON_BITS>> &write_addr_out)
{
    #ifndef __SYNTHESIS__
    std::cout << "process_z_plane_pair called but not implemented in new approach" << std::endl;
    #endif
}
void process_l1_to_l2_pruning(
    ap_uint<32> z_pair_idx,
    ap_uint<1> *L1_temp,
    ap_uint<1> *L2_temp,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<32> &l1_write_pos)
{
    #ifndef __SYNTHESIS__
    std::cout << "process_l1_to_l2_pruning called but not implemented in new approach" << std::endl;
    #endif
}
void process_l2_to_l3_pruning(
    ap_uint<32> l3_block_idx,
    ap_uint<1> *L2_temp,
    ap_uint<1> *L3_temp,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<32> &l2_write_pos)
{
    #ifndef __SYNTHESIS__
    std::cout << "process_l2_to_l3_pruning called but not implemented in new approach" << std::endl;
    #endif
}