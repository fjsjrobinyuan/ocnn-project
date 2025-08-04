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
    static ap_uint<32> feature_dram[1048576];
    static ap_uint<BRAM_WIDTH> L3_bitmap[L3_WORDS];
    static ap_uint<BRAM_WIDTH> L2_bitmap_pruned[1024];
    static ap_uint<BRAM_WIDTH> L1_bitmap_pruned[1024];
    static ap_uint<BRAM_WIDTH> L0_bitmap_pruned[1024];
    for (int i = 0; i < 1048576; i++) feature_dram[i] = 0;
    for (int i = 0; i < L3_WORDS; i++) L3_bitmap[i] = 0;
    for (int i = 0; i < 1024; i++) {
        L2_bitmap_pruned[i] = 0;
        L1_bitmap_pruned[i] = 0;
        L0_bitmap_pruned[i] = 0;
    }
    static float conv_weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    static float conv_bias[FEATURE_DIM];
    for (int n = 0; n < KERNEL_VOLUME; n++) {
        for (int i = 0; i < FEATURE_DIM; i++) {
            for (int j = 0; j < FEATURE_DIM; j++) {
                conv_weights[n][i][j] = (n == 13 && i == j) ? 1.0f : 0.0f;
            }
        }
    }
    for (int i = 0; i < FEATURE_DIM; i++) {
        conv_bias[i] = 0.0f;
    }
    ap_uint<1> done = 0;
    complete_octree_pipeline(
        sensor_data,
        feature_dram,
        L3_bitmap,
        L2_bitmap_pruned,
        L1_bitmap_pruned,
        L0_bitmap_pruned,
        conv_weights,
        conv_bias,
        1,  
        &done
    );
    return 0;
}
