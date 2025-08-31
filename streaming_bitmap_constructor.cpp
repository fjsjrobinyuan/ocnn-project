#include "streaming_bitmap_constructor.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
/**
 * Direct voxel processing without microbatch sorting.
 * Since data arrives in scanline order with monotonically increasing Morton codes,
 * no sorting is needed. Cross-row sorting handles optimization for short rows.
 */

void process_voxel(
    VoxelData current_voxel,
    hls::stream<VoxelData> &feature_data_out,
    hls::stream<ap_uint<MORTON_BITS>> &write_addr_out,
    hls::stream<RetainedBlockInfo> &retained_blocks_out,
    ap_uint<32> &retained_block_count,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    ap_uint<32> &l0_write_pos,
    ap_uint<1> *L1_temp)
{
#pragma HLS INLINE

    if (current_voxel.occupancy)
    {
        // Output feature data immediately
        if (!feature_data_out.full() && !write_addr_out.full())
        {
            feature_data_out.write(current_voxel);
            write_addr_out.write(current_voxel.morton_addr);
        }

        // Update bitmaps
        ap_uint<32> x, y, z;
        morton_decode(current_voxel.morton_addr, x, y, z);

        // Set L0 bitmap bit
        ap_uint<32> l0_bit_idx = coord_to_idx(x, y, z, DIM_L0);
        set_bit(L0_bitmap_pruned, l0_write_pos, 1);
        l0_write_pos++;

        // Update L1 temp bitmap
        ap_uint<32> block_x = x / 2;
        ap_uint<32> block_y = y / 2;
        ap_uint<32> block_z = z / 2;
        ap_uint<32> l1_idx = block_z * DIM_L1 * DIM_L1 + block_y * DIM_L1 + block_x;
        L1_temp[l1_idx] = 1;

        // Generate retained block info
        RetainedBlockInfo retained_info;
        retained_info.morton_code = current_voxel.morton_addr;
        retained_info.dram_offset = calculate_voxel_base_address(current_voxel.morton_addr, retained_block_count);
        retained_info.valid_voxels = 1;

        if (!retained_blocks_out.full())
        {
            retained_blocks_out.write(retained_info);
        }
        retained_block_count++;
    }
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
    static ap_uint<32> voxel_count = 0;
    static ap_uint<32> retained_block_count = 0;
    static ap_uint<32> l0_write_pos = 0;
    static ap_uint<32> l1_write_pos = 0;
    static ap_uint<32> l2_write_pos = 0;
    
    // YOUR INTENDED DESIGN: 2-Z-Layer Streaming Buffers (not massive arrays!)
    static ap_uint<1> l0_block_buffer[2][DIM_L0][DIM_L0];  // 2 z-layers for 2×2×2 blocks
    static ap_uint<1> l1_block_buffer[2][DIM_L1][DIM_L1];  // 2 z-layers for L1 construction  
    static ap_uint<1> l2_temp_buffer[DIM_L2][DIM_L2];      // Single layer for L2
    static ap_uint<32> current_z_layer = 0;                // Current processing z-layer
    
#pragma HLS BIND_STORAGE variable=l0_block_buffer type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=l1_block_buffer type=ram_1p impl=bram
#pragma HLS ARRAY_PARTITION variable=l0_block_buffer dim=1 complete  // Partition z-dimension
#pragma HLS ARRAY_PARTITION variable=l1_block_buffer dim=1 complete  // Partition z-dimension
    static ap_uint<1> initialized = 0;
    if (!initialized)
    {
        voxel_count = 0;
        retained_block_count = 0;
        l0_write_pos = 0;
        l1_write_pos = 0;
        l2_write_pos = 0;
        // Initialize 2-z-layer streaming buffers  
        for (int z = 0; z < 2; z++) {
            for (int y = 0; y < DIM_L0; y++) {
                for (int x = 0; x < DIM_L0; x++) {
                    l0_block_buffer[z][y][x] = 0;
                }
            }
        }
        for (int z = 0; z < 2; z++) {
            for (int y = 0; y < DIM_L1; y++) {
                for (int x = 0; x < DIM_L1; x++) {
                    l1_block_buffer[z][y][x] = 0;
                }
            }
        }
        for (int y = 0; y < DIM_L2; y++) {
            for (int x = 0; x < DIM_L2; x++) {
                l2_temp_buffer[y][x] = 0;
            }
        }
        initialized = 1;
    }
#ifndef __SYNTHESIS__
    std::cout << "Bitmap constructor: processing voxels, current count=" << voxel_count << std::endl;
#endif
VOXEL_PROCESSING:
    while (voxel_count < L0_SIZE && !voxel_stream.empty())
    {
#pragma HLS PIPELINE II = 1
        VoxelData voxel = voxel_stream.read();
        processed_input_voxels++;
        voxel_count++;

        // YOUR INTENDED DESIGN: Stream voxels into 2-z-layer buffer
        ap_uint<32> x = voxel.morton_addr & 0x3F;  // Extract X coordinate
        ap_uint<32> y = (voxel.morton_addr >> 6) & 0x3F;  // Extract Y coordinate  
        ap_uint<32> z = (voxel.morton_addr >> 12) & 0x3F; // Extract Z coordinate
        
        // Store voxel occupancy in 2-z-layer buffer
        ap_uint<32> buffer_z = z % 2;  // Use alternating z-layers
        l0_block_buffer[buffer_z][y][x] = voxel.occupancy;
        
        // Process voxel for DRAM storage (features and addresses)
        if (voxel.occupancy) {
            feature_data_out.write(voxel);
            write_addr_out.write(voxel.morton_addr);
            
            RetainedBlockInfo block_info;
            block_info.morton_code = voxel.morton_addr;
            block_info.block_index = retained_block_count;
            retained_blocks_out.write(block_info);
            retained_block_count++;
        }
    }
// YOUR INTENDED HIERARCHICAL STREAMING CONSTRUCTION  
L0_TO_L1_PRUNING:
    for (int l1_y = 0; l1_y < DIM_L1; l1_y++)
    {
#pragma HLS PIPELINE II=2  // Relaxed for timing closure - your concept is more important!
        for (int l1_x = 0; l1_x < DIM_L1; l1_x++)
        {
            // Process 2×2×2 block from your 2-z-layer buffer (not complex 3D indexing!)
            bool l1_has_data = false;
            ap_uint<8> l0_group = 0;
            
            // Check 2×2×2 voxel block from streaming buffer
            for (int dz = 0; dz < 2; dz++)
            {
                for (int dy = 0; dy < 2; dy++)  
                {
                    for (int dx = 0; dx < 2; dx++)
                    {
#pragma HLS UNROLL
                        ap_uint<32> l0_x = l1_x * 2 + dx;
                        ap_uint<32> l0_y = l1_y * 2 + dy;
                        
                        // YOUR DESIGN: Simple 2-z-layer buffer access (not complex indexing!)
                        ap_uint<1> voxel_bit = (l0_x < DIM_L0 && l0_y < DIM_L0) ? 
                                              l0_block_buffer[dz][l0_y][l0_x] : (ap_uint<1>)0;
                        
                        ap_uint<32> bit_pos = dz * 4 + dy * 2 + dx;
                        l0_group[bit_pos] = voxel_bit;
                        if (voxel_bit) l1_has_data = true;
                    }
                }
            }
            
            // YOUR PRUNING CONCEPT: Store L1 bit in buffer for next level
            l1_block_buffer[0][l1_y][l1_x] = l1_has_data ? 1 : 0;
            
            // PRUNED STORAGE: Only store L0 block if L1 bit = 1
            if (l1_has_data)
            {
                for (int i = 0; i < 8; i++)
                {
                    set_bit(L0_bitmap_pruned, l0_write_pos + i, l0_group[i]);
                }
                l0_write_pos += 8;
            }
        }
    }
    
L1_TO_L2_PRUNING:  
    for (int l2_y = 0; l2_y < DIM_L2; l2_y++)
    {
#pragma HLS PIPELINE II=2  // Relaxed timing for your correct design
        for (int l2_x = 0; l2_x < DIM_L2; l2_x++)
        {
            // Process 2×2 L1 group from buffer (your design!)
            bool l2_has_data = false;
            ap_uint<4> l1_group = 0;
            
            for (int dy = 0; dy < 2; dy++)
            {
                for (int dx = 0; dx < 2; dx++)
                {
#pragma HLS UNROLL
                    ap_uint<32> l1_x = l2_x * 2 + dx;
                    ap_uint<32> l1_y_coord = l2_y * 2 + dy;
                    
                    // YOUR DESIGN: Simple buffer access (not complex indexing!)
                    ap_uint<1> l1_bit = (l1_x < DIM_L1 && l1_y_coord < DIM_L1) ? 
                                       l1_block_buffer[0][l1_y_coord][l1_x] : (ap_uint<1>)0;
                    
                    ap_uint<32> bit_pos = dy * 2 + dx;
                    l1_group[bit_pos] = l1_bit;
                    if (l1_bit) l2_has_data = true;
                }
            }
            
            // YOUR PRUNING: Store L2 bit and conditionally store L1 group
            l2_temp_buffer[l2_y][l2_x] = l2_has_data ? 1 : 0;
            
            if (l2_has_data)
            {
                for (int i = 0; i < 4; i++)
                {
                    set_bit(L1_bitmap_pruned, l1_write_pos + i, l1_group[i]);
                }
                l1_write_pos += 4;
            }
        }
    }
// L2_TO_L3_CONSTRUCTION - YOUR ROOT LEVEL (stored completely)
    bool l3_has_data = false;
    ap_uint<64> l2_complete_level = 0;  // Store complete L2 level
    ap_uint<32> l2_bit_pos = 0;
    
    for (int l2_y = 0; l2_y < DIM_L2; l2_y++)
    {
        for (int l2_x = 0; l2_x < DIM_L2; l2_x++)
        {
            ap_uint<1> l2_bit = l2_temp_buffer[l2_y][l2_x];
            l2_complete_level[l2_bit_pos] = l2_bit;
            if (l2_bit) l3_has_data = true;
            l2_bit_pos++;
        }
    }
    
    // YOUR DESIGN: L3 (root) stored completely, L2 stored conditionally
    set_bit(L3_bitmap, 0, l3_has_data ? 1 : 0);
    
    if (l3_has_data)
    {
        // Store complete L2 level in pruned bitmap (your root storage concept)
        for (int i = 0; i < DIM_L2 * DIM_L2; i++)
        {
            ap_uint<1> bit_val = (l2_complete_level >> i) & 1;
            set_bit(L2_bitmap_pruned, l2_write_pos + i, bit_val);
        }
        l2_write_pos += DIM_L2 * DIM_L2;
    }
    bitmap_info.L3_size = 1;
    bitmap_info.L2_size = l2_write_pos;
    bitmap_info.L1_size = l1_write_pos;
    bitmap_info.L0_size = l0_write_pos;
    bitmap_info.total_size = 1 + l2_write_pos + l1_write_pos + l0_write_pos;
    if (voxel_count >= L0_SIZE)
    {
        RetainedBlockInfo end_marker;
        end_marker.morton_code = 0xFFFFFFFFFFFFFFFF;
        end_marker.valid_voxels = 0;
        if (!retained_blocks_out.full())
        {
            retained_blocks_out.write(end_marker);
        }
        EarlyTriggerSignal trigger;
        trigger.valid_l0_ready = 1;
        trigger.l0_region_idx = 0;
        trigger.voxel_count = voxel_count;
        trigger.base_morton = 0;
        if (!early_trigger_out.full())
        {
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
    for (int i = 0; i < 8; i++)
    {
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
    for (int i = 0; i < 16; i++)
    {
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
    for (int i = 0; i < 16; i++)
    {
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
ap_uint<32> calculate_voxel_base_address(ap_uint<MORTON_BITS> morton, ap_uint<32> base_offset)
{
#pragma HLS INLINE
// calculate the complete DRAM base address for a voxel's features
    MortonAddress addr = extract_morton_address(morton);
    return base_offset * FEATURE_DIM + (addr.row_bits * FEATURES_PER_ROW * FEATURE_DIM) + (addr.address_bits * FEATURE_DIM);
}