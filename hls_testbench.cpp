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
static ap_uint<32> feature_dram_morton_write[1048576];  // Morton stage writes input features here
    static ap_uint<32> feature_dram_conv_read[1048576];     // Convolution reads from same data (shared memory)
    static ap_uint<32> feature_dram_conv_write[1048576];    // Convolution writes output features here    static ap_uint<BRAM_WIDTH> L3_bitmap[L3_WORDS];
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

    // Create convolution weights (identity kernel at center for testing)
    static float conv_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    static float conv_bias[FEATURE_DIM];
    
    // Initialize weights - identity at center (kernel position 13 for 3x3x3 = 27 total)
    for (int n = 0; n < KERNEL_VOLUME; n++) {
        for (int i = 0; i < FEATURE_DIM; i++) {
            for (int j = 0; j < FEATURE_DIM; j++) {
                conv_weights[n][i][j] = (n == 13 && i == j) ? 1.0f : 0.0f;
            }
        }
    }
    
    // Initialize bias to zero
    for (int i = 0; i < FEATURE_DIM; i++) {
        conv_bias[i] = 0.0f;
    }

    // Done signal
    ap_uint<1> done = 0;

    // Call the main pipeline with 3 separate DRAM interfaces
    complete_octree_pipeline(
        sensor_data,                    // Input voxel stream
        feature_dram_morton_write,      // Morton stage writes input features here
        feature_dram_conv_read,         // Convolution reads input features from here  
        feature_dram_conv_write,        // Convolution writes output features here
        L3_bitmap,                      // Octree bitmaps
        L2_bitmap_pruned,
        L1_bitmap_pruned,
        L0_bitmap_pruned,
        conv_weights,                   // Convolution weights
        conv_bias,                      // Convolution bias
        1,                              // Start signal
        &done                           // Done signal
    );

    return 0;
}
