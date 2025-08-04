#ifndef OCTREE_BITMAP_H
#define OCTREE_BITMAP_H
#include <ap_int.h>
#include <hls_stream.h>
#include "octree_master.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
#ifndef DIM_L0
#define DIM_L0 64
#endif
#define MORTON_BITS 60
#define L0_SIZE (DIM_L0 * DIM_L0 * DIM_L0)
#define L1_SIZE (DIM_L1 * DIM_L1 * DIM_L1)
#define L2_SIZE (DIM_L2 * DIM_L2 * DIM_L2)
#define L3_SIZE (DIM_L3 * DIM_L3 * DIM_L3)
#define BRAM_WIDTH 512
#define BRAM_DEPTH 4096
#define BITS_PER_BRAM (BRAM_WIDTH * BRAM_DEPTH)
#define L0_WORDS ((L0_SIZE + BRAM_WIDTH - 1) / BRAM_WIDTH)
#define L1_WORDS ((L1_SIZE + BRAM_WIDTH - 1) / BRAM_WIDTH)
#define L2_WORDS ((L2_SIZE + BRAM_WIDTH - 1) / BRAM_WIDTH)
#define L3_WORDS ((L3_SIZE + BRAM_WIDTH - 1) / BRAM_WIDTH)
inline void linear_to_3d(int linear_idx, int dim, int &x, int &y, int &z)
{
#pragma HLS INLINE
    z = linear_idx / (dim * dim);
    y = (linear_idx % (dim * dim)) / dim;
    x = linear_idx % dim;
}
inline int coord_3d_to_linear(int x, int y, int z, int dim)
{
#pragma HLS INLINE
    return z * dim * dim + y * dim + x;
}
inline void get_child_block_indices(int parent_x, int parent_y, int parent_z,
                                    int child_dim, int child_indices[8])
{
#pragma HLS INLINE
    int idx = 0;
    for (int dz = 0; dz < 2; dz++)
    {
        for (int dy = 0; dy < 2; dy++)
        {
            for (int dx = 0; dx < 2; dx++)
            {
#pragma HLS UNROLL
                int child_x = parent_x * 2 + dx;
                int child_y = parent_y * 2 + dy;
                int child_z = parent_z * 2 + dz;
                child_indices[idx++] = coord_3d_to_linear(child_x, child_y, child_z, child_dim);
            }
        }
    }
}
#endif
