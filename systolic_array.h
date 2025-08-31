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
// FULL 3 Z-Layer Multiplication Array Configuration - Complete Spatial Coverage
#define Z_LAYER_MULT_ARRAYS 3           // One array per z-layer in sliding window  
#define Z_LAYER_SPATIAL_DIM DIM_L0      // Full 64x64 spatial coverage per z-layer
#define Z_LAYER_TOTAL_VOXELS (DIM_L0 * DIM_L0)  // 4096 voxels per z-layer
#define FULL_PARALLEL_PROCESSING 1      // Process entire z-layer simultaneously
#define MAX_VOXELS_PER_LAYER 4096       // Keep for compatibility

// DSP Resource Configuration - Per Input Channel Architecture  
#define TOTAL_DSP_MULTIPLIERS (Z_LAYER_MULT_ARRAYS * FEATURE_DIM * DIM_L0 * DIM_L0 * 3)
// Total DSP usage: 3 arrays * 32 input_ch * 64 * 64 * 3 z_layers = 1,179,648 multipliers per layer
// But for Layer 1: only 3 input channels needed = 3 * 3 * 64 * 64 * 3 = 110,592 multipliers
#endif
struct ZLayerVoxel
{
    ap_uint<MORTON_BITS> morton_code;
    ap_uint<32> x, y;
    ap_uint<1> valid;
    ap_uint<32> feature_index;
};
// O(1) Direct BRAM Occupancy Map for neighbor lookup
struct ZLayerOccupancyMap
{
    ap_uint<1> occupied[DIM_L0][DIM_L0];          // 64x64 occupancy bitmap - O(1) lookup
    ap_uint<32> feature_indices[DIM_L0][DIM_L0];  // Direct feature index mapping
    ap_uint<MORTON_BITS> morton_codes[DIM_L0][DIM_L0]; // Morton codes for DRAM addressing
    ap_uint<32> z_layer;
    ap_uint<1> loaded;
    ap_uint<32> total_voxels;                     // Count of occupied voxels
};

// Legacy buffer structure (keep for compatibility during transition)
struct ZLayerBuffer
{
    ZLayerVoxel voxels[MAX_VOXELS_PER_LAYER];
    ap_uint<32> voxel_count;
    ap_uint<32> z_layer;
    ap_uint<1> loaded;
};

// CORRECT Z-Layer Multiplication Array - Per Input Channel Coverage
struct FullZLayerMultiplicationArray
{
    // Per-channel multiplication hardware - dynamic based on layer input channels
    // Layer 1: [3][64][64][3] = 36,864 multipliers
    // Layer 2: [16][64][64][3] = 196,608 multipliers (for 32×32×32 spatial at layer 2)
    // But we allocate max size and use only what's needed per layer
    float mult_units[FEATURE_DIM][DIM_L0][DIM_L0][3];  // [max_input_ch][64][64][3_z_layers]
    float accumulator[DIM_L0][DIM_L0][FEATURE_DIM];    // [64][64][output_features]  
    ap_uint<1> active[DIM_L0][DIM_L0];                 // [64][64] spatial coverage
    
    void reset();
    void compute_full_z_layer(
        ZLayerOccupancyMap &occupancy_map,
        float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
        float bias[FEATURE_DIM],
        ap_uint<32> *feature_dram_read,
        ap_uint<32> *feature_dram_write,
        ap_uint<32> z_layer_index
    );
    void compute_single_voxel_parallel(
        ap_uint<32> voxel_x, ap_uint<32> voxel_y,
        float input_features[FEATURE_DIM],
        float weights[FEATURE_DIM][FEATURE_DIM], 
        float bias[FEATURE_DIM],
        float output_features[FEATURE_DIM]
    );
};

// Legacy structure (keep during transition)
struct ZLayerMultiplicationArray
{
    float mult_units[8][FEATURE_DIM][FEATURE_DIM];
    float accumulator[8][FEATURE_DIM];
    ap_uint<1> active[8];
    
    void reset();
    void compute_voxel_features(
        float input_features[FEATURE_DIM],
        float weights[FEATURE_DIM][FEATURE_DIM], 
        float bias[FEATURE_DIM],
        ap_uint<32> voxel_slot,
        float output_features[FEATURE_DIM]
    );
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

public:
    // New O(1) occupancy maps for direct neighbor lookup
    ZLayerOccupancyMap occupancy_maps[3];         // 3 z-layer occupancy maps
    
    // NEW: Full 3 z-layer multiplication arrays - 64x64x3 coverage
    FullZLayerMultiplicationArray full_z_mult_arrays[Z_LAYER_MULT_ARRAYS];
    
    // O(1) direct BRAM neighbor lookup functions
    void load_z_layer_occupancy_map(ap_uint<32> target_z,
                                     ap_uint<MORTON_BITS> *morton_list,
                                     ap_uint<32> num_voxels,
                                     ap_uint<32> map_index,
                                     ap_uint<32> *feature_dram_read);
    bool find_neighbor_direct(ap_uint<32> center_x, ap_uint<32> center_y, ap_uint<32> center_z,
                              int dx, int dy, int dz,
                              ap_uint<32> &neighbor_feature_index,
                              ap_uint<MORTON_BITS> &neighbor_morton);
    void slide_occupancy_maps();

private:
    
    // Legacy buffers (keep during transition)
    ZLayerBuffer layer_buffers[3];
    ZLayerMultiplicationArray z_mult_arrays[Z_LAYER_MULT_ARRAYS];
    float stored_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    float stored_bias[FEATURE_DIM];
    void load_z_layer(ap_uint<32> target_z,
                      ap_uint<MORTON_BITS> *morton_list,
                      ap_uint<32> num_voxels,
                      ap_uint<32> buffer_index,
                      ap_uint<32> *feature_dram_read);
    
    // LEGACY: Keep old functions during transition
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

public:
    static const ap_int<8> NEIGHBOR_OFFSETS[KERNEL_VOLUME][3];

private:
    ZBufferConvolutionEngine z_buffer_engine;
    // Replaced oversized systolic arrays with optimized z-layer multiplication arrays
    // Now handled within ZBufferConvolutionEngine's z_mult_arrays
    float stored_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    float stored_bias[FEATURE_DIM];
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
