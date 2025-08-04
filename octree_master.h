#ifndef OCTREE_MASTER_H
#define OCTREE_MASTER_H
#include <ap_int.h>
#include <hls_stream.h>
#ifndef __SYNTHESIS__
#include <iostream>
#endif
#ifndef BLOCK_SIZE
#define BLOCK_SIZE 2
#endif
#ifndef BASE_DIM
#define BASE_DIM 8
#endif
#ifndef NUM_LEVELS
#define NUM_LEVELS 4
#endif
#ifndef FEATURE_DIM
#define FEATURE_DIM 32
#endif
#ifndef KERNEL_SIZE
#define KERNEL_SIZE 3
#endif
#ifndef MORTON_BUFFER_SIZE
#define MORTON_BUFFER_SIZE 64
#endif
#ifndef SCANLINE_BUFFER_DEPTH
#define SCANLINE_BUFFER_DEPTH 2
#endif
#ifndef SYSTOLIC_TRIGGER_THRESHOLD
#define SYSTOLIC_TRIGGER_THRESHOLD 8
#endif
#ifndef BRAM_WIDTH
#define BRAM_WIDTH 512
#endif
#ifndef BRAM_DEPTH
#define BRAM_DEPTH 4096
#endif
#define BITMAP_SIZE 64
#define DIM_L0 BASE_DIM
#if NUM_LEVELS >= 2
#define DIM_L1 (BASE_DIM / BLOCK_SIZE)
#endif
#if NUM_LEVELS >= 3
#define DIM_L2 (DIM_L1 / BLOCK_SIZE)
#endif
#if NUM_LEVELS >= 4
#define DIM_L3 (DIM_L2 / BLOCK_SIZE)
#endif
#define L0_SIZE (DIM_L0 * DIM_L0 * DIM_L0)
#if NUM_LEVELS >= 2
#define L1_SIZE (DIM_L1 * DIM_L1 * DIM_L1)
#endif
#if NUM_LEVELS >= 3
#define L2_SIZE (DIM_L2 * DIM_L2 * DIM_L2)
#endif
#if NUM_LEVELS >= 4
#define L3_SIZE (DIM_L3 * DIM_L3 * DIM_L3)
#endif
#define KERNEL_VOLUME (KERNEL_SIZE * KERNEL_SIZE * KERNEL_SIZE)
#define MORTON_BITS 60
#define FEATURE_SIZE 4
#define BITS_PER_BRAM (BRAM_WIDTH * BRAM_DEPTH)
#define VOXELS_PER_BLOCK (BLOCK_SIZE * BLOCK_SIZE * BLOCK_SIZE)
#define MAX_VOXELS_L0 L0_SIZE
#define SCANLINE_BUFFER_SIZE (DIM_L0 * DIM_L0 * SCANLINE_BUFFER_DEPTH)
#define L0_WORDS ((L0_SIZE + BRAM_WIDTH - 1) / BRAM_WIDTH)
#if NUM_LEVELS >= 2
#define L1_WORDS ((L1_SIZE + BRAM_WIDTH - 1) / BRAM_WIDTH)
#endif
#if NUM_LEVELS >= 3
#define L2_WORDS ((L2_SIZE + BRAM_WIDTH - 1) / BRAM_WIDTH)
#endif
#if NUM_LEVELS >= 4
#define L3_WORDS ((L3_SIZE + BRAM_WIDTH - 1) / BRAM_WIDTH)
#endif
struct PrunedBitmapInfo
{
#if NUM_LEVELS >= 4
    ap_uint<32> L3_size;
#endif
#if NUM_LEVELS >= 3
    ap_uint<32> L2_size;
#endif
#if NUM_LEVELS >= 2
    ap_uint<32> L1_size;
#endif
    ap_uint<32> L0_size;
    ap_uint<32> total_size;
};
struct FeatureBuffer
{
    float features[FEATURE_DIM];
};
struct VoxelData
{
    ap_uint<1> occupancy;
    float features[FEATURE_DIM];
    ap_uint<MORTON_BITS> morton_addr;
};
struct MemRequest
{
    ap_uint<MORTON_BITS> morton_addr;
    ap_uint<32> data;
    ap_uint<1> is_write;
    ap_uint<8> request_id;
    ap_uint<1> should_store;
};
struct MemResponse
{
    ap_uint<32> data;
    ap_uint<8> request_id;
};
struct SystolicControlSignals
{
    ap_uint<1> data_ready;
    ap_uint<1> start_compute;
    ap_uint<32> ready_voxel_count;
    ap_uint<1> computation_done;
};
struct MortonBitmapInterface
{
    ap_uint<1> should_enqueue;
    ap_uint<1> access_request;
    ap_uint<MORTON_BITS> target_morton;
    ap_uint<1> access_granted;
};
static const ap_int<8> NEIGHBOR_OFFSETS[KERNEL_VOLUME][3] = {
#if KERNEL_SIZE == 3
    {-1, -1, -1}, {-1, -1, 0}, {-1, -1, 1}, 
    {-1, 0, -1}, {-1, 0, 0}, {-1, 0, 1}, 
    {-1, 1, -1}, {-1, 1, 0}, {-1, 1, 1}, 
    {0, -1, -1}, {0, -1, 0}, {0, -1, 1}, 
    {0, 0, -1}, {0, 0, 0}, {0, 0, 1}, 
    {0, 1, -1}, {0, 1, 0}, {0, 1, 1}, 
    {1, -1, -1}, {1, -1, 0}, {1, -1, 1}, 
    {1, 0, -1}, {1, 0, 0}, {1, 0, 1}, 
    {1, 1, -1}, {1, 1, 0}, {1, 1, 1}
#else
    {0, 0, 0}
#endif
};inline ap_uint<1> get_bit(ap_uint<BRAM_WIDTH> bitmap[], int bit_idx)
{
#pragma HLS INLINE
    int word_idx = bit_idx / BRAM_WIDTH;
    int bit_offset = bit_idx % BRAM_WIDTH;
    return bitmap[word_idx][bit_offset];
}
inline void set_bit(ap_uint<BRAM_WIDTH> bitmap[], int bit_idx, ap_uint<1> value)
{
#pragma HLS INLINE
    int word_idx = bit_idx / BRAM_WIDTH;
    int bit_offset = bit_idx % BRAM_WIDTH;
    bitmap[word_idx][bit_offset] = value;
}
inline int coord_to_idx(int x, int y, int z, int dim)
{
#pragma HLS INLINE
    return z * dim * dim + y * dim + x;
}
inline ap_uint<64> part1by2(ap_uint<21> x)
{
#pragma HLS INLINE
    ap_uint<64> n = x;
    n = (n | (n << 32)) & 0x1f00000000ffffULL;
    n = (n | (n << 16)) & 0x1f0000ff0000ffULL;
    n = (n | (n << 8)) & 0x100f00f00f00f00fULL;
    n = (n | (n << 4)) & 0x10c30c30c30c30c3ULL;
    n = (n | (n << 2)) & 0x1249249249249249ULL;
    return n;
}
inline ap_uint<MORTON_BITS> morton3D(ap_uint<20> x, ap_uint<20> y, ap_uint<20> z)
{
#pragma HLS INLINE
    return (part1by2(z) << 2) | (part1by2(y) << 1) | part1by2(x);
}
inline void morton_decode(ap_uint<MORTON_BITS> morton,
                          ap_uint<32> &x, ap_uint<32> &y, ap_uint<32> &z)
{
#pragma HLS INLINE
    x = 0;
    y = 0;
    z = 0;
    for (int i = 0; i < 20; i++)
    {
#pragma HLS UNROLL
        x |= ((morton >> (3 * i)) & 1) << i;
        y |= ((morton >> (3 * i + 1)) & 1) << i;
        z |= ((morton >> (3 * i + 2)) & 1) << i;
    }
}
#define INPUT_FEATURE_REGION_START 0
#define OUTPUT_FEATURE_REGION_START (MAX_VOXELS_L0 * FEATURE_DIM)
#define TEMP_BUFFER_REGION_START (2 * MAX_VOXELS_L0 * FEATURE_DIM)
struct MemoryLayout
{
    ap_uint<32> input_region_start;
    ap_uint<32> output_region_start;
    ap_uint<32> temp_region_start;
    ap_uint<32> next_input_offset;
    ap_uint<32> next_output_offset;
};
struct StreamingPointers {
    ap_uint<32> current_ptr_L3;
    ap_uint<32> current_ptr_L2;
    ap_uint<32> current_ptr_L1;
    ap_uint<32> current_ptr_L0;
    ap_uint<32> current_l2_idx;
    ap_uint<32> current_l1_idx;
    ap_uint<1> initialized;
};
inline void l2_idx_to_coords(ap_uint<32> l2_idx, ap_uint<32> &x, ap_uint<32> &y, ap_uint<32> &z) {
#pragma HLS INLINE
    z = l2_idx >> 2;  
    y = (l2_idx >> 1) & 1;  
    x = l2_idx & 1;  
}
inline void l1_local_to_coords(ap_uint<32> l1_local, ap_uint<32> &dx, ap_uint<32> &dy, ap_uint<32> &dz) {
#pragma HLS INLINE
    dz = l1_local >> 2;  
    dy = (l1_local >> 1) & 1;  
    dx = l1_local & 1;  
}
inline void l0_local_to_coords(ap_uint<32> l0_local, ap_uint<32> &dx, ap_uint<32> &dy, ap_uint<32> &dz) {
#pragma HLS INLINE
    dz = l0_local >> 2;  
    dy = (l0_local >> 1) & 1;  
    dx = l0_local & 1;  
}
struct ConvolutionTrigger {
    ap_uint<1> start_processing;
    ap_uint<32> available_voxels;
    ap_uint<1> data_ready;
};
struct ConvolutionResponse {
    ap_uint<1> processing_complete;
    ap_uint<32> voxels_processed;
    ap_uint<1> ready_for_next;
};
#endif
