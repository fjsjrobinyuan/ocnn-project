#include "complete_pipeline.h"
#include "systolic_array.h"
#include "dynamic_access.h"
#ifndef __SYNTHESIS__
#include <iostream>
#endif

// Define the static member
const ap_int<8> ConvolutionEngine::NEIGHBOR_OFFSETS[KERNEL_VOLUME][3] = {
#if KERNEL_SIZE == 3
    {-1, -1, -1}, {-1, -1, 0}, {-1, -1, 1}, {-1, 0, -1}, {-1, 0, 0}, {-1, 0, 1}, 
    {-1, 1, -1}, {-1, 1, 0}, {-1, 1, 1}, {0, -1, -1}, {0, -1, 0}, {0, -1, 1}, 
    {0, 0, -1}, {0, 0, 0}, {0, 0, 1}, {0, 1, -1}, {0, 1, 0}, {0, 1, 1}, 
    {1, -1, -1}, {1, -1, 0}, {1, -1, 1}, {1, 0, -1}, {1, 0, 0}, {1, 0, 1}, 
    {1, 1, -1}, {1, 1, 0}, {1, 1, 1}
#else
    {0, 0, 0}
#endif
};
void sort_morton_list_for_convolution_reads(ap_uint<MORTON_BITS> *morton_list, ap_uint<32> num_voxels)
{
#pragma HLS INLINE off

MORTON_READ_SORT:
    for (ap_uint<32> i = 0; i < num_voxels - 1; i++)
    {
        for (ap_uint<32> j = 0; j < num_voxels - i - 1; j++)
        {
#pragma HLS PIPELINE II = 1

            MortonAddress addr_j = extract_morton_address(morton_list[j]);
            MortonAddress addr_j1 = extract_morton_address(morton_list[j + 1]);

            // Decode Z coordinates for secondary sort (maintain Z-buffer efficiency)
            ap_uint<32> x_j, y_j, z_j, x_j1, y_j1, z_j1;
            morton_decode(morton_list[j], x_j, y_j, z_j);
            morton_decode(morton_list[j + 1], x_j1, y_j1, z_j1);

            bool should_swap = false;
            if (addr_j.row_bits > addr_j1.row_bits)
            {
                should_swap = true;
            }
            else if (addr_j.row_bits == addr_j1.row_bits && z_j > z_j1)
            {
                // Within same row, sort by Z for Z-buffer compatibility
                should_swap = true;
            }

            if (should_swap)
            {
                ap_uint<MORTON_BITS> temp = morton_list[j];
                morton_list[j] = morton_list[j + 1];
                morton_list[j + 1] = temp;
            }
        }
    }
}

void prefetch_voxel_features_morton(ap_uint<MORTON_BITS> morton, ap_uint<32> voxel_idx,
                                    ap_uint<32> *feature_dram_read)
{
#pragma HLS INLINE
    // Pre-calculate addresses for better memory access patterns
    for (int f = 0; f < FEATURE_DIM && f < 8; f++)
    {
#pragma HLS UNROLL
        ap_uint<32> addr = morton_to_dram_address(morton, f);
        // Prefetch hint for memory controller
        volatile ap_uint<32> prefetch = feature_dram_read[addr];
    }
}

// 3 Z-Layer Multiplication Array Implementation
void ZLayerMultiplicationArray::reset()
{
#pragma HLS INLINE
RESET_MULT_ARRAY:
    for (int v = 0; v < Z_LAYER_TOTAL_VOXELS; v++)
    {
#pragma HLS UNROLL factor=2
        active[v] = 0;
        for (int f = 0; f < FEATURE_DIM; f++)
        {
#pragma HLS UNROLL factor=4
            accumulator[v][f] = 0.0f;
        }
    }
}

