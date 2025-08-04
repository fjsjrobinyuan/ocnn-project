#include "dynamic_access.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
// fast bit counting for a 8 bit values
inline ap_uint<4> popcount8(ap_uint<8> x) {
    ap_uint<4> count = 0;
    for (int i = 0; i < 8; i++) {
    #pragma HLS UNROLL
        count += x[i];
    }
    return count;
}
/**
 * initialize streaming pointers for efficient octree traversal
 * these pointers help to avoid re-scanning the same bitmap regions
 */
void initialize_streaming_pointers(StreamingPointers &ptrs) {
#pragma HLS INLINE
    ptrs.current_ptr_L3 = 0;    // L3 bitmap position
    ptrs.current_ptr_L2 = 0;    // L2 bitmap position  
    ptrs.current_ptr_L1 = 0;    // L1 bitmap position
    ptrs.current_ptr_L0 = 0;    // L0 bitmap position
    ptrs.current_l2_idx = 0;    // Current L2 block index
    ptrs.current_l1_idx = 0;    // Current L1 block index
    ptrs.initialized = 1;
}

/**
 * main octree neighbor search function
 * searches for a specific voxel in the 4-level octree structure using streaming optimization
 * returns true if voxel exists, and sets found_index to the L0 bitmap position
 * 
 * this is the heart of sparse convolution, we need to quickly check if neighbor voxel exists
 * the 4-level hierarchy lets us skip large empty regions efficiently
 * L3 (8x8x8) -> L2 (16x16x16) -> L1 (32x32x32) -> L0 (64x64x64)
 */
