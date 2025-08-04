#include "dynamic_access.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
inline ap_uint<4> popcount8(ap_uint<8> x) {
    ap_uint<4> count = 0;
    for (int i = 0; i < 8; i++) {
    #pragma HLS UNROLL
        count += x[i];
    }
    return count;
}
void initialize_streaming_pointers(StreamingPointers &ptrs) {
#pragma HLS INLINE
    ptrs.current_ptr_L3 = 0;
    ptrs.current_ptr_L2 = 0;
    ptrs.current_ptr_L1 = 0;
    ptrs.current_ptr_L0 = 0;
    ptrs.current_l2_idx = 0;
    ptrs.current_l1_idx = 0;
    ptrs.initialized = 1;
}
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
static ap_uint<BRAM_WIDTH> l3_cache = 0;
static ap_uint<1> l3_cache_valid = 0;
static ap_uint<32> l2_cache_idx = 0xFFFFFFFF;
static ap_uint<BRAM_WIDTH> l2_cache = 0;
static ap_uint<32> l1_cache_idx = 0xFFFFFFFF;
static ap_uint<BRAM_WIDTH> l1_cache = 0;
    ap_uint<32> x, y, z;
    morton_decode(target_morton, x, y, z);
    if (x >= DIM_L0 || y >= DIM_L0 || z >= DIM_L0) {
        return false;
    }
    ap_uint<32> l2_x = x >> 2;  
    ap_uint<32> l2_y = y >> 2;
    ap_uint<32> l2_z = z >> 2;
    ap_uint<32> l2_linear_idx = l2_z * 4 + l2_y * 2 + l2_x;
    ap_uint<32> l1_x = x >> 1;  
    ap_uint<32> l1_y = y >> 1;
    ap_uint<32> l1_z = z >> 1;
    if (!l3_cache_valid) {
        l3_cache = L3_bitmap[0];
        l3_cache_valid = 1;
    }
    if (!(l3_cache & 1)) {
        return false;
    }
    if (l2_linear_idx >= 8) {
        return false;
    }
    ap_uint<32> l2_word_idx = l2_linear_idx / BRAM_WIDTH;
    if (l2_cache_idx != l2_word_idx) {
        l2_cache = L2_bitmap_pruned[l2_word_idx];
        l2_cache_idx = l2_word_idx;
    }
    if (!(l2_cache[l2_linear_idx % BRAM_WIDTH])) {
        return false;
    }
    if (l2_linear_idx != stream_ptrs.current_l2_idx) {
        stream_ptrs.current_l2_idx = l2_linear_idx;
        stream_ptrs.current_ptr_L1 = 0;
        stream_ptrs.current_ptr_L0 = 0;
    }
    static ap_uint<32> l1_base_offset_lut[8] = {0, 0, 0, 0, 0, 0, 0, 0};
static ap_uint<1> lut_initialized = 0;
if (!lut_initialized) {
    l1_base_offset_lut[0] = 0;
    UPDATE_LUT:
    for (ap_uint<32> i = 1; i < 8; i++) {
#pragma HLS UNROLL
        l1_base_offset_lut[i] = l1_base_offset_lut[i-1] + 
                               (get_bit(L2_bitmap_pruned, i-1) ? 8 : 0);
    }
    lut_initialized = 1;
}
ap_uint<32> l1_base_offset = l1_base_offset_lut[l2_linear_idx];
    ap_uint<32> l1_within_l2_x = l1_x & 1;  
    ap_uint<32> l1_within_l2_y = l1_y & 1;
    ap_uint<32> l1_within_l2_z = l1_z & 1;
    ap_uint<32> l1_offset_in_group = l1_within_l2_z * 4 + l1_within_l2_y * 2 + l1_within_l2_x;
    ap_uint<32> l1_bit_pos = l1_base_offset + l1_offset_in_group;
    if (l1_bit_pos >= bitmap_info.L1_size) {
        return false;
    }
    if (!get_bit(L1_bitmap_pruned, l1_bit_pos)) {
        return false;  
    }
#pragma HLS INLINE off
ap_uint<32> l0_base_offset = 0;
const int CHUNK_WIDTH = 8;
PARALLEL_L0_BASE_CALC:
for (ap_uint<6> chunk = 0; chunk < l1_bit_pos; chunk += CHUNK_WIDTH) {
    #pragma HLS PIPELINE II=1
    #pragma HLS loop_tripcount min=1 max=64
    ap_uint<8> bitgroup = 0;
ap_uint<32> word_idx = (chunk + stream_ptrs.current_ptr_L1) / BRAM_WIDTH;
    ap_uint<32> bit_idx  = (chunk + stream_ptrs.current_ptr_L1) % BRAM_WIDTH;
    if (l1_cache_idx != word_idx) {
        l1_cache = L1_bitmap_pruned[word_idx];
        l1_cache_idx = word_idx;
    }
    if (bit_idx + 7 < BRAM_WIDTH) {
        bitgroup = (l1_cache >> bit_idx) & 0xFF;
    } else {
        ap_uint<16> temp = (l1_cache >> bit_idx);
        if (word_idx + 1 < BITMAP_SIZE) {
            temp |= (L1_bitmap_pruned[word_idx + 1] << (BRAM_WIDTH - bit_idx));
        }
        bitgroup = temp & 0xFF;
    }
    ap_uint<4> chunk_count = popcount8(bitgroup);
    l0_base_offset += chunk_count * CHUNK_WIDTH;
}
    ap_uint<32> l0_within_l1_x = x & 1;  
    ap_uint<32> l0_within_l1_y = y & 1;
    ap_uint<32> l0_within_l1_z = z & 1;
    ap_uint<32> l0_offset_in_group = l0_within_l1_z * 4 + l0_within_l1_y * 2 + l0_within_l1_x;
    ap_uint<32> l0_bit_pos = l0_base_offset + l0_offset_in_group;
    if (l0_bit_pos >= bitmap_info.L0_size) {
        return false;
    }
    bool l0_exists = get_bit(L0_bitmap_pruned, l0_bit_pos);
    if (l0_exists) {
        found_index = l0_bit_pos;
    }
    return l0_exists;
}