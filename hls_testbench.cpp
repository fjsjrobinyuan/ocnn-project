#define HLS_TESTBENCH
#include "complete_pipeline.h"
#include <hls_stream.h> 
int main() {
    hls::stream<VoxelData> sensor_data("sensor_data");
    for (int z = 0; z < DIM_L0; z++) {
        for (int y = 0; y < DIM_L0; y++) {
            for (int x = 0; x < DIM_L0; x++) {
                VoxelData voxel;
                voxel.occupancy = ((x + y + z) % 2 == 0) ? 1 : 0;
                for (int f = 0; f < FEATURE_DIM; f++) {
                    voxel.features[f] = (float)(x + y + z + f) * 0.1f;
                }
                voxel.morton_addr = morton3D(x, y, z);
                sensor_data.write(voxel);
            }
        }
    }
// Multi-layer weights
    static float layer1_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    static float layer2_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    static float layer3_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    static float layer1_bias[FEATURE_DIM];
    static float layer2_bias[FEATURE_DIM]; 
    static float layer3_bias[FEATURE_DIM];
    
    static ap_uint<32> feature_dram_morton_write[1048576];  // Morton stage writes input features here
    static ap_uint<32> feature_dram_conv_read[1048576];     // Convolution reads from same data (shared memory)
    static ap_uint<32> feature_dram_conv_write[1048576];    // Convolution writes output features here
    // Create bitmap arrays
    static ap_uint<BRAM_WIDTH> L3_bitmap[L3_WORDS];
    static ap_uint<BRAM_WIDTH> L2_bitmap_pruned[1024];
    static ap_uint<BRAM_WIDTH> L1_bitmap_pruned[1024];
    static ap_uint<BRAM_WIDTH> L0_bitmap_pruned[1024];
    // Initialize all DRAM arrays to zero
    for (int i = 0; i < 1048576; i++) {
        feature_dram_morton_write[i] = 0;
        feature_dram_conv_read[i] = 0;
        feature_dram_conv_write[i] = 0;
    }
    
    // Initialize bitmap arrays to zero
    for (int i = 0; i < L3_WORDS; i++) L3_bitmap[i] = 0;
    for (int i = 0; i < 1024; i++) {
        L2_bitmap_pruned[i] = 0;
        L1_bitmap_pruned[i] = 0;
        L0_bitmap_pruned[i] = 0;
    }

    // Initialize multi-layer weights (random values for testing)
    for (int k = 0; k < KERNEL_VOLUME; k++) {
        for (int i = 0; i < FEATURE_DIM; i++) {
            for (int j = 0; j < FEATURE_DIM; j++) {
                // Layer 1: identity kernel at center
                layer1_weights[k][i][j] = (k == 13 && i == j) ? 1.0f : 0.0f;
                // Layer 2: small random weights
                layer2_weights[k][i][j] = (float)(rand() % 100 - 50) / 500.0f;
                // Layer 3: small random weights  
                layer3_weights[k][i][j] = (float)(rand() % 100 - 50) / 500.0f;
            }
        }
    }
    
    // Initialize bias to zero for all layers
    for (int i = 0; i < FEATURE_DIM; i++) {
        layer1_bias[i] = 0.0f;
        layer2_bias[i] = 0.1f;  // Small positive bias
        layer3_bias[i] = 0.1f;  // Small positive bias
    }

    // Done signal
    ap_uint<1> done = 0;

    // Create output stream for multi-layer pipeline
    hls::stream<ap_uint<32>> final_output_stream;
    ap_uint<32> processed_voxels = 0;
    
    // Initialize bitmap info
    PrunedBitmapInfo bitmap_info;
#if NUM_LEVELS >= 4
    bitmap_info.L3_size = 0;
#endif
#if NUM_LEVELS >= 3
    bitmap_info.L2_size = 0;
#endif
#if NUM_LEVELS >= 2
    bitmap_info.L1_size = 0;
#endif
    bitmap_info.L0_size = 0;
    bitmap_info.total_size = 0;
    
    // Create additional DRAM arrays for multi-layer processing  
    static ap_uint<32> feature_dram_layer2[1048576];
    static ap_uint<32> feature_dram_layer3[1048576];
    
    // Initialize additional DRAM arrays
    for (int i = 0; i < 1048576; i++) {
        feature_dram_layer2[i] = 0;
        feature_dram_layer3[i] = 0;
    }

    // Call the multi-layer streaming pipeline
    multi_layer_streaming_pipeline(
        sensor_data,                    // Input voxel stream
        final_output_stream,            // Final output stream
        layer1_weights, layer1_bias,    // Layer 1 weights/bias
        layer2_weights, layer2_bias,    // Layer 2 weights/bias  
        layer3_weights, layer3_bias,    // Layer 3 weights/bias
        feature_dram_morton_write,      // Layer 1 DRAM (reuse existing)
        feature_dram_layer2,            // Layer 2 DRAM
        feature_dram_layer3,            // Layer 3 DRAM
        L3_bitmap,                      // Octree bitmaps
        L2_bitmap_pruned,
        L1_bitmap_pruned,
        L0_bitmap_pruned,
        bitmap_info,                    // Bitmap info
        processed_voxels               // Output: processed voxel count
    );
    
    // Read and print final outputs
    int output_count = 0;
    while (!final_output_stream.empty() && output_count < 10) {
        ap_uint<32> output_data = final_output_stream.read();
        float output_val = *((float*)&output_data);
        printf("Output[%d]: %f\n", output_count, output_val);
        output_count++;
    }
    
    printf("Multi-layer pipeline completed. Processed %d voxels.\n", (int)processed_voxels);

    return 0;
}
