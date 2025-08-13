#ifndef DYNAMIC_ACCESS_H
#define DYNAMIC_ACCESS_H
#include "octree_bitmap.h"
#include "morton_reorder_buffer.h"
#include "octree_master.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
bool find_neighbor_streaming(
    ap_uint<MORTON_BITS> target_morton,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    PrunedBitmapInfo &bitmap_info,
    StreamingPointers &stream_ptrs,
    ap_uint<32> &found_index);
void initialize_streaming_pointers(StreamingPointers &ptrs);
#endif
