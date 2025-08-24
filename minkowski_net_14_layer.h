#ifndef MINKOWSKI_NET_14_LAYER_H
#define MINKOWSKI_NET_14_LAYER_H

#include "complete_pipeline.h"

// Layer configuration structure
struct LayerConfig {
    int input_channels;
    int output_channels; 
    int input_spatial_dim;
    int output_spatial_dim;
    int stride;
    bool is_transpose; // true for ConvTranspose3d layers
};

// 14-layer MinkowskiNet configuration
static const LayerConfig MINKOWSKI_LAYERS[14] = {
    // Encoder layers (downsampling)
    {3,   16,  64, 64, 1, false},  // Layer 1: Conv3d
    {16,  32,  64, 32, 2, false},  // Layer 2: Conv3d with stride=2  
    {32,  64,  32, 16, 2, false},  // Layer 3: Conv3d with stride=2
    {64,  128, 16, 8,  2, false},  // Layer 4: Conv3d with stride=2
    {128, 256, 8,  4,  2, false},  // Layer 5: Conv3d with stride=2
    {256, 512, 4,  2,  2, false},  // Layer 6: Conv3d with stride=2
    {512, 1024,2,  1,  2, false},  // Layer 7: Conv3d with stride=2 (bottleneck)
    
    // Decoder layers (upsampling)
    {1024,512, 1,  2,  2, true},   // Layer 8: ConvTranspose3d
    {512, 256, 2,  4,  2, true},   // Layer 9: ConvTranspose3d
    {256, 128, 4,  8,  2, true},   // Layer 10: ConvTranspose3d
    {128, 64,  8,  16, 2, true},   // Layer 11: ConvTranspose3d
    {64,  32,  16, 32, 2, true},   // Layer 12: ConvTranspose3d
    {32,  16,  32, 64, 2, true},   // Layer 13: ConvTranspose3d
    
    // Output layer
    {16,  20,  64, 64, 1, false}   // Layer 14: Conv3d (final classification)
};

// Maximum feature channels across all layers
#define MAX_FEATURE_CHANNELS 1024

// No FIFOs - all intermediate results go to DRAM
// Cross-row sorting decision based on compile-time layer dimensions
#define CROSS_ROW_SORTING_THRESHOLD 16  // Layers with dim <= 16 use cross-row sorting

// Function declarations
void minkowski_net_14_layer_pipeline(
    hls::stream<VoxelData> &input_voxel_stream,
    ap_uint<32> *final_output_full_cubic,  // Full cubic output with zeros restored
    
    // All 14 layer weights and biases
    float layer_weights[14][KERNEL_VOLUME][MAX_FEATURE_CHANNELS][MAX_FEATURE_CHANNELS],
    float layer_biases[14][MAX_FEATURE_CHANNELS],
    
    // Single pruned DRAM - persistent across all layers
    ap_uint<32> *pruned_feature_dram_read,   // Input features (pruned format)
    ap_uint<32> *pruned_feature_dram_write,  // Output features (pruned format)
    
    // Single set of octree bitmaps (persistent across all layers)
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap, 
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    
    PrunedBitmapInfo &bitmap_info,  // Single bitmap info for the octree
    ap_uint<32> &total_processed_voxels
);

// Individual layer processing using your accelerator with persistent BRAM + pruned DRAM
void layer_convolution_with_persistent_accelerator(
    int layer_idx,
    const LayerConfig &config,
    
    float weights[KERNEL_VOLUME][MAX_FEATURE_CHANNELS][MAX_FEATURE_CHANNELS],
    float bias[MAX_FEATURE_CHANNELS],
    
    // Persistent BRAM octree (shared across all layers)
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    
    // Pruned DRAM (input/output both pruned format)
    ap_uint<32> *pruned_dram_read,
    ap_uint<32> *pruned_dram_write,
    
    ap_uint<32> num_pruned_voxels
);

// Logical bitmap reconstruction - use access pointers to understand octree structure
void logical_bitmap_reconstruction_with_access_pointers(
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    StreamingPointers &access_pointers
);

// Final layer output reconstruction - restore zeros to create full cubic output
void final_layer_output_reconstruction(
    ap_uint<32> *pruned_dram_output,        // Pruned format output from Layer 14
    ap_uint<32> *full_cubic_output,         // Full 64³×20 output with zeros restored
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    int output_channels,
    ap_uint<32> num_pruned_voxels
);

// Cross-row sorting for intermediate DRAM writes (compile-time decision)
bool should_use_cross_row_sorting(int spatial_dim);

// Access pointer mechanism - core of your innovation
ap_uint<32> access_pointer_lookup(
    ap_uint<32> x, ap_uint<32> y, ap_uint<32> z,  // Full cubic coordinates
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    bool &voxel_exists  // Returns whether this voxel exists in pruned DRAM
);

#endif // MINKOWSKI_NET_14_LAYER_H