#ifndef OCNN6_NET_8_LAYER_H
#define OCNN6_NET_8_LAYER_H

#include "complete_pipeline.h"

// Layer configuration structure for OCNN6
struct OCNN6LayerConfig {
    int input_channels;
    int output_channels; 
    int input_spatial_dim;
    int output_spatial_dim;
    int stride;
    bool is_fully_connected; // true for FC layers
};

// 8-layer OCNN6 configuration (6 conv + 2 FC)
static const OCNN6LayerConfig OCNN6_LAYERS[8] = {
    // Convolutional layers (downsampling)
    {3,   16,  64, 32, 2, false},  // Layer 1: Conv3d with stride=2
    {16,  32,  32, 16, 2, false},  // Layer 2: Conv3d with stride=2  
    {32,  64,  16, 8,  2, false},  // Layer 3: Conv3d with stride=2
    {64,  128, 8,  4,  2, false},  // Layer 4: Conv3d with stride=2
    {128, 256, 4,  2,  2, false},  // Layer 5: Conv3d with stride=2
    {256, 512, 2,  1,  2, false},  // Layer 6: Conv3d with stride=2 (bottleneck)
    
    // Fully connected layers
    {512, 128, 1,  1,  1, true},   // Layer 7: FC (512 -> 128)
    {128, 40,  1,  1,  1, true}    // Layer 8: FC (128 -> 40) - final output
};

// Maximum feature channels across all layers
#define OCNN6_MAX_FEATURE_CHANNELS 512

// No FIFOs - all intermediate results go to DRAM
// Cross-row sorting decision based on compile-time layer dimensions
#define OCNN6_CROSS_ROW_SORTING_THRESHOLD 8  // Layers with dim <= 8 use cross-row sorting

// Function declarations
void ocnn6_net_8_layer_pipeline(
    hls::stream<VoxelData> &input_voxel_stream,
    ap_uint<32> *final_output_full_cubic,  // Full cubic output with zeros restored
    
    // All 8 layer weights and biases
    float layer_weights[8][KERNEL_VOLUME][OCNN6_MAX_FEATURE_CHANNELS][OCNN6_MAX_FEATURE_CHANNELS],
    float layer_biases[8][OCNN6_MAX_FEATURE_CHANNELS],
    
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
void ocnn6_layer_convolution_with_persistent_accelerator(
    int layer_idx,
    const OCNN6LayerConfig &config,
    
    float weights[KERNEL_VOLUME][OCNN6_MAX_FEATURE_CHANNELS][OCNN6_MAX_FEATURE_CHANNELS],
    float bias[OCNN6_MAX_FEATURE_CHANNELS],
    
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

// Fully connected layer processing for final layers
void ocnn6_fully_connected_layer(
    int layer_idx,
    const OCNN6LayerConfig &config,
    
    float weights[KERNEL_VOLUME][OCNN6_MAX_FEATURE_CHANNELS][OCNN6_MAX_FEATURE_CHANNELS],
    float bias[OCNN6_MAX_FEATURE_CHANNELS],
    
    // Pruned DRAM (input/output both pruned format)
    ap_uint<32> *pruned_dram_read,
    ap_uint<32> *pruned_dram_write,
    
    ap_uint<32> num_pruned_voxels
);

// Logical bitmap reconstruction - use access pointers to understand octree structure
void ocnn6_logical_bitmap_reconstruction_with_access_pointers(
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    StreamingPointers &access_pointers
);

// Final layer output reconstruction - restore zeros to create full cubic output
void ocnn6_final_layer_output_reconstruction(
    ap_uint<32> *pruned_dram_output,        // Pruned format output from Layer 8
    ap_uint<32> *full_cubic_output,         // Full 64³×40 output with zeros restored
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    int output_channels,
    ap_uint<32> num_pruned_voxels
);

// Cross-row sorting for intermediate DRAM writes (compile-time decision)
bool ocnn6_should_use_cross_row_sorting(int spatial_dim);

// Access pointer mechanism - core of your innovation
ap_uint<32> ocnn6_access_pointer_lookup(
    ap_uint<32> x, ap_uint<32> y, ap_uint<32> z,  // Full cubic coordinates
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    bool &voxel_exists  // Returns whether this voxel exists in pruned DRAM
);

#endif // OCNN6_NET_8_LAYER_H