void ZLayerMultiplicationArray::compute_voxel_features(
    float input_features[FEATURE_DIM],
    float weights[FEATURE_DIM][FEATURE_DIM], 
    float bias[FEATURE_DIM],
    ap_uint<32> voxel_slot,
    float output_features[FEATURE_DIM])
{
#pragma HLS INLINE off
// CONTROLLED partitioning - not complete (was causing 8192 BRAM explosion)
#pragma HLS ARRAY_PARTITION variable=mult_units cyclic factor=4 dim=3
#pragma HLS ARRAY_PARTITION variable=accumulator cyclic factor=8 dim=2

    if (voxel_slot >= Z_LAYER_TOTAL_VOXELS) return;
    
    // Initialize with bias - reduced unrolling
INIT_BIAS:
    for (int out_f = 0; out_f < FEATURE_DIM; out_f++)
    {
#pragma HLS UNROLL factor=4
        accumulator[voxel_slot][out_f] = bias[out_f];
    }
    
    // Controlled matrix multiplication - prevent massive unrolling
FEATURE_MULTIPLY:
    for (int out_f = 0; out_f < FEATURE_DIM; out_f++)
    {
#pragma HLS PIPELINE II=2
        for (int in_f = 0; in_f < FEATURE_DIM; in_f++)
        {
#pragma HLS UNROLL factor=4
            float mult_result = input_features[in_f] * weights[out_f][in_f];
#pragma HLS BIND_OP variable=mult_result op=mul impl=dsp
            mult_units[voxel_slot][out_f][in_f] = mult_result;
            accumulator[voxel_slot][out_f] += mult_result;
        }
    }
    
    // Apply ReLU and output
APPLY_RELU:
    for (int f = 0; f < FEATURE_DIM; f++)
    {
#pragma HLS UNROLL factor=8
        output_features[f] = (accumulator[voxel_slot][f] > 0.0f) ? accumulator[voxel_slot][f] : 0.0f;
    }
    
    active[voxel_slot] = 1;
}

// NEW: O(1) Direct BRAM Occupancy Map Loading
void ZBufferConvolutionEngine::load_z_layer_occupancy_map(
    ap_uint<32> target_z,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<32> map_index,
    ap_uint<32> *feature_dram_read)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=occupancy_maps complete dim=0
    
    ZLayerOccupancyMap &occ_map = occupancy_maps[map_index];
    occ_map.z_layer = target_z;
    occ_map.total_voxels = 0;
    occ_map.loaded = 0;
    
    // Clear the occupancy bitmap first
CLEAR_OCCUPANCY_MAP:
    for (int x = 0; x < DIM_L0; x++) {
#pragma HLS UNROLL factor=16
        for (int y = 0; y < DIM_L0; y++) {
#pragma HLS UNROLL factor=16
            occ_map.occupied[x][y] = 0;
        }
    }
    
    // Populate occupancy map with O(1) direct indexing
POPULATE_OCCUPANCY_MAP:
    for (ap_uint<32> v = 0; v < num_voxels; v++)
    {
#pragma HLS PIPELINE II = 1
#pragma HLS LOOP_TRIPCOUNT min = 1 max = 262144
        
        ap_uint<MORTON_BITS> morton = morton_list[v];
        ap_uint<32> x, y, z;
        morton_decode(morton, x, y, z);
        
        if (z == target_z && x < DIM_L0 && y < DIM_L0)
        {
            // Direct O(1) insertion - no linear search!
            occ_map.occupied[x][y] = 1;
            occ_map.feature_indices[x][y] = v;
            occ_map.morton_codes[x][y] = morton;
            occ_map.total_voxels++;
            
            // Prefetch features for this voxel
            prefetch_voxel_features_morton(morton, v, feature_dram_read);
        }
    }
    
    occ_map.loaded = 1;
}

