#ifndef FEATURE_BUFFER_H
#define FEATURE_BUFFER_H
#include "octree_bitmap.h"
#include "morton_reorder_buffer.h"
#include "octree_master.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
void load_features_morton_order(
    hls::stream<MemRequest> &mem_req,
    hls::stream<MemResponse> &mem_resp,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    FeatureBuffer *feature_cache,
    ap_uint<32> cache_size);
inline bool check_neighbor_exists(
    ap_uint<BRAM_WIDTH> *bitmap,
    int x, int y, int z,
    int dx, int dy, int dz,
    int dim)
{
#pragma HLS INLINE
    int nx = x + dx;
    int ny = y + dy;
    int nz = z + dz;
    if (nx < 0 || nx >= dim || ny < 0 || ny >= dim || nz < 0 || nz >= dim)
    {
        return false;
    }
    ap_uint<MORTON_BITS> neighbor_morton = morton3D(nx, ny, nz);
    int bit_idx = coord_to_idx(nx, ny, nz, dim);
    return get_bit(bitmap, bit_idx);
}
#endif
