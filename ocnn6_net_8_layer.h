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

// NEW: 8-Layer Assembly Line Pipeline Functions
void ocnn6_streaming_layer_pipeline(
    hls::stream<VoxelData> &input_stream,
    hls::stream<VoxelData> &output_stream,
    float *layer_weights,
    float *layer_bias,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    ap_uint<32> *feature_dram_read,
    ap_uint<32> *feature_dram_write
);

void ocnn6_assembly_line_8_layers(
    hls::stream<VoxelData> &input_voxel_stream,
    hls::stream<VoxelData> &output_voxel_stream,
    
    // All weight arrays
    float *conv1_weights, float *conv2_weights, float *conv3_weights,
    float *conv4_weights, float *conv5_weights, float *conv6_weights,
    float *fc1_weights, float *fc2_weights,
    
    // All bias arrays  
    float *conv1_bias, float *conv2_bias, float *conv3_bias,
    float *conv4_bias, float *conv5_bias, float *conv6_bias,
    float *fc1_bias, float *fc2_bias,
    
    // Shared resources
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    ap_uint<32> *feature_dram_read,
    ap_uint<32> *feature_dram_write
);

// Function declarations
void ocnn6_net_8_layer_pipeline(
    hls::stream<VoxelData> &input_voxel_stream,
    ap_uint<32> *final_output_full_cubic,  // Full cubic output with zeros restored
    
    // Separate weight arrays per layer (all in DRAM)
    float *conv1_weights,  // [27*3*16] = 1,296 weights
    float *conv2_weights,  // [27*16*32] = 13,824 weights
    float *conv3_weights,  // [27*32*64] = 55,296 weights
    float *conv4_weights,  // [27*64*128] = 221,184 weights
    float *conv5_weights,  // [27*128*256] = 884,736 weights
    float *conv6_weights,  // [27*256*512] = 3,538,944 weights
    float *fc1_weights,    // [512*128] = 65,536 weights
    float *fc2_weights,    // [128*40] = 5,120 weights
    
    // Separate bias arrays per layer
    float *conv1_bias,     // [16] biases
    float *conv2_bias,     // [32] biases
    float *conv3_bias,     // [64] biases
    float *conv4_bias,     // [128] biases
    float *conv5_bias,     // [256] biases
    float *conv6_bias,     // [512] biases
    float *fc1_bias,       // [128] biases
    float *fc2_bias,       // [40] biases
    
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

// DEPRECATED: Template convolution functions - replaced by 3 z-layer multiplication arrays
// These templates created massive resource usage (3.5M multipliers vs 768 multipliers)
/*
template<int INPUT_CHANNELS, int OUTPUT_CHANNELS>
void ocnn6_conv_template(
    float *layer_weights,
    float *layer_bias,
    hls::stream<VoxelData> &input_stream,
    hls::stream<VoxelData> &output_stream
) {
#pragma HLS INLINE off

    const int MAX_VOXELS_THIS_LAYER = 100000;
    
    TEMPLATE_STREAM_PROCESSING: for (int v = 0; v < MAX_VOXELS_THIS_LAYER; v++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=100 max=10000
        
        if (input_stream.empty()) break;
        
        VoxelData input_voxel = input_stream.read();
        
        // Extract input features
        float input_features[INPUT_CHANNELS];
        for (int c = 0; c < INPUT_CHANNELS; c++) {
#pragma HLS UNROLL factor=2
            input_features[c] = input_voxel.features[c];
        }
        
        // Initialize output with bias
        float output_features[OUTPUT_CHANNELS];
        for (int oc = 0; oc < OUTPUT_CHANNELS; oc++) {
#pragma HLS UNROLL factor=2
            output_features[oc] = layer_bias[oc];
        }
        
        // Simple convolution computation
        TEMPLATE_CONV_OUTPUT: for (int oc = 0; oc < OUTPUT_CHANNELS; oc++) {
#pragma HLS UNROLL factor=4
            TEMPLATE_CONV_INPUT: for (int ic = 0; ic < INPUT_CHANNELS; ic++) {
#pragma HLS UNROLL factor=2
                int weight_base = (ic * OUTPUT_CHANNELS + oc) * 27;
                for (int k = 0; k < 27; k++) {
#pragma HLS PIPELINE II=1
                    float weight = layer_weights[weight_base + k];
                    float mult_result = input_features[ic] * weight;
#pragma HLS RESOURCE variable=mult_result core=DSP48 impl=dsp
                    output_features[oc] += mult_result;
                }
            }
        }
        
        // Apply ReLU
        for (int oc = 0; oc < OUTPUT_CHANNELS; oc++) {
#pragma HLS UNROLL factor=2
            if (output_features[oc] < 0.0f) output_features[oc] = 0.0f;
        }
        
        // Create output voxel
        VoxelData output_voxel;
        for (int c = 0; c < OUTPUT_CHANNELS; c++) {
#pragma HLS UNROLL factor=2
            output_voxel.features[c] = output_features[c];
        }
        for (int c = OUTPUT_CHANNELS; c < FEATURE_DIM; c++) {
#pragma HLS UNROLL factor=2
            output_voxel.features[c] = 0.0f;
        }
        
        output_voxel.morton_addr = input_voxel.morton_addr;
        output_voxel.occupancy = 1;
        
        output_stream.write(output_voxel);
    }
}
*/

// DEPRECATED: Template FC functions - replaced by 3 z-layer multiplication arrays  
/*
template<int INPUT_CHANNELS, int OUTPUT_CHANNELS>
void ocnn6_fc_template(
    float *layer_weights,
    float *layer_bias,
    hls::stream<VoxelData> &input_stream,
    hls::stream<VoxelData> &output_stream
) {
#pragma HLS INLINE off

    const int MAX_VOXELS_FC = 10000;
    
    TEMPLATE_FC_PROCESSING: for (int v = 0; v < MAX_VOXELS_FC; v++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=1 max=1000
        
        if (input_stream.empty()) break;
        
        VoxelData input_voxel = input_stream.read();
        
        // Extract input features
        float input_features[INPUT_CHANNELS];
        for (int c = 0; c < INPUT_CHANNELS; c++) {
            input_features[c] = input_voxel.features[c];
        }
        
        // Initialize output with bias
        float output_features[OUTPUT_CHANNELS];
        for (int oc = 0; oc < OUTPUT_CHANNELS; oc++) {
#pragma HLS UNROLL factor=2
            output_features[oc] = layer_bias[oc];
        }
        
        // Matrix multiplication
        for (int oc = 0; oc < OUTPUT_CHANNELS; oc++) {
            for (int ic = 0; ic < INPUT_CHANNELS; ic++) {
#pragma HLS PIPELINE II=1
                int weight_idx = ic * OUTPUT_CHANNELS + oc;
                float fc_mult = input_features[ic] * layer_weights[weight_idx];
#pragma HLS RESOURCE variable=fc_mult core=DSP48 impl=dsp
                output_features[oc] += fc_mult;
            }
        }
        
        // Apply ReLU (except for final layer with 40 outputs)
        if (OUTPUT_CHANNELS != 40) {
            for (int oc = 0; oc < OUTPUT_CHANNELS; oc++) {
#pragma HLS UNROLL factor=2
                if (output_features[oc] < 0.0f) output_features[oc] = 0.0f;
            }
        }
        
        // Create output voxel
        VoxelData output_voxel;
        for (int c = 0; c < OUTPUT_CHANNELS; c++) {
#pragma HLS UNROLL factor=2
            output_voxel.features[c] = output_features[c];
        }
        for (int c = OUTPUT_CHANNELS; c < FEATURE_DIM; c++) {
#pragma HLS UNROLL factor=2
            output_voxel.features[c] = 0.0f;
        }
        
        output_voxel.morton_addr = input_voxel.morton_addr;
        output_voxel.occupancy = 1;
        
        output_stream.write(output_voxel);
    }
}
*/


// Logical bitmap reconstruction - use access pointers to understand octree structure
void ocnn6_logical_bitmap_reconstruction_with_access_pointers(
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    StreamingPointers &access_pointers
);

// Final layer output reconstruction from stream - restore zeros to create full cubic output
void ocnn6_final_layer_output_reconstruction_streaming(
    hls::stream<VoxelData> &output_stream,  // Stream from Layer 8 (40 channels)
    ap_uint<32> *full_cubic_output,         // Full 64³×40 output with zeros restored
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap,
    ap_uint<BRAM_WIDTH> *L1_bitmap,
    ap_uint<BRAM_WIDTH> *L0_bitmap,
    PrunedBitmapInfo &bitmap_info,
    int output_channels
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

// Layer-specific 3-Z buffer structures - ONLY store occupancy info, not features!
struct LayerZLayerVoxel {
    ap_uint<MORTON_BITS> morton_code;
    ap_uint<32> x, y;
    ap_uint<1> valid;  // Only 1 bit: occupied or empty
    ap_uint<32> dram_address;  // DRAM address where features are stored
    // NO FEATURES - they stay in DRAM to save on-chip memory!
};

struct LayerZLayerBuffer {
    LayerZLayerVoxel voxels[MAX_VOXELS_L0]; // Use existing MAX_VOXELS_L0 constant
    ap_uint<32> voxel_count;
    ap_uint<32> z_layer;
    ap_uint<1> loaded;
};

// 3-Z sliding window buffer management following your standard ZBufferConvolutionEngine design
void ocnn6_slide_layer_buffer_window(
    LayerZLayerBuffer layer_buffers[3]
);

// Find neighbor in 3-Z buffer following your standard find_neighbor_in_buffer design
// Now returns DRAM address of neighbor instead of buffer index
bool ocnn6_find_neighbor_in_layer_buffer(
    ap_uint<32> center_x, ap_uint<32> center_y, ap_uint<32> center_z,
    int dx, int dy, int dz,
    LayerZLayerBuffer layer_buffers[3],
    ap_uint<32> &neighbor_dram_address
);

#endif // OCNN6_NET_8_LAYER_H