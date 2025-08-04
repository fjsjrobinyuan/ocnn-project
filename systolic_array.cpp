#include "complete_pipeline.h"
#include "systolic_array.h"
#include "dynamic_access.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif
void ZBufferConvolutionEngine::initialize_z_buffer (
    float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
    float bias[FEATURE_DIM]
) {
    #pragma HLS INLINE off
    STORE_WEIGHTS:
    for (int n = 0; n < KERNEL_VOLUME; n++) {
        for (int i = 0; i < FEATURE_DIM; i++) {
            #pragma HLS PIPELINE II=1
            for (int j = 0; j < FEATURE_DIM; j++) {
                #pragma HLS UNROLL factor=8
                stored_weights[n][i][j] = weights[n][i][j];
            }
        }
    }
    STORE_BIAS:
    for (int i = 0; i < FEATURE_DIM; i++) {
        #pragma HLS UNROLL
        stored_bias[i] = bias[i];
    }
    INIT_BUFFERS:
    for (int b = 0; b < 3; b++) {
        #pragma HLS UNROLL
        layer_buffers[b].voxel_count = 0;
        layer_buffers[b].z_layer = 0;
        layer_buffers[b].loaded = 0;
    }
}
void ZBufferConvolutionEngine::load_z_layer (
    ap_uint<32> target_z,
    FeatureBuffer *input_features,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<32> buffer_index
) {
    #pragma HLS INLINE off
    ZLayerBuffer &buffer = layer_buffers[buffer_index];
    buffer.voxel_count = 0;
    buffer.z_layer = target_z;
    buffer.loaded = 0;
    LOAD_VOXEL_SCAN:
    for (ap_uint<32> v = 0; v < num_voxels; v++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS UNROLL factor=1
        #pragma HLS LOOP_TRIPCOUNT min=1 max=262144
        if (buffer.voxel_count >= MAX_VOXELS_PER_LAYER) {
            break;
        }
        ap_uint<MORTON_BITS> morton = morton_list[v];
        ap_uint<32> x, y, z;
        morton_decode(morton, x, y, z);
        if (z == target_z) {
            ZLayerVoxel &voxel = buffer.voxels[buffer.voxel_count];
            voxel.morton_code = morton;
            voxel.x = x;
            voxel.y = y;
            voxel.valid = 1;
            voxel.feature_index = v;
            buffer.voxel_count++;
        }
    }
    buffer.loaded = 1;
}
bool ZBufferConvolutionEngine::find_neighbor_in_buffer (
    ap_uint<32> center_x, ap_uint<32> center_y, ap_uint<32> center_z,
    int dx, int dy, int dz,
    ap_uint<32> &neighbor_feature_index
) {
    #pragma HLS INLINE off
    ap_uint<32> neighbor_x = center_x + dx;
    ap_uint<32> neighbor_y = center_y + dy;
    ap_uint<32> neighbor_z = center_z + dz;
    if (neighbor_x >= DIM_L0 || neighbor_y >= DIM_L0 || neighbor_z >= DIM_L0) {
        return false;
    }
    int buffer_index;
    if (dz == -1) buffer_index = 0;
    else if (dz == 0) buffer_index = 1;
    else if (dz == 1) buffer_index = 2;
    else return false;
    ZLayerBuffer &buffer = layer_buffers[buffer_index];
    if (!buffer.loaded || buffer.z_layer != neighbor_z) {
        return false;
    }
    NEIGHBOR_SEARCH:
    for (ap_uint<32> i = 0; i < buffer.voxel_count; i++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS UNROLL factor=1
        #pragma HLS LOOP_TRIPCOUNT min=1 max=4096
        ZLayerVoxel &voxel = buffer.voxels[i];
        if (voxel.valid && voxel.x == neighbor_x && voxel.y == neighbor_y) {
            neighbor_feature_index = voxel.feature_index;
            return true;
        }
    }
    return false; 
}
void ZBufferConvolutionEngine::slide_buffer_window () {
    #pragma HLS INLINE Off
    COPY_LAYER_0:
    for (ap_uint<32> i = 0; i < layer_buffers[1].voxel_count; i++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=1 max=4096
        layer_buffers[0].voxels[i] = layer_buffers[1].voxels[i];
    }
    COPY_LAYER_1:
    for (ap_uint<32> i = 0; i < layer_buffers[2].voxel_count; i++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=1 max=4096
        layer_buffers[1].voxels[i] = layer_buffers[2].voxels[i];
    }
    layer_buffers[0].voxel_count = layer_buffers[1].voxel_count;
    layer_buffers[0].z_layer = layer_buffers[1].z_layer;
    layer_buffers[0].loaded = layer_buffers[1].loaded;
    layer_buffers[1].voxel_count = layer_buffers[2].voxel_count;
    layer_buffers[1].z_layer = layer_buffers[2].z_layer;
    layer_buffers[1].loaded = layer_buffers[2].loaded;
layer_buffers[2].voxel_count = 0;
    layer_buffers[2].loaded = 0;
    layer_buffers[2].z_layer = 0;
}
void ZBufferConvolutionEngine::convolve_voxel_z_buffer(
    const ZLayerVoxel &center_voxel,
    FeatureBuffer *input_features,
    FeatureBuffer &output_features
) {
    #pragma HLS INLINE off
    float partial_sums[FEATURE_DIM];
    #pragma HLS ARRAY_PARTITION variable=partial_sums cyclic factor=8
    INIT_BIAS:
    for (int f = 0; f < FEATURE_DIM; f++) {
        #pragma HLS UNROLL factor=8
        partial_sums[f] = stored_bias[f];
    }
    NEIGHBOR_PROCESSING:
    for (int n = 0; n < KERNEL_VOLUME; n++) {
        #pragma HLS PIPELINE II=2
        #pragma HLS UNROLL factor=1
        #pragma HLS LOOP_TRIPCOUNT min=27 max=27
        int dx = NEIGHBOR_OFFSETS[n][0];
        int dy = NEIGHBOR_OFFSETS[n][1]; 
        int dz = NEIGHBOR_OFFSETS[n][2];
        ap_uint<32> neighbor_feature_index;
        bool neighbor_exists = find_neighbor_in_buffer(
            center_voxel.x, center_voxel.y, layer_buffers[1].z_layer,
            dx, dy, dz, neighbor_feature_index);
            if (neighbor_exists) {
                FeatureBuffer &neighbor_features = input_features[neighbor_feature_index];
                FEATURE_MULTIPLY:
                for (int out_f = 0; out_f < FEATURE_DIM; out_f++) {
                    #pragma HLS PIPELINE II=1
                    #pragma HLS UNROLL factor=4
                    #pragma HLS LOOP_TRIPCOUNT min=32 max=32
                    float accumulator = 0;
                    INNER_PRODUCT:
                    for (int in_f = 0; in_f < FEATURE_DIM; in_f++) {
                        #pragma HLS UNROLL factor=8
                        float weight = stored_weights[n][out_f][in_f];
                        float input_val = neighbor_features.features[in_f];
                        accumulator += weight * input_val;
                    }
                    partial_sums[out_f] += accumulator;
                }
            }
    }
    APPLY_RELU:
    for (int f = 0; f < FEATURE_DIM; f++) {
        #pragma HLS UNROLL
        output_features.features[f] = (partial_sums[f] > 0) ? partial_sums[f] :0;
    }
}
void ZBufferConvolutionEngine::process_z_buffer_convolution(
    FeatureBuffer *input_features,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    PrunedBitmapInfo &bitmap_info,
    FeatureBuffer *output_features)
{
#pragma HLS INLINE off
    #ifndef __SYNTHESIS__
    std::cout << "=== Starting Z-Buffer Streaming Convolution ===" << std::endl;
    #endif
    Z_LAYER_LOOP:
    for (ap_uint<32> z = 1; z < (DIM_L0 - 1); z++) {
        #pragma HLS PIPELINE II=4
        #pragma HLS UNROLL factor=1
        #pragma HLS LOOP_TRIPCOUNT min=1 max=62
        #ifndef __SYNTHESIS__
        std::cout << "Processing Z layer " << z << std::endl;
        #endif
        if (z == 1) {
            load_z_layer(z-1, input_features, morton_list, num_voxels, 0); 
            load_z_layer(z,   input_features, morton_list, num_voxels, 1); 
            load_z_layer(z+1, input_features, morton_list, num_voxels, 2); 
        } else {
            slide_buffer_window();
            load_z_layer(z+1, input_features, morton_list, num_voxels, 2); 
        }
        ZLayerBuffer &middle_layer = layer_buffers[1];
        PROCESS_MIDDLE_LAYER:
        for (ap_uint<32> v = 0; v < middle_layer.voxel_count; v++) {
#pragma HLS PIPELINE II=8
#pragma HLS UNROLL factor=1
#pragma HLS LOOP_TRIPCOUNT min=1 max=4096
            const ZLayerVoxel &center_voxel = middle_layer.voxels[v];
            if (!center_voxel.valid) continue;
            ap_uint<32> output_index = center_voxel.feature_index;
            if (output_index < num_voxels) {
            convolve_voxel_z_buffer(center_voxel, input_features, output_features[output_index]);
            }
        }
    }
    #ifndef __SYNTHESIS__
    std::cout << "=== Completed Z-Buffer Streaming Convolution ===" << std::endl;
    #endif
}
SystolicArray::SystolicArray() {
    #pragma HLS ARRAY_PARTITION variable = pe_array complete dim = 0
#pragma HLS ARRAY_PARTITION variable = row_buffer complete dim = 0
#pragma HLS ARRAY_PARTITION variable = col_buffer complete dim = 0
}
void SystolicArray::load_weights(float weights[FEATURE_DIM][FEATURE_DIM])
{
#pragma HLS INLINE off
LOAD_WEIGHTS_OUTER:
    for (int i = 0; i < SYSTOLIC_ROWS; i++)
    {
    LOAD_WEIGHTS_INNER:
        for (int j = 0; j < SYSTOLIC_COLS; j++)
        {
#pragma HLS PIPELINE II = 1
            pe_array[i][j].weight = weights[i][j];
            pe_array[i][j].accumulator = 0;
            pe_array[i][j].valid = 1;
        }
    }
}
void SystolicArray::compute(float input_features[FEATURE_DIM],
                            float output_features[FEATURE_DIM],
                            float bias[FEATURE_DIM])
{
#pragma HLS INLINE off
INIT_BIAS:
    for (int j = 0; j < SYSTOLIC_COLS; j++)
    {
#pragma HLS UNROLL
        output_features[j] = bias[j];
    }
SYSTOLIC_COMPUTE:
    for (int k = 0; k < SYSTOLIC_ROWS + SYSTOLIC_COLS - 1; k++)
    {
#pragma HLS PIPELINE II = 1
    PE_COMPUTE:
        for (int i = 0; i < SYSTOLIC_ROWS; i++)
        {
#pragma HLS UNROLL
            for (int j = 0; j < SYSTOLIC_COLS; j++)
            {
#pragma HLS UNROLL
                if (k >= j && k - j < SYSTOLIC_ROWS && (k - j) == i)
                {
                    float mult_result = hw_multiply(input_features[i], pe_array[i][j].weight);
                    pe_array[i][j].accumulator = hw_add(pe_array[i][j].accumulator, mult_result);
                }
            }
        }
    }
COLLECT_RESULTS:
    for (int j = 0; j < SYSTOLIC_COLS; j++)
    {
#pragma HLS UNROLL
        float sum = 0;
        for (int i = 0; i < SYSTOLIC_ROWS; i++)
        {
#pragma HLS UNROLL
            sum = hw_add(sum, pe_array[i][j].accumulator);
        }
        output_features[j] = sum;
    }
    reset();
}
void SystolicArray::reset()
{
#pragma HLS INLINE
RESET_PE:
    for (int i = 0; i < SYSTOLIC_ROWS; i++)
    {
#pragma HLS UNROLL
        for (int j = 0; j < SYSTOLIC_COLS; j++)
        {
#pragma HLS UNROLL
            pe_array[i][j].accumulator = 0;
        }
    }
}
void ConvolutionEngine::initialize(float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
                                   float bias[FEATURE_DIM])
{
#pragma HLS INLINE off
STORE_WEIGHTS:
for (int n = 0; n < KERNEL_VOLUME; n++) {
    for (int i = 0; i < FEATURE_DIM; i++) {
#pragma HLS PIPELINE II=1
        for (int j = 0; j < FEATURE_DIM; j += 8) {
#pragma HLS UNROLL factor=8
            for (int k = 0; k < 8 && (j+k) < FEATURE_DIM; k++) {
#pragma HLS UNROLL
                stored_weights[n][i][j+k] = weights[n][i][j+k];
            }
        }
    }
}
STORE_BIAS:
    for (int i = 0; i < FEATURE_DIM; i++)
    {
#pragma HLS UNROLL
        stored_bias[i] = bias[i];
    }
INIT_ARRAYS:
    for (int arr = 0; arr < SYSTOLIC_ARRAY_COUNT; arr++)
    {
#pragma HLS UNROLL
        if (arr < KERNEL_VOLUME)
        {
            systolic_arrays[arr].load_weights(stored_weights[arr]);
        }
    }
}
void ConvolutionEngine::process_sparse_convolution_streaming(
    FeatureBuffer *input_features,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    PrunedBitmapInfo &bitmap_info,
    FeatureBuffer *output_features)
{
#pragma HLS INLINE off
    static ap_uint<1> z_engine_initialized = 0;
    if (!z_engine_initialized) {
        z_buffer_engine.initialize_z_buffer(stored_weights, stored_bias);
        z_engine_initialized = 1;
    }
    z_buffer_engine.process_z_buffer_convolution (
        input_features, morton_list, num_voxels,
        L3_bitmap, L2_bitmap_pruned, L1_bitmap_pruned, L0_bitmap_pruned,
        bitmap_info, output_features
    );
}
void ConvolutionEngine::convolve_voxel_streaming(
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
    FeatureBuffer &output_features)
{
#pragma HLS INLINE off
    ap_uint<MORTON_BITS> current_morton = morton_list[feature_idx];
    ap_uint<32> x, y, z;
    morton_decode(current_morton, x, y, z);
    float partial_sums[FEATURE_DIM];
    #pragma HLS ARRAY_PARTITION variable = partial_sums complete
    for (int f = 0; f < FEATURE_DIM; f++) {
        #pragma HLS UNROLL
        partial_sums[f] = stored_bias[f];
    }
    NEIGHBOR_PROCESSING:
    for (int n = 0; n < KERNEL_VOLUME; n++) {
        #pragma HLS UNROLL factor=9
#pragma HLS PIPELINE II = 1
        int dx = NEIGHBOR_OFFSETS[n][0];
        int dy = NEIGHBOR_OFFSETS[n][1];
        int dz = NEIGHBOR_OFFSETS[n][2];
        int nx = x + dx;
        int ny = y + dy;
        int nz = z + dz;
        if (nx >= 0 && nx < DIM_L0 && ny >= 0 && ny < DIM_L0 && nz >= 0 && nz < DIM_L0) {
            ap_uint<MORTON_BITS> neighbor_morton = morton3D(nx, ny, nz);
            ap_uint<32> found_idx;
            bool exists = find_neighbor_streaming(
                neighbor_morton, L3_bitmap, L2_bitmap_pruned,
                L1_bitmap_pruned, L0_bitmap_pruned,
                bitmap_info, stream_ptrs, found_idx);
            if (exists) {
                int neighbor_feature_idx = find_feature_index(neighbor_morton, morton_list, num_voxels);
                if (neighbor_feature_idx >= 0 && neighbor_feature_idx < num_voxels) {
                    FEATURE_MULTIPLY:
                    for (int out_f = 0; out_f < FEATURE_DIM; out_f++) {
#pragma HLS PIPELINE II=2
float accumulator = 0;
#pragma HLS BIND_OP variable=accumulator op=add impl=dsp
INNER_PRODUCT:
                        for (int in_f = 0; in_f < FEATURE_DIM; in_f++) {
#pragma HLS UNROLL factor=4
                            float weight = stored_weights[n][out_f][in_f];
        float input_val = input_features[neighbor_feature_idx].features[in_f];
        #pragma HLS BIND_OP variable=accumulator op=mul impl=dsp
                            accumulator += weight * input_val;
                        }
                        partial_sums[out_f] += accumulator;
                    }
                }
            }
        }
    }
    APPLY_RELU:
    for (int f = 0; f < FEATURE_DIM; f++) {
#pragma HLS UNROLL
        output_features.features[f] = (partial_sums[f] > 0) ? partial_sums[f] : 0;
    }
}
