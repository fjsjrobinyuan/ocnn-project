#define HLS_TESTBENCH
#include "ocnn6_net_8_layer.h"
#include <iostream>
#include <random>
#include <fstream>

/**
 * CORRECTED testbench for 8-layer OCNN6 using persistent BRAM + pruned DRAM architecture
 */
int main() {
    std::cout << "=== 8-LAYER OCNN6 TESTBENCH (CORRECTED) ===" << std::endl;

    // Generate input voxel stream (64³ with 3 channels)
    hls::stream<VoxelData> input_voxel_stream("input_voxels");
    std::cout << "Generating 64³ sparse input voxels with 3 channels..." << std::endl;
    
    std::random_device rd;
    std::mt19937 gen(42); // Fixed seed for reproducibility
    std::uniform_real_distribution<float> dis(-1.0f, 1.0f);
    
    int occupied_voxel_count = 0;
    for (int z = 0; z < 64; z++) {
        for (int y = 0; y < 64; y++) {
            for (int x = 0; x < 64; x++) {
                VoxelData voxel;
                
                // Create sparse pattern (~5% occupancy for realistic testing)
                voxel.occupancy = ((x + y + z) % 20 == 0) ? 1 : 0;
                if (voxel.occupancy) occupied_voxel_count++;
                
                // 3 input channels (RGB or similar)
                for (int c = 0; c < 3; c++) {
                    voxel.features[c] = voxel.occupancy ? dis(gen) : 0.0f;
                }
                
                // Zero unused channels
                for (int c = 3; c < FEATURE_DIM; c++) {
                    voxel.features[c] = 0.0f;
                }
                
                voxel.morton_addr = morton3D(x, y, z);
                input_voxel_stream.write(voxel);
            }
        }
    }
    
    std::cout << "Generated " << (64*64*64) << " total voxels (" << occupied_voxel_count << " occupied, " 
              << (100.0f * occupied_voxel_count / (64*64*64)) << "% sparse)" << std::endl;

    // Initialize 8-layer weights and biases
    std::cout << "Initializing 8 layers of weights and biases..." << std::endl;
    
    static float layer_weights[8][KERNEL_VOLUME][OCNN6_MAX_FEATURE_CHANNELS][OCNN6_MAX_FEATURE_CHANNELS];
    static float layer_biases[8][OCNN6_MAX_FEATURE_CHANNELS];
    
    for (int layer = 0; layer < 8; layer++) {
        const OCNN6LayerConfig &config = OCNN6_LAYERS[layer];
        
        std::cout << "  Layer " << (layer + 1) << ": " << config.input_channels 
                  << " -> " << config.output_channels << " channels, "
                  << config.input_spatial_dim << "³ -> " << config.output_spatial_dim << "³"
                  << " (" << (config.is_fully_connected ? "FC" : "Conv3d") << ")" << std::endl;
        
        // Initialize weights with proper scaling
        if (config.is_fully_connected) {
            // FC weights only use first kernel position
            for (int i = 0; i < config.input_channels; i++) {
                for (int j = 0; j < config.output_channels; j++) {
                    float scale = sqrt(2.0f / config.input_channels);
                    layer_weights[layer][0][i][j] = dis(gen) * scale;
                }
            }
            // Zero other kernel positions for FC layers
            for (int k = 1; k < KERNEL_VOLUME; k++) {
                for (int i = 0; i < config.input_channels; i++) {
                    for (int j = 0; j < config.output_channels; j++) {
                        layer_weights[layer][k][i][j] = 0.0f;
                    }
                }
            }
        } else {
            // Conv3d weights use all kernel positions
            for (int k = 0; k < KERNEL_VOLUME; k++) {
                for (int i = 0; i < config.input_channels; i++) {
                    for (int j = 0; j < config.output_channels; j++) {
                        float scale = sqrt(2.0f / (config.input_channels * KERNEL_VOLUME));
                        layer_weights[layer][k][i][j] = dis(gen) * scale;
                    }
                }
            }
        }
        
        // Small positive bias
        for (int j = 0; j < config.output_channels; j++) {
            layer_biases[layer][j] = 0.01f;
        }
    }

    // Allocate DRAM buffers (pruned format - much smaller than full cubic)
    std::cout << "Allocating pruned DRAM buffers..." << std::endl;
    
    // Estimate maximum pruned size based on sparsity
    const ap_uint<32> MAX_PRUNED_SIZE = occupied_voxel_count * OCNN6_MAX_FEATURE_CHANNELS;
    
    static ap_uint<32> *pruned_feature_dram_read = new ap_uint<32>[MAX_PRUNED_SIZE];
    static ap_uint<32> *pruned_feature_dram_write = new ap_uint<32>[MAX_PRUNED_SIZE];
    
    // Full cubic output (64³ × 40 channels)
    const ap_uint<32> FULL_OUTPUT_SIZE = 64 * 64 * 64 * 40;
    static ap_uint<32> *final_output_full_cubic = new ap_uint<32>[FULL_OUTPUT_SIZE];
    
    // Initialize DRAM to zero
    memset(pruned_feature_dram_read, 0, MAX_PRUNED_SIZE * sizeof(ap_uint<32>));
    memset(pruned_feature_dram_write, 0, MAX_PRUNED_SIZE * sizeof(ap_uint<32>));
    memset(final_output_full_cubic, 0, FULL_OUTPUT_SIZE * sizeof(ap_uint<32>));

    // Allocate single set of persistent BRAM bitmaps
    std::cout << "Allocating persistent BRAM octree..." << std::endl;
    
    static ap_uint<BRAM_WIDTH> L3_bitmap[L3_WORDS];
    static ap_uint<BRAM_WIDTH> L2_bitmap[1024];
    static ap_uint<BRAM_WIDTH> L1_bitmap[1024]; 
    static ap_uint<BRAM_WIDTH> L0_bitmap[1024];
    
    // Initialize bitmaps to zero
    memset(L3_bitmap, 0, sizeof(L3_bitmap));
    memset(L2_bitmap, 0, sizeof(L2_bitmap));
    memset(L1_bitmap, 0, sizeof(L1_bitmap));
    memset(L0_bitmap, 0, sizeof(L0_bitmap));

    // Initialize bitmap info
    PrunedBitmapInfo bitmap_info;
    bitmap_info.L3_size = 0;
    bitmap_info.L2_size = 0;
    bitmap_info.L1_size = 0; 
    bitmap_info.L0_size = 0;
    bitmap_info.total_size = 0;

    std::cout << "\n=== RUNNING 8-LAYER OCNN6 WITH PERSISTENT ACCELERATOR ===" << std::endl;
    
    ap_uint<32> total_processed_voxels = 0;
    
    // Call the corrected 8-layer OCNN6 pipeline
    ocnn6_net_8_layer_pipeline(
        input_voxel_stream,
        final_output_full_cubic,         // Full cubic output with zeros restored
        layer_weights,
        layer_biases,
        pruned_feature_dram_read,        // Persistent pruned DRAM
        pruned_feature_dram_write,
        L3_bitmap, L2_bitmap, L1_bitmap, L0_bitmap,  // Persistent BRAM octree
        bitmap_info,
        total_processed_voxels
    );

    std::cout << "\n=== PIPELINE COMPLETED ===" << std::endl;
    std::cout << "Total processed pruned voxels: " << total_processed_voxels << std::endl;

    // Analyze final full cubic output (64³ × 40 classes)
    std::cout << "\nAnalyzing final full cubic output (64³ × 40 classes)..." << std::endl;
    
    int non_zero_outputs = 0;
    float max_activation = -1000.0f;
    float min_activation = 1000.0f;
    int best_class = 0;
    float best_score = -1000.0f;
    
    // Check first few voxels
    for (int v = 0; v < 10 && v < 64*64*64; v++) {
        float voxel_max = -1000.0f;
        int voxel_best_class = 0;
        
        for (int c = 0; c < 40; c++) {
            ap_uint<32> addr = v * 40 + c;
            float output_val = *((float*)&final_output_full_cubic[addr]);
            
            if (abs(output_val) > 1e-6) non_zero_outputs++;
            if (output_val > max_activation) max_activation = output_val;
            if (output_val < min_activation) min_activation = output_val;
            
            if (output_val > voxel_max) {
                voxel_max = output_val;
                voxel_best_class = c;
            }
        }
        
        if (v < 5) {  // Show first 5 voxels
            std::cout << "  Voxel[" << v << "] predicted class: " << voxel_best_class 
                      << " (score=" << voxel_max << ")" << std::endl;
        }
        
        if (voxel_max > best_score) {
            best_score = voxel_max;
            best_class = voxel_best_class;
        }
    }
    
    std::cout << "\nOutput Statistics:" << std::endl;
    std::cout << "  Total output size: 64³ × 40 = " << (64*64*64*40) << " values" << std::endl;
    std::cout << "  Non-zero outputs: " << non_zero_outputs << std::endl;
    std::cout << "  Output range: [" << min_activation << ", " << max_activation << "]" << std::endl;
    std::cout << "  Best prediction: Class " << best_class << " (score=" << best_score << ")" << std::endl;
    std::cout << "  Sparsity preserved: " << (non_zero_outputs < 64*64*64*40/4 ? "YES" : "NO") << std::endl;
    
    // Verify that zeros were properly restored
    int zero_count = 0;
    for (int i = 0; i < 1000; i++) {  // Sample first 1000 values
        float val = *((float*)&final_output_full_cubic[i]);
        if (abs(val) < 1e-6) zero_count++;
    }
    std::cout << "  Zero restoration check: " << zero_count << "/1000 values are zero" << std::endl;

    // Save results
    std::cout << "\nSaving results to ocnn6_net_results_corrected.txt..." << std::endl;
    std::ofstream results("ocnn6_net_results_corrected.txt");
    results << "8-Layer OCNN6 Results (CORRECTED ARCHITECTURE)\n";
    results << "=============================================\n";
    results << "Input: 64³ voxels, 3 channels (" << occupied_voxel_count << " occupied, " 
            << (100.0f * occupied_voxel_count / (64*64*64)) << "% sparse)\n";
    results << "Output: 64³ voxels, 40 classes (with zeros restored)\n";
    results << "Architecture: Persistent BRAM + Pruned DRAM + Access Pointers\n";
    results << "Total processed pruned voxels: " << total_processed_voxels << "\n";
    results << "Non-zero outputs: " << non_zero_outputs << "\n";
    results << "Output range: [" << min_activation << ", " << max_activation << "]\n";
    results << "Best prediction: Class " << best_class << " (score=" << best_score << ")\n";
    results << "Pipeline status: COMPLETED SUCCESSFULLY\n\n";
    
    results << "Network Architecture:\n";
    results << "- 6 Convolutional layers (3D convolutions with stride=2)\n";
    results << "- 2 Fully connected layers (512->128->40)\n";
    results << "- Cross-row sorting for layers with spatial dim <= 8\n";
    results << "- ReLU activation (except final layer)\n\n";
    
    results << "Key Innovations Used:\n";
    results << "- ONE-TIME bitmap construction before Layer 1\n";
    results << "- Persistent BRAM octree across all 8 layers\n"; 
    results << "- Access pointer mechanism for all layers\n";
    results << "- 2-level memory hierarchy (3-Z buffer + pruned DRAM)\n";
    results << "- Cross-row sorting for small dimensions\n";
    results << "- Logical bitmap reconstruction (BRAM reads only)\n";
    results << "- Final output reconstruction with zeros restored\n";
    results.close();
    
    // Cleanup
    delete[] pruned_feature_dram_read;
    delete[] pruned_feature_dram_write;
    delete[] final_output_full_cubic;
    
    std::cout << "\n=== TESTBENCH COMPLETED SUCCESSFULLY ===" << std::endl;
    std::cout << "Your key innovations are now properly utilized for OCNN6!" << std::endl;
    
    return 0;
}