// NEW: O(1) Direct Neighbor Lookup - No Linear Search!
bool ZBufferConvolutionEngine::find_neighbor_direct(
    ap_uint<32> center_x, ap_uint<32> center_y, ap_uint<32> center_z,
    int dx, int dy, int dz,
    ap_uint<32> &neighbor_feature_index,
    ap_uint<MORTON_BITS> &neighbor_morton)
{
#pragma HLS INLINE
    
    // Calculate neighbor coordinates
    ap_uint<32> neighbor_x = center_x + dx;
    ap_uint<32> neighbor_y = center_y + dy;
    ap_uint<32> neighbor_z = center_z + dz;
    
    // Boundary check
    if (neighbor_x >= DIM_L0 || neighbor_y >= DIM_L0 || neighbor_z >= DIM_L0)
        return false;
    
    // Determine which occupancy map to check
    int map_index;
    if (dz == -1)      map_index = 0;      // Previous z-layer
    else if (dz == 0)  map_index = 1;      // Current z-layer  
    else if (dz == 1)  map_index = 2;      // Next z-layer
    else return false;
    
    ZLayerOccupancyMap &occ_map = occupancy_maps[map_index];
    
    // Check if map is loaded and correct z-layer
    if (!occ_map.loaded || occ_map.z_layer != neighbor_z)
        return false;
    
    // O(1) DIRECT BRAM LOOKUP - This is your key optimization!
    ap_uint<1> neighbor_exists = occ_map.occupied[neighbor_x][neighbor_y];
    
    if (neighbor_exists) {
        neighbor_feature_index = occ_map.feature_indices[neighbor_x][neighbor_y];
        neighbor_morton = occ_map.morton_codes[neighbor_x][neighbor_y];
        return true;
    }
    
    return false;
}

// NEW: Full Z-Layer Multiplication Array Implementation
void FullZLayerMultiplicationArray::reset()
{
#pragma HLS INLINE off
// CONTROLLED partitioning - only partition along feature dimension for parallel access
#pragma HLS ARRAY_PARTITION variable=mult_units cyclic factor=4 dim=1
#pragma HLS ARRAY_PARTITION variable=accumulator cyclic factor=8 dim=3  
#pragma HLS ARRAY_PARTITION variable=active cyclic factor=8 dim=1

RESET_SPATIAL_COVERAGE:
    for (int x = 0; x < DIM_L0; x++)
    {
#pragma HLS PIPELINE II=1  // Use pipelining instead of aggressive unrolling
        for (int y = 0; y < DIM_L0; y++)
        {
#pragma HLS PIPELINE II=1
            active[x][y] = 0;
            for (int f = 0; f < FEATURE_DIM; f++)
            {
#pragma HLS UNROLL factor=2  // Much more conservative
                accumulator[x][y][f] = 0.0f;
            }
        }
    }
}

void FullZLayerMultiplicationArray::compute_single_voxel_parallel(
    ap_uint<32> voxel_x, ap_uint<32> voxel_y,
    float input_features[FEATURE_DIM],
    float weights[FEATURE_DIM][FEATURE_DIM], 
    float bias[FEATURE_DIM],
    float output_features[FEATURE_DIM])
{
#pragma HLS INLINE off
// CONTROLLED partitioning - avoid complete partitioning explosion
#pragma HLS ARRAY_PARTITION variable=mult_units cyclic factor=4 dim=1
#pragma HLS ARRAY_PARTITION variable=input_features complete
#pragma HLS ARRAY_PARTITION variable=output_features complete

    // Bounds check for 64×64 spatial coverage
    if (voxel_x >= DIM_L0 || voxel_y >= DIM_L0) return;
    
    // Initialize accumulator with bias for this spatial position
INIT_BIAS:
    for (int out_f = 0; out_f < FEATURE_DIM; out_f++)
    {
#pragma HLS UNROLL factor=2  // Conservative unrolling
        accumulator[voxel_x][voxel_y][out_f] = bias[out_f];
    }
    
    // Per-channel convolution - YOUR CORRECT ARCHITECTURE!
    // For each input channel, multiply across 3 z-layers with weights
PER_CHANNEL_CONVOLUTION:
    for (int out_f = 0; out_f < FEATURE_DIM; out_f++)
    {
#pragma HLS PIPELINE II=2  // Use pipelining instead of unrolling
        for (int in_f = 0; in_f < FEATURE_DIM; in_f++)  // This will be limited by layer's actual input channels
        {
            for (int z = 0; z < 3; z++)  // 3 z-layers in sliding window
            {
                float mult_result = input_features[in_f] * weights[out_f][in_f];  
#pragma HLS RESOURCE variable=mult_result core=DSP48 impl=dsp
                mult_units[in_f][voxel_x][voxel_y][z] = mult_result;
                accumulator[voxel_x][voxel_y][out_f] += mult_result;
            }
        }
    }
    
    // Apply ReLU and output
APPLY_RELU:
    for (int f = 0; f < FEATURE_DIM; f++)
    {
#pragma HLS UNROLL factor=2  // Conservative unrolling
        output_features[f] = (accumulator[voxel_x][voxel_y][f] > 0.0f) ? accumulator[voxel_x][voxel_y][f] : 0.0f;
    }
    
    active[voxel_x][voxel_y] = 1;
}