bool find_neighbor_streaming(
    ap_uint<MORTON_BITS> target_morton,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    PrunedBitmapInfo &bitmap_info,
    StreamingPointers &stream_ptrs,
    ap_uint<32> &found_index)
{
#pragma HLS INLINE off
#pragma HLS PIPELINE II=1

    // Static caches to avoid re-reading the same BRAM words repeatedly
    static ap_uint<BRAM_WIDTH> l3_cache = 0;
    static ap_uint<1> l3_cache_valid = 0;
    static ap_uint<32> l2_cache_idx = 0xFFFFFFFF;  // Invalid index initially
    static ap_uint<BRAM_WIDTH> l2_cache = 0;
    static ap_uint<32> l1_cache_idx = 0xFFFFFFFF;  // Invalid index initially
    static ap_uint<BRAM_WIDTH> l1_cache = 0;

    // decode morton code to get 3D coordinates
    ap_uint<32> x, y, z;
    morton_decode(target_morton, x, y, z);

    // bounds check - make sure coordinates are within the octree
    if (x >= DIM_L0 || y >= DIM_L0 || z >= DIM_L0) {
        return false;
    }

    // Calculate which L2 block this voxel belongs to (each L2 block covers 4x4x4 L1 blocks)
    ap_uint<32> l2_x = x >> 2;  // Divide by 4
    ap_uint<32> l2_y = y >> 2;
    ap_uint<32> l2_z = z >> 2;
    ap_uint<32> l2_linear_idx = l2_z * 4 + l2_y * 2 + l2_x;  // Convert to linear index

    // Calculate which L1 block this voxel belongs to (each L1 block covers 2x2x2 L0 voxels)
    ap_uint<32> l1_x = x >> 1;  // Divide by 2
    ap_uint<32> l1_y = y >> 1;
    ap_uint<32> l1_z = z >> 1;

    // level 3 check, check if the L3 region has any data at all
    if (!l3_cache_valid) {
        l3_cache = L3_bitmap[0]; // L3 is small, just one word
        l3_cache_valid = 1;
    }

    // if L3 bit 0 is not set the nthe entire octree is empty
    if (!(l3_cache & 1)) {
        return false;
    }

    // level 2 check: check if the specific L2 block has data
    if (l2_linear_idx >= 8) {
        return false;
    }

    // cache l2 bitmap word if we haven't seen this word before
    ap_uint<32> l2_word_idx = l2_linear_idx / BRAM_WIDTH;
    if (l2_cache_idx != l2_word_idx) {
        l2_cache = L2_bitmap_pruned[l2_word_idx];
        l2_cache_idx = l2_word_idx;
    }

    // check if this L2 block has any data
    if (!(l2_cache[l2_linear_idx % BRAM_WIDTH])) {
        return false;
    }

    // update streaming pointers if we've moved to a different L2 block
    if (l2_linear_idx != stream_ptrs.current_l2_idx) {
        stream_ptrs.current_l2_idx = l2_linear_idx;
        stream_ptrs.current_ptr_L1 = 0; // reset L1 pointer
        stream_ptrs.current_ptr_L0 = 0; // reset L0 pointer
    }

    // Level 1 processing: find the L1 bitmap position
    // each L2 block contains up to 8 L1 blocks, but only non-empty ones are stored
    // we need to calculate the offset based on how many L2 blocks before us had data

    // pre-computed lookup table for L1 base offsets
static ap_uint<32> l1_base_offset_lut[8] = {0, 0, 0, 0, 0, 0, 0, 0};
static ap_uint<1> lut_initialized = 0;

if (!lut_initialized) {
    l1_base_offset_lut[0] = 0;
    // build cumulative offset table, each L2 block contributes 8 L1 positions if it has data
    UPDATE_LUT:
    for (ap_uint<32> i = 1; i < 8; i++) {
#pragma HLS UNROLL
        l1_base_offset_lut[i] = l1_base_offset_lut[i-1] + 
                               (get_bit(L2_bitmap_pruned, i-1) ? 8 : 0);
    }
    lut_initialized = 1;
}

ap_uint<32> l1_base_offset = l1_base_offset_lut[l2_linear_idx];

// calculate position within the current L2 block, find which L1 sub-block are we in?
ap_uint<32> l1_within_l2_x = l1_x & 1;  // x % 2
    ap_uint<32> l1_within_l2_y = l1_y & 1;  // y % 2
    ap_uint<32> l1_within_l2_z = l1_z & 1;  // z % 2
    ap_uint<32> l1_offset_in_group = l1_within_l2_z * 4 + l1_within_l2_y * 2 + l1_within_l2_x;
    
    // find L1 bit position in the pruned L1 bitmap
    ap_uint<32> l1_bit_pos = l1_base_offset + l1_offset_in_group;

    if (l1_bit_pos >= bitmap_info.L1_size) {
        return false;
    }
    
    // check if this L1 block has data
    if (!get_bit(L1_bitmap_pruned, l1_bit_pos)) {
        return false;  
    }

    // LEVEL 0 PROCESSING: find the final L0 voxel position
    // this is the most complex part - we need to count how many L1 blocks before us had data
    // each L1 block that has data contributes 8 L0 positions
#pragma HLS INLINE off
ap_uint<32> l0_base_offset = 0;
const int CHUNK_WIDTH = 8; // process 8 bits at a time for efficiency

// parallel processing of L1 bitmap chunks to count preceding L1 blocks
PARALLEL_L0_BASE_CALC:
for (ap_uint<6> chunk = 0; chunk < l1_bit_pos; chunk += CHUNK_WIDTH) {
    #pragma HLS PIPELINE II=1
    #pragma HLS loop_tripcount min=1 max=64

    ap_uint<8> bitgroup = 0;

    // calculate which BRAM word and bit position we need
ap_uint<32> word_idx = (chunk + stream_ptrs.current_ptr_L1) / BRAM_WIDTH;
    ap_uint<32> bit_idx  = (chunk + stream_ptrs.current_ptr_L1) % BRAM_WIDTH;

    // calculate the L1 bitmap word if we haven't seen it before
    if (l1_cache_idx != word_idx) {
        l1_cache = L1_bitmap_pruned[word_idx];
        l1_cache_idx = word_idx;
    }

    // extract 8 bits for processing, handling word boundaries
    if (bit_idx + 7 < BRAM_WIDTH) {
        // simple case - all 8 bits are in the same word
        bitgroup = (l1_cache >> bit_idx) & 0xFF;
    } else {
        // complex case, bits span across 2 words
        ap_uint<16> temp = (l1_cache >> bit_idx);
        if (word_idx + 1 < BITMAP_SIZE) {
            temp |= (L1_bitmap_pruned[word_idx + 1] << (BRAM_WIDTH - bit_idx));
        }
        bitgroup = temp & 0xFF;
    }

    // count how many L1 blocks in this chunk have data
    ap_uint<4> chunk_count = popcount8(bitgroup);
    l0_base_offset += chunk_count * CHUNK_WIDTH; // each L1 block contributes 8 L0 positions
}
   // calculate position within the current L1 block (which L0 voxel are we looking for?)
    ap_uint<32> l0_within_l1_x = x & 1;  // x % 2
    ap_uint<32> l0_within_l1_y = y & 1;  // y % 2
    ap_uint<32> l0_within_l1_z = z & 1;  // z % 2
    ap_uint<32> l0_offset_in_group = l0_within_l1_z * 4 + l0_within_l1_y * 2 + l0_within_l1_x;
    
    // final L0 bit position in the pruned L0 bitmap
    ap_uint<32> l0_bit_pos = l0_base_offset + l0_offset_in_group;

    if (l0_bit_pos >= bitmap_info.L0_size) {
        return false;
    }

    // final check - does this specific voxel exist? 
    bool l0_exists = get_bit(L0_bitmap_pruned, l0_bit_pos);
    if (l0_exists) {
        found_index = l0_bit_pos;   // return the bitmap index for feature lookup
    }
    return l0_exists;
}