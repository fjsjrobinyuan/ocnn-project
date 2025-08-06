#ifndef SYSTOLIC_ARRAY_H
#define SYSTOLIC_ARRAY_H
#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_stream.h>
#include "octree_master.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
typedef ap_fixed<32, 16> fixed_t;
struct ProcessingElement
{
    float weight;
    float accumulator;
    ap_uint<1> valid;
};
#define SYSTOLIC_ROWS FEATURE_DIM
#define SYSTOLIC_COLS FEATURE_DIM
#define SYSTOLIC_PIPELINE_DEPTH 4
#ifndef SYSTOLIC_ARRAY_COUNT
#define SYSTOLIC_ARRAY_COUNT 4
#define PARALLEL_VOXEL_PROCESSING 4
#define KERNEL_UNROLL_FACTOR 9
#define MAX_VOXELS_PER_LAYER 4096
#endif
struct ZLayerVoxel
{
    ap_uint<MORTON_BITS> morton_code;
    ap_uint<32> x, y;
    ap_uint<1> valid;
    ap_uint<32> feature_index;
};
struct ZLayerBuffer
{
    ZLayerVoxel voxels[MAX_VOXELS_PER_LAYER];
    ap_uint<32> voxel_count;
    ap_uint<32> z_layer;
    ap_uint<1> loaded;
};
class ZBufferConvolutionEngine
{
public:
    void initialize_z_buffer(float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
                             float bias[FEATURE_DIM]);
    void process_z_buffer_convolution(
        ap_uint<MORTON_BITS> *morton_list,
        ap_uint<32> num_voxels,
        ap_uint<BRAM_WIDTH> *L3_bitmap,
        ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
        ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
        ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
        PrunedBitmapInfo &bitmap_info,
        ap_uint<32> *feature_dram_read,
        ap_uint<32> *feature_dram_write);

private:
    ZLayerBuffer layer_buffers[3];
    float stored_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    float stored_bias[FEATURE_DIM];
    void load_z_layer(ap_uint<32> target_z,
                      ap_uint<MORTON_BITS> *morton_list,
                      ap_uint<32> num_voxels,
                      ap_uint<32> buffer_index,
                      ap_uint<32> *feature_dram_read);
    bool find_neighbor_in_buffer(ap_uint<32> center_x, ap_uint<32> center_y, ap_uint<32> center_z,
                                 int dx, int dy, int dz,
                                 ap_uint<32> &neighbor_feature_index);
    void slide_buffer_window();
    void convolve_voxel_z_buffer(const ZLayerVoxel &center_voxel,
                                 ap_uint<MORTON_BITS> *morton_list,
                                 ap_uint<32> num_voxels,
                                 ap_uint<32> *feature_dram_read,
                                 ap_uint<32> *feature_dram_write,
                                 ap_uint<32> output_index);
};
class SystolicArray
{
public:
    SystolicArray();
    void load_weights(float weights[FEATURE_DIM][FEATURE_DIM]);
    void compute(float input_features[FEATURE_DIM],
                 float output_features[FEATURE_DIM],
                 float bias[FEATURE_DIM]);
    void reset();

private:
    ProcessingElement pe_array[SYSTOLIC_ROWS][SYSTOLIC_COLS];
    float row_buffer[SYSTOLIC_ROWS][SYSTOLIC_COLS];
    float col_buffer[SYSTOLIC_ROWS][SYSTOLIC_COLS];
};
class ConvolutionEngine
{
public:
    void initialize(float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
                    float bias[FEATURE_DIM]);
    void convolve_voxel_streaming(
        FeatureBuffer *input_features,
        ap_uint<MORTON_BITS> *morton_list,
        ap_uint<32> feature_idx,
        ap_uint<32> num_voxels,
        ap_uint<BRAM_WIDTH> *L3_bitmap,
        ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
        ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
        ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
        PrunedBitmapInfo &bitmap_info,
        StreamingPointers &stream_ptrs,
        FeatureBuffer &output_features);
    void process_sparse_convolution_streaming(
        ap_uint<MORTON_BITS> *morton_list,
        ap_uint<32> num_voxels,
        ap_uint<BRAM_WIDTH> *L3_bitmap,
        ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
        ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
        ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
        PrunedBitmapInfo &bitmap_info,
        ap_uint<32> *feature_dram_read,
        ap_uint<32> *feature_dram_write);

private:
    ZBufferConvolutionEngine z_buffer_engine;
    SystolicArray systolic_arrays[SYSTOLIC_ARRAY_COUNT];
    float stored_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    float stored_bias[FEATURE_DIM];
    static const ap_int<8> NEIGHBOR_OFFSETS[KERNEL_VOLUME][3];
};
inline float hw_multiply(float a, float b)
{
#pragma HLS INLINE
    return a * b;
}
inline float hw_add(float a, float b)
{
#pragma HLS INLINE
    return a + b;
}
void prefetch_voxel_features_morton(ap_uint<MORTON_BITS> morton, ap_uint<32> voxel_idx,
                                    ap_uint<32> *feature_dram_read);
void sort_morton_list_for_convolution_reads(ap_uint<MORTON_BITS> *morton_list, ap_uint<32> num_voxels);
#endif