void ZBufferConvolutionEngine::initialize_z_buffer(
    float weights[KERNEL_VOLUME][FEATURE_DIM][FEATURE_DIM],
    float bias[FEATURE_DIM])
{
#pragma HLS INLINE off
STORE_WEIGHTS:
    for (int n = 0; n < KERNEL_VOLUME; n++)
    {
        for (int i = 0; i < FEATURE_DIM; i++)
        {
#pragma HLS PIPELINE II = 1
            for (int j = 0; j < FEATURE_DIM; j++)
            {
#pragma HLS UNROLL factor = 8
                stored_weights[n][i][j] = weights[n][i][j];
            }
        }
    }
STORE_BIAS:
    for (int i = 0; i < FEATURE_DIM; i++)
    {
#pragma HLS UNROLL
        stored_bias[i] = bias[i];
    }
INIT_BUFFERS:
    for (int b = 0; b < 3; b++)
    {
#pragma HLS UNROLL
        layer_buffers[b].voxel_count = 0;
        layer_buffers[b].z_layer = 0;
        layer_buffers[b].loaded = 0;
    }
    
    // Initialize FULL 3 z-layer multiplication arrays
INIT_FULL_Z_MULT_ARRAYS:
    for (int z = 0; z < Z_LAYER_MULT_ARRAYS; z++)
    {
#pragma HLS UNROLL
        full_z_mult_arrays[z].reset();
    }
    
    // Initialize legacy arrays (keep during transition)
INIT_Z_MULT_ARRAYS:
    for (int z = 0; z < Z_LAYER_MULT_ARRAYS; z++)
    {
#pragma HLS UNROLL
        z_mult_arrays[z].reset();
    }
    
    // Initialize O(1) occupancy maps
INIT_OCCUPANCY_MAPS:
    for (int z = 0; z < 3; z++)
    {
#pragma HLS UNROLL
        occupancy_maps[z].loaded = 0;
        occupancy_maps[z].z_layer = 0;
        occupancy_maps[z].total_voxels = 0;
        
        // Clear occupancy bitmap
        for (int x = 0; x < DIM_L0; x++) {
#pragma HLS UNROLL factor=8
            for (int y = 0; y < DIM_L0; y++) {
#pragma HLS UNROLL factor=8
                occupancy_maps[z].occupied[x][y] = 0;
                occupancy_maps[z].feature_indices[x][y] = 0;
                occupancy_maps[z].morton_codes[x][y] = 0;
            }
        }
    }
}
void ZBufferConvolutionEngine::load_z_layer(
    ap_uint<32> target_z,
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<32> buffer_index,
    ap_uint<32> *feature_dram_read)
{
#pragma HLS INLINE off
    ZLayerBuffer &buffer = layer_buffers[buffer_index];
    buffer.voxel_count = 0;
    buffer.z_layer = target_z;
    buffer.loaded = 0;
LOAD_VOXEL_SCAN:
    for (ap_uint<32> v = 0; v < num_voxels; v++)
    {
#pragma HLS PIPELINE II = 1
#pragma HLS UNROLL factor = 1
#pragma HLS LOOP_TRIPCOUNT min = 1 max = 262144
        if (buffer.voxel_count >= MAX_VOXELS_PER_LAYER)
        {
            break;
        }
        ap_uint<MORTON_BITS> morton = morton_list[v];
        ap_uint<32> x, y, z;
        morton_decode(morton, x, y, z);
        if (z == target_z)
        {
            ZLayerVoxel &voxel = buffer.voxels[buffer.voxel_count];
            voxel.morton_code = morton;
            voxel.x = x;
            voxel.y = y;
            voxel.valid = 1;
            voxel.feature_index = v;
            buffer.voxel_count++;

            // Prefetch features using Morton-optimized addressing
            prefetch_voxel_features_morton(morton, v, feature_dram_read);
        }
    }
    buffer.loaded = 1;
}
bool ZBufferConvolutionEngine::find_neighbor_in_buffer(
    ap_uint<32> center_x, ap_uint<32> center_y, ap_uint<32> center_z,
    int dx, int dy, int dz,
    ap_uint<32> &neighbor_feature_index)
{
#pragma HLS INLINE off
    ap_uint<32> neighbor_x = center_x + dx;
    ap_uint<32> neighbor_y = center_y + dy;
    ap_uint<32> neighbor_z = center_z + dz;
    if (neighbor_x >= DIM_L0 || neighbor_y >= DIM_L0 || neighbor_z >= DIM_L0)
    {
        return false;
    }
    int buffer_index;
    if (dz == -1)
        buffer_index = 0;
    else if (dz == 0)
        buffer_index = 1;
    else if (dz == 1)
        buffer_index = 2;
    else
        return false;
    ZLayerBuffer &buffer = layer_buffers[buffer_index];
    if (!buffer.loaded || buffer.z_layer != neighbor_z)
    {
        return false;
    }
NEIGHBOR_SEARCH:
    for (ap_uint<32> i = 0; i < buffer.voxel_count; i++)
    {
#pragma HLS PIPELINE II = 1
#pragma HLS UNROLL factor = 1
#pragma HLS LOOP_TRIPCOUNT min = 1 max = 4096
        ZLayerVoxel &voxel = buffer.voxels[i];
        if (voxel.valid && voxel.x == neighbor_x && voxel.y == neighbor_y)
        {
            neighbor_feature_index = voxel.feature_index;
            return true;
        }
    }
    return false;
}
void ZBufferConvolutionEngine::slide_buffer_window()
{
#pragma HLS INLINE Off
COPY_LAYER_0:
    for (ap_uint<32> i = 0; i < layer_buffers[1].voxel_count; i++)
    {
#pragma HLS PIPELINE II = 1
#pragma HLS LOOP_TRIPCOUNT min = 1 max = 4096
        layer_buffers[0].voxels[i] = layer_buffers[1].voxels[i];
    }
COPY_LAYER_1:
    for (ap_uint<32> i = 0; i < layer_buffers[2].voxel_count; i++)
    {
#pragma HLS PIPELINE II = 1
#pragma HLS LOOP_TRIPCOUNT min = 1 max = 4096
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
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<32> *feature_dram_read,
    ap_uint<32> *feature_dram_write,
    ap_uint<32> output_index)
{
#pragma HLS INLINE off
    
    // Use 3 z-layer multiplication arrays for efficient neighbor processing
    ap_uint<32> voxel_slot = output_index % Z_LAYER_TOTAL_VOXELS;
    
    float partial_sums[FEATURE_DIM];
#pragma HLS ARRAY_PARTITION variable = partial_sums complete
    
    // Initialize partial sums with bias
INIT_BIAS:
    for (int f = 0; f < FEATURE_DIM; f++)
    {
#pragma HLS UNROLL factor = 8
        partial_sums[f] = stored_bias[f];
    }

    // Process neighbors using optimized z-layer multiplication arrays - CONTROLLED unrolling
NEIGHBOR_PROCESSING:
    for (int n = 0; n < KERNEL_VOLUME; n++)
    {
#pragma HLS PIPELINE II = 3
#pragma HLS UNROLL factor = 1
#pragma HLS LOOP_TRIPCOUNT min = 27 max = 27
        
        int dx = NEIGHBOR_OFFSETS[n][0];
        int dy = NEIGHBOR_OFFSETS[n][1];
        int dz = NEIGHBOR_OFFSETS[n][2];
        
        ap_uint<32> neighbor_feature_index;
        bool neighbor_exists = find_neighbor_in_buffer(
            center_voxel.x, center_voxel.y, layer_buffers[1].z_layer,
            dx, dy, dz, neighbor_feature_index);
            
        if (neighbor_exists && neighbor_feature_index < num_voxels)
        {
            // Determine which z-layer multiplication array to use
            int mult_array_idx = 1;  // Default to middle layer
            if (dz == -1) mult_array_idx = 0;      // Previous z-layer  
            else if (dz == 1) mult_array_idx = 2;   // Next z-layer
            
            // Load neighbor features from DRAM
            float neighbor_features[FEATURE_DIM];
#pragma HLS ARRAY_PARTITION variable=neighbor_features complete
            
        LOAD_NEIGHBOR_FEATURES:
            for (int f = 0; f < FEATURE_DIM; f++)
            {
#pragma HLS UNROLL factor = 8
                ap_uint<MORTON_BITS> neighbor_morton = morton_list[neighbor_feature_index];
                ap_uint<32> dram_addr = morton_to_dram_address(neighbor_morton, f);
                ap_uint<32> feature_word = feature_dram_read[dram_addr];
                neighbor_features[f] = *((float *)&feature_word);
            }
            
            // Use dedicated z-layer multiplication array for this neighbor
            float neighbor_output[FEATURE_DIM];
#pragma HLS ARRAY_PARTITION variable=neighbor_output complete
            
            z_mult_arrays[mult_array_idx].compute_voxel_features(
                neighbor_features,
                stored_weights[n], 
                stored_bias,
                voxel_slot % Z_LAYER_TOTAL_VOXELS,
                neighbor_output
            );
            
            // Accumulate results
        ACCUMULATE_RESULTS:
            for (int f = 0; f < FEATURE_DIM; f++)
            {
#pragma HLS UNROLL factor = 8
                partial_sums[f] += neighbor_output[f];
            }
        }
    }
    
    // Apply ReLU and store final results
APPLY_RELU_AND_STORE:
    for (int f = 0; f < FEATURE_DIM; f++)
    {
#pragma HLS UNROLL factor = 8
        float result = (partial_sums[f] > 0.0f) ? partial_sums[f] : 0.0f;
        ap_uint<32> output_addr = OUTPUT_FEATURE_REGION_START +
                                  (output_index * FEATURE_DIM) + f;
        feature_dram_write[output_addr] = *((ap_uint<32> *)&result);
    }
}
void ZBufferConvolutionEngine::process_z_buffer_convolution(
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    PrunedBitmapInfo &bitmap_info,
    ap_uint<32> *feature_dram_read,
    ap_uint<32> *feature_dram_write)
{
#pragma HLS INLINE off
#ifndef __SYNTHESIS__
    std::cout << "=== Starting Z-Buffer Streaming Convolution ===" << std::endl;
#endif
Z_LAYER_LOOP:
    for (ap_uint<32> z = 1; z < (DIM_L0 - 1); z++)
    {
#pragma HLS PIPELINE II = 4
#pragma HLS UNROLL factor = 1
#pragma HLS LOOP_TRIPCOUNT min = 1 max = 62
        if (z == 1)
        {
            load_z_layer(z - 1, morton_list, num_voxels, 0, feature_dram_read);
            load_z_layer(z, morton_list, num_voxels, 1, feature_dram_read);
            load_z_layer(z + 1, morton_list, num_voxels, 2, feature_dram_read);
        }
        else
        {
            slide_buffer_window();
            load_z_layer(z + 1, morton_list, num_voxels, 2, feature_dram_read);
        }
        ZLayerBuffer &middle_layer = layer_buffers[1];
    PROCESS_MIDDLE_LAYER:
        for (ap_uint<32> v = 0; v < middle_layer.voxel_count; v++)
        {
#pragma HLS PIPELINE II = 8
#pragma HLS UNROLL factor = 1
#pragma HLS LOOP_TRIPCOUNT min = 1 max = 4096
            const ZLayerVoxel &center_voxel = middle_layer.voxels[v];
            if (!center_voxel.valid)
                continue;
            ap_uint<32> output_index = center_voxel.feature_index;
            if (output_index < num_voxels)
            {
                convolve_voxel_z_buffer(center_voxel, morton_list, num_voxels, feature_dram_read, feature_dram_write, output_index);
            }
        }
    }
}
SystolicArray::SystolicArray()
{
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
    for (int n = 0; n < KERNEL_VOLUME; n++)
    {
        for (int i = 0; i < FEATURE_DIM; i++)
        {
#pragma HLS PIPELINE II = 1
            for (int j = 0; j < FEATURE_DIM; j += 8)
            {
#pragma HLS UNROLL factor = 8
                for (int k = 0; k < 8 && (j + k) < FEATURE_DIM; k++)
                {
#pragma HLS UNROLL
                    stored_weights[n][i][j + k] = weights[n][i][j + k];
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
    // Note: Removed old systolic array initialization
    // 3 z-layer multiplication arrays are now initialized in ZBufferConvolutionEngine
}
void ConvolutionEngine::process_sparse_convolution_streaming(
    ap_uint<MORTON_BITS> *morton_list,
    ap_uint<32> num_voxels,
    ap_uint<BRAM_WIDTH> *L3_bitmap,
    ap_uint<BRAM_WIDTH> *L2_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L1_bitmap_pruned,
    ap_uint<BRAM_WIDTH> *L0_bitmap_pruned,
    PrunedBitmapInfo &bitmap_info,
    ap_uint<32> *feature_dram_read,
    ap_uint<32> *feature_dram_write)
{
#pragma HLS INLINE off
    static ap_uint<1> z_engine_initialized = 0;
    if (!z_engine_initialized)
    {
        z_buffer_engine.initialize_z_buffer(stored_weights, stored_bias);
        z_engine_initialized = 1;
    }
    z_buffer_engine.process_z_buffer_convolution(
        morton_list, num_voxels,
        L3_bitmap, L2_bitmap_pruned, L1_bitmap_pruned, L0_bitmap_pruned,
        bitmap_info, feature_dram_read, feature_dram_write);
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
    for (int f = 0; f < FEATURE_DIM; f++)
    {
#pragma HLS UNROLL
        partial_sums[f] = stored_bias[f];
    }
NEIGHBOR_PROCESSING:
    for (int n = 0; n < KERNEL_VOLUME; n++)
    {
#pragma HLS UNROLL factor = 3
#pragma HLS PIPELINE II = 1
        int dx = NEIGHBOR_OFFSETS[n][0];
        int dy = NEIGHBOR_OFFSETS[n][1];
        int dz = NEIGHBOR_OFFSETS[n][2];
        int nx = x + dx;
        int ny = y + dy;
        int nz = z + dz;
        if (nx >= 0 && nx < DIM_L0 && ny >= 0 && ny < DIM_L0 && nz >= 0 && nz < DIM_L0)
        {
            ap_uint<MORTON_BITS> neighbor_morton = morton3D(nx, ny, nz);
            ap_uint<32> found_idx;
            bool exists = find_neighbor_streaming(
                neighbor_morton, L3_bitmap, L2_bitmap_pruned,
                L1_bitmap_pruned, L0_bitmap_pruned,
                bitmap_info, stream_ptrs, found_idx);
            if (exists)
            {
                int neighbor_feature_idx = find_feature_index(neighbor_morton, morton_list, num_voxels);
                if (neighbor_feature_idx >= 0 && neighbor_feature_idx < num_voxels)
                {
                FEATURE_MULTIPLY:
                    for (int out_f = 0; out_f < FEATURE_DIM; out_f++)
                    {
#pragma HLS PIPELINE II = 2
                        float accumulator = 0;
#pragma HLS BIND_OP variable = accumulator op = add impl = dsp
                    INNER_PRODUCT:
                        for (int in_f = 0; in_f < FEATURE_DIM; in_f++)
                        {
#pragma HLS UNROLL factor = 4
                            float weight = stored_weights[n][out_f][in_f];
                            float input_val = input_features[neighbor_feature_idx].features[in_f];
#pragma HLS BIND_OP variable = accumulator op = mul impl = dsp
                            accumulator += weight * input_val;
                        }
                        partial_sums[out_f] += accumulator;
                    }
                }
            }
        }
    }
APPLY_RELU:
    for (int f = 0; f < FEATURE_DIM; f++)
    {
#pragma HLS UNROLL
        output_features.features[f] = (partial_sums[f] > 0) ? partial_sums[f] : 0;
    }
}
