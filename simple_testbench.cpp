#define HLS_TESTBENCH
#include <hls_stream.h>
#include <ap_int.h>
#include <cstdio>

#ifndef FEATURE_DIM
#define FEATURE_DIM 32
#endif
#ifndef KERNEL_VOLUME  
#define KERNEL_VOLUME 27
#endif

// Simple streaming conv function (from complete_pipeline.cpp)
void streaming_conv_layer(
    hls::stream<ap_uint<32>> &input_feature_stream,
    hls::stream<ap_uint<32>> &output_feature_stream,
    float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
    float bias[FEATURE_DIM],
    ap_uint<32> num_features
);

int main() {
    printf("Testing streaming convolution layer...\n");
    
    // Create test streams
    hls::stream<ap_uint<32>> input_stream;
    hls::stream<ap_uint<32>> output_stream;
    
    // Test parameters
    const int NUM_TEST_FEATURES = 4;
    
    // Create test weights and bias
    static float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM];
    static float bias[FEATURE_DIM];
    
    // Initialize weights (identity)
    for (int k = 0; k < KERNEL_VOLUME; k++) {
        for (int i = 0; i < FEATURE_DIM; i++) {
            for (int j = 0; j < FEATURE_DIM; j++) {
                weights[k][i][j] = (k == 0 && i == j) ? 1.0f : 0.0f;
            }
        }
    }
    
    // Initialize bias
    for (int i = 0; i < FEATURE_DIM; i++) {
        bias[i] = 0.1f;
    }
    
    // Generate test input data
    for (int feat = 0; feat < NUM_TEST_FEATURES; feat++) {
        for (int f = 0; f < FEATURE_DIM; f++) {
            float test_val = (float)(feat * FEATURE_DIM + f) * 0.1f;
            input_stream.write(*((ap_uint<32>*)&test_val));
        }
    }
    
    // Call the streaming conv layer
    streaming_conv_layer(input_stream, output_stream, weights, bias, NUM_TEST_FEATURES);
    
    // Read and verify outputs
    int output_count = 0;
    printf("Outputs:\n");
    while (!output_stream.empty() && output_count < NUM_TEST_FEATURES * FEATURE_DIM) {
        ap_uint<32> output_data = output_stream.read();
        float output_val = *((float*)&output_data);
        printf("Output[%d]: %f\n", output_count, output_val);
        output_count++;
    }
    
    printf("Test completed. Processed %d outputs.\n", output_count);
    return 0;
}