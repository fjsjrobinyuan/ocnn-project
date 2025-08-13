#ifndef OCTREE_CONSTANTS_H
#define OCTREE_CONSTANTS_H
#ifndef __SYNTHESIS__
#include <iostream>
#endif
#include <ap_int.h>
#ifndef DIM_L0
#define DIM_L0 64
#endif
#define DIM_L1 (DIM_L0 / 2)
#define DIM_L2 (DIM_L0 / 4)
#define DIM_L3 (DIM_L0 / 8)
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
#define FEATURE_DIM 32
#define KERNEL_SIZE 3
#define KERNEL_VOLUME 27
#define MORTON_BITS 60
#define FEATURE_SIZE 4
#define MAX_VOXELS_L0 (DIM_L0 * DIM_L0 * DIM_L0)
#define MAX_VOXELS_L1 (DIM_L1 * DIM_L1 * DIM_L1)
#define MAX_VOXELS_L2 (DIM_L2 * DIM_L2 * DIM_L2)
#define MAX_VOXELS_L3 (DIM_L3 * DIM_L3 * DIM_L3)
#define BUFFER_SIZE 64
#define SCANLINE_BUFFER_SIZE (DIM_L0 * DIM_L0 * 2)
#define BLOCK_BUFFER_SIZE 8
#endif
