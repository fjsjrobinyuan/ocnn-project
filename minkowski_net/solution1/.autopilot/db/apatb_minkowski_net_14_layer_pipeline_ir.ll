; ModuleID = '/home/robin/Desktop/ocnn-project/minkowski_net/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<VoxelData, 0>" = type { %struct.VoxelData }
%struct.VoxelData = type { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"struct.ap_uint<60>" = type { %"struct.ap_int_base<60, false>" }
%"struct.ap_int_base<60, false>" = type { %"struct.ssdm_int<60, false>" }
%"struct.ssdm_int<60, false>" = type { i60 }
%"struct.ap_uint<512>" = type { %"struct.ap_int_base<512, false>" }
%"struct.ap_int_base<512, false>" = type { %"struct.ssdm_int<512, false>" }
%"struct.ssdm_int<512, false>" = type { i512 }
%struct.PrunedBitmapInfo = type { %"struct.ap_uint<32>", %"struct.ap_uint<32>", %"struct.ap_uint<32>", %"struct.ap_uint<32>", %"struct.ap_uint<32>" }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }

; Function Attrs: inaccessiblememonly nounwind willreturn
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_minkowski_net_14_layer_pipeline_ir(%"class.hls::stream<VoxelData, 0>"* noalias nocapture nonnull dereferenceable(144) %input_voxel_stream, %"struct.ap_uint<32>"* noalias nocapture nonnull "maxi" %final_output_full_cubic, [27 x [1024 x [1024 x float]]]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="14" "partition" %layer_weights, [1024 x float]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="14" "partition" %layer_biases, %"struct.ap_uint<32>"* noalias nocapture nonnull "maxi" %pruned_feature_dram_read, %"struct.ap_uint<32>"* noalias nocapture nonnull "maxi" %pruned_feature_dram_write, %"struct.ap_uint<512>"* noalias nonnull %L3_bitmap, %"struct.ap_uint<512>"* noalias nonnull %L2_bitmap, %"struct.ap_uint<512>"* noalias nonnull %L1_bitmap, %"struct.ap_uint<512>"* noalias nonnull %L0_bitmap, %struct.PrunedBitmapInfo* noalias nocapture nonnull dereferenceable(20) %bitmap_info, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %total_processed_voxels) local_unnamed_addr #1 {
entry:
  %input_voxel_stream_copy = alloca i1085, align 512
  call void @llvm.sideeffect() #11 [ "stream_interface"(i1085* %input_voxel_stream_copy, i32 0) ]
  %0 = bitcast %"struct.ap_uint<32>"* %final_output_full_cubic to [5242880 x %"struct.ap_uint<32>"]*
  %1 = call i8* @malloc(i64 20971520)
  %final_output_full_cubic_copy = bitcast i8* %1 to [5242880 x i32]*
  %2 = bitcast [27 x [1024 x [1024 x float]]]* %layer_weights to [14 x [27 x [1024 x [1024 x float]]]]*
  %_0 = call i8* @malloc(i64 113246208)
  %_1 = call i8* @malloc(i64 113246208)
  %_2 = call i8* @malloc(i64 113246208)
  %_3 = call i8* @malloc(i64 113246208)
  %_4 = call i8* @malloc(i64 113246208)
  %_5 = call i8* @malloc(i64 113246208)
  %_6 = call i8* @malloc(i64 113246208)
  %_7 = call i8* @malloc(i64 113246208)
  %_8 = call i8* @malloc(i64 113246208)
  %_9 = call i8* @malloc(i64 113246208)
  %_10 = call i8* @malloc(i64 113246208)
  %_11 = call i8* @malloc(i64 113246208)
  %_12 = call i8* @malloc(i64 113246208)
  %_13 = call i8* @malloc(i64 113246208)
  %layer_weights_copy_0 = bitcast i8* %_0 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_1 = bitcast i8* %_1 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_2 = bitcast i8* %_2 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_3 = bitcast i8* %_3 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_4 = bitcast i8* %_4 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_5 = bitcast i8* %_5 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_6 = bitcast i8* %_6 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_7 = bitcast i8* %_7 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_8 = bitcast i8* %_8 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_9 = bitcast i8* %_9 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_10 = bitcast i8* %_10 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_11 = bitcast i8* %_11 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_12 = bitcast i8* %_12 to [27 x [1024 x [1024 x float]]]*
  %layer_weights_copy_13 = bitcast i8* %_13 to [27 x [1024 x [1024 x float]]]*
  %3 = bitcast [1024 x float]* %layer_biases to [14 x [1024 x float]]*
  %_07 = call i8* @malloc(i64 4096)
  %_18 = call i8* @malloc(i64 4096)
  %_29 = call i8* @malloc(i64 4096)
  %_310 = call i8* @malloc(i64 4096)
  %_411 = call i8* @malloc(i64 4096)
  %_512 = call i8* @malloc(i64 4096)
  %_613 = call i8* @malloc(i64 4096)
  %_714 = call i8* @malloc(i64 4096)
  %_815 = call i8* @malloc(i64 4096)
  %_916 = call i8* @malloc(i64 4096)
  %_1017 = call i8* @malloc(i64 4096)
  %_1118 = call i8* @malloc(i64 4096)
  %_1219 = call i8* @malloc(i64 4096)
  %_1320 = call i8* @malloc(i64 4096)
  %layer_biases_copy_0 = bitcast i8* %_07 to [1024 x float]*
  %layer_biases_copy_1 = bitcast i8* %_18 to [1024 x float]*
  %layer_biases_copy_2 = bitcast i8* %_29 to [1024 x float]*
  %layer_biases_copy_3 = bitcast i8* %_310 to [1024 x float]*
  %layer_biases_copy_4 = bitcast i8* %_411 to [1024 x float]*
  %layer_biases_copy_5 = bitcast i8* %_512 to [1024 x float]*
  %layer_biases_copy_6 = bitcast i8* %_613 to [1024 x float]*
  %layer_biases_copy_7 = bitcast i8* %_714 to [1024 x float]*
  %layer_biases_copy_8 = bitcast i8* %_815 to [1024 x float]*
  %layer_biases_copy_9 = bitcast i8* %_916 to [1024 x float]*
  %layer_biases_copy_10 = bitcast i8* %_1017 to [1024 x float]*
  %layer_biases_copy_11 = bitcast i8* %_1118 to [1024 x float]*
  %layer_biases_copy_12 = bitcast i8* %_1219 to [1024 x float]*
  %layer_biases_copy_13 = bitcast i8* %_1320 to [1024 x float]*
  %4 = bitcast %"struct.ap_uint<32>"* %pruned_feature_dram_read to [262144 x %"struct.ap_uint<32>"]*
  %5 = call i8* @malloc(i64 1048576)
  %pruned_feature_dram_read_copy = bitcast i8* %5 to [262144 x i32]*
  %6 = bitcast %"struct.ap_uint<32>"* %pruned_feature_dram_write to [262144 x %"struct.ap_uint<32>"]*
  %7 = call i8* @malloc(i64 1048576)
  %pruned_feature_dram_write_copy = bitcast i8* %7 to [262144 x i32]*
  %L3_bitmap_copy = alloca i512, align 512
  %L2_bitmap_copy = alloca i512, align 512
  %L1_bitmap_copy = alloca i512, align 512
  %L0_bitmap_copy = alloca i512, align 512
  %bitmap_info_copy = alloca %struct.PrunedBitmapInfo, align 512
  %total_processed_voxels_copy = alloca i32, align 512
  call void @copy_in(%"class.hls::stream<VoxelData, 0>"* nonnull %input_voxel_stream, i1085* nonnull align 512 %input_voxel_stream_copy, [5242880 x %"struct.ap_uint<32>"]* nonnull %0, [5242880 x i32]* %final_output_full_cubic_copy, [14 x [27 x [1024 x [1024 x float]]]]* nonnull %2, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_0, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_1, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_2, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_3, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_4, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_5, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_6, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_7, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_8, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_9, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_10, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_11, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_12, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_13, [14 x [1024 x float]]* nonnull %3, [1024 x float]* %layer_biases_copy_0, [1024 x float]* %layer_biases_copy_1, [1024 x float]* %layer_biases_copy_2, [1024 x float]* %layer_biases_copy_3, [1024 x float]* %layer_biases_copy_4, [1024 x float]* %layer_biases_copy_5, [1024 x float]* %layer_biases_copy_6, [1024 x float]* %layer_biases_copy_7, [1024 x float]* %layer_biases_copy_8, [1024 x float]* %layer_biases_copy_9, [1024 x float]* %layer_biases_copy_10, [1024 x float]* %layer_biases_copy_11, [1024 x float]* %layer_biases_copy_12, [1024 x float]* %layer_biases_copy_13, [262144 x %"struct.ap_uint<32>"]* nonnull %4, [262144 x i32]* %pruned_feature_dram_read_copy, [262144 x %"struct.ap_uint<32>"]* nonnull %6, [262144 x i32]* %pruned_feature_dram_write_copy, %"struct.ap_uint<512>"* nonnull %L3_bitmap, i512* nonnull align 512 %L3_bitmap_copy, %"struct.ap_uint<512>"* nonnull %L2_bitmap, i512* nonnull align 512 %L2_bitmap_copy, %"struct.ap_uint<512>"* nonnull %L1_bitmap, i512* nonnull align 512 %L1_bitmap_copy, %"struct.ap_uint<512>"* nonnull %L0_bitmap, i512* nonnull align 512 %L0_bitmap_copy, %struct.PrunedBitmapInfo* nonnull %bitmap_info, %struct.PrunedBitmapInfo* nonnull align 512 %bitmap_info_copy, %"struct.ap_uint<32>"* nonnull %total_processed_voxels, i32* nonnull align 512 %total_processed_voxels_copy)
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_0, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_1, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_2, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_3, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_4, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_5, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_6, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_7, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_8, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_9, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_10, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_11, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_12, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([27 x [1024 x [1024 x float]]]* %layer_weights_copy_13, i32 998, i32 1, i32 0, i1 false) ], !dbg !43
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_0, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_1, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_2, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_3, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_4, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_5, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_6, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_7, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_8, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_9, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_10, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_11, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_12, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @llvm.sideeffect() #12 [ "xlx_array_partition"([1024 x float]* %layer_biases_copy_13, i32 998, i32 1, i32 0, i1 false) ], !dbg !551
  call void @apatb_minkowski_net_14_layer_pipeline_hw(i1085* %input_voxel_stream_copy, [5242880 x i32]* %final_output_full_cubic_copy, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_0, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_1, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_2, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_3, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_4, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_5, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_6, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_7, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_8, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_9, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_10, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_11, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_12, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_13, [1024 x float]* %layer_biases_copy_0, [1024 x float]* %layer_biases_copy_1, [1024 x float]* %layer_biases_copy_2, [1024 x float]* %layer_biases_copy_3, [1024 x float]* %layer_biases_copy_4, [1024 x float]* %layer_biases_copy_5, [1024 x float]* %layer_biases_copy_6, [1024 x float]* %layer_biases_copy_7, [1024 x float]* %layer_biases_copy_8, [1024 x float]* %layer_biases_copy_9, [1024 x float]* %layer_biases_copy_10, [1024 x float]* %layer_biases_copy_11, [1024 x float]* %layer_biases_copy_12, [1024 x float]* %layer_biases_copy_13, [262144 x i32]* %pruned_feature_dram_read_copy, [262144 x i32]* %pruned_feature_dram_write_copy, i512* %L3_bitmap_copy, i512* %L2_bitmap_copy, i512* %L1_bitmap_copy, i512* %L0_bitmap_copy, %struct.PrunedBitmapInfo* %bitmap_info_copy, i32* %total_processed_voxels_copy)
  call void @copy_back(%"class.hls::stream<VoxelData, 0>"* %input_voxel_stream, i1085* %input_voxel_stream_copy, [5242880 x %"struct.ap_uint<32>"]* %0, [5242880 x i32]* %final_output_full_cubic_copy, [14 x [27 x [1024 x [1024 x float]]]]* %2, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_0, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_1, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_2, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_3, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_4, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_5, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_6, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_7, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_8, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_9, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_10, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_11, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_12, [27 x [1024 x [1024 x float]]]* %layer_weights_copy_13, [14 x [1024 x float]]* %3, [1024 x float]* %layer_biases_copy_0, [1024 x float]* %layer_biases_copy_1, [1024 x float]* %layer_biases_copy_2, [1024 x float]* %layer_biases_copy_3, [1024 x float]* %layer_biases_copy_4, [1024 x float]* %layer_biases_copy_5, [1024 x float]* %layer_biases_copy_6, [1024 x float]* %layer_biases_copy_7, [1024 x float]* %layer_biases_copy_8, [1024 x float]* %layer_biases_copy_9, [1024 x float]* %layer_biases_copy_10, [1024 x float]* %layer_biases_copy_11, [1024 x float]* %layer_biases_copy_12, [1024 x float]* %layer_biases_copy_13, [262144 x %"struct.ap_uint<32>"]* %4, [262144 x i32]* %pruned_feature_dram_read_copy, [262144 x %"struct.ap_uint<32>"]* %6, [262144 x i32]* %pruned_feature_dram_write_copy, %"struct.ap_uint<512>"* %L3_bitmap, i512* %L3_bitmap_copy, %"struct.ap_uint<512>"* %L2_bitmap, i512* %L2_bitmap_copy, %"struct.ap_uint<512>"* %L1_bitmap, i512* %L1_bitmap_copy, %"struct.ap_uint<512>"* %L0_bitmap, i512* %L0_bitmap_copy, %struct.PrunedBitmapInfo* %bitmap_info, %struct.PrunedBitmapInfo* %bitmap_info_copy, %"struct.ap_uint<32>"* %total_processed_voxels, i32* %total_processed_voxels_copy)
  call void @free(i8* %1)
  call void @free(i8* %_0)
  call void @free(i8* %_1)
  call void @free(i8* %_2)
  call void @free(i8* %_3)
  call void @free(i8* %_4)
  call void @free(i8* %_5)
  call void @free(i8* %_6)
  call void @free(i8* %_7)
  call void @free(i8* %_8)
  call void @free(i8* %_9)
  call void @free(i8* %_10)
  call void @free(i8* %_11)
  call void @free(i8* %_12)
  call void @free(i8* %_13)
  call void @free(i8* %_07)
  call void @free(i8* %_18)
  call void @free(i8* %_29)
  call void @free(i8* %_310)
  call void @free(i8* %_411)
  call void @free(i8* %_512)
  call void @free(i8* %_613)
  call void @free(i8* %_714)
  call void @free(i8* %_815)
  call void @free(i8* %_916)
  call void @free(i8* %_1017)
  call void @free(i8* %_1118)
  call void @free(i8* %_1219)
  call void @free(i8* %_1320)
  call void @free(i8* %5)
  call void @free(i8* %7)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>"(i1085* align 512 %dst, %"class.hls::stream<VoxelData, 0>"* %src) unnamed_addr #2 {
entry:
  %0 = icmp eq i1085* %dst, null
  %1 = icmp eq %"class.hls::stream<VoxelData, 0>"* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<VoxelData, 0>"(i1085* nonnull align 512 %dst, %"class.hls::stream<VoxelData, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<VoxelData, 0>"(i1085* nocapture align 512, %"class.hls::stream<VoxelData, 0>"* nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream<VoxelData, 0>"
  %3 = alloca i1085
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"class.hls::stream<VoxelData, 0>"* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_144(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"class.hls::stream<VoxelData, 0>"* %2 to i8*
  %7 = bitcast %"class.hls::stream<VoxelData, 0>"* %1 to i8*
  call void @fpga_fifo_pop_144(i8* %6, i8* %7)
  %8 = load volatile %"class.hls::stream<VoxelData, 0>", %"class.hls::stream<VoxelData, 0>"* %2
  %9 = call i1085 @"_llvm.fpga.pack.bits.i1085.s_class.hls::stream<VoxelData, 0>s"(%"class.hls::stream<VoxelData, 0>" %8)
  store i1085 %9, i1085* %3
  %10 = bitcast i1085* %3 to i8*
  %11 = bitcast i1085* %0 to i8*
  call void @fpga_fifo_push_256(i8* %10, i8* %11)
  br label %empty, !llvm.loop !552

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<32>"([5242880 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [5242880 x i32]* nocapture readonly "unpacked"="1.0" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq [5242880 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a5242880struct.ap_uint<32>"([5242880 x %"struct.ap_uint<32>"]* nonnull %dst, [5242880 x i32]* %src, i64 5242880)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5242880struct.ap_uint<32>"([5242880 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [5242880 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #5 {
entry:
  %0 = icmp eq [5242880 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [5242880 x i32], [5242880 x i32]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [5242880 x %"struct.ap_uint<32>"], [5242880 x %"struct.ap_uint<32>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a14a27a1024a1024f32([14 x [27 x [1024 x [1024 x float]]]]* "orig.arg.no"="0" %dst, [14 x [27 x [1024 x [1024 x float]]]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #5 {
entry:
  %0 = icmp eq [14 x [27 x [1024 x [1024 x float]]]]* %src, null
  %1 = icmp eq [14 x [27 x [1024 x [1024 x float]]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [14 x [27 x [1024 x [1024 x float]]]], [14 x [27 x [1024 x [1024 x float]]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [14 x [27 x [1024 x [1024 x float]]]], [14 x [27 x [1024 x [1024 x float]]]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst, [27 x [1024 x [1024 x float]]]* readonly %src, i64 %num) local_unnamed_addr #5 {
entry:
  %0 = icmp eq [27 x [1024 x [1024 x float]]]* %src, null
  %1 = icmp eq [27 x [1024 x [1024 x float]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [27 x [1024 x [1024 x float]]], [27 x [1024 x [1024 x float]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [27 x [1024 x [1024 x float]]], [27 x [1024 x [1024 x float]]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a1024a1024f32([1024 x [1024 x float]]* %dst.addr, [1024 x [1024 x float]]* %src.addr, i64 1024)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1024a1024f32([1024 x [1024 x float]]* %dst, [1024 x [1024 x float]]* readonly %src, i64 %num) local_unnamed_addr #5 {
entry:
  %0 = icmp eq [1024 x [1024 x float]]* %src, null
  %1 = icmp eq [1024 x [1024 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1024 x [1024 x float]], [1024 x [1024 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1024 x [1024 x float]], [1024 x [1024 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src.addr, i64 1024)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1024f32([1024 x float]* %dst, [1024 x float]* readonly %src, i64 %num) local_unnamed_addr #5 {
entry:
  %0 = icmp eq [1024 x float]* %src, null
  %1 = icmp eq [1024 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1024 x float], [1024 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1024 x float], [1024 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a14a1024f32([14 x [1024 x float]]* "orig.arg.no"="0" %dst, [14 x [1024 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #5 {
entry:
  %0 = icmp eq [14 x [1024 x float]]* %src, null
  %1 = icmp eq [14 x [1024 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [14 x [1024 x float]], [14 x [1024 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [14 x [1024 x float]], [14 x [1024 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src.addr, i64 1024)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.PrunedBitmapInfo(%struct.PrunedBitmapInfo* align 512 %dst, %struct.PrunedBitmapInfo* readonly %src) unnamed_addr #4 {
entry:
  %0 = icmp eq %struct.PrunedBitmapInfo* %dst, null
  %1 = icmp eq %struct.PrunedBitmapInfo* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.0.05 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %src, i64 0, i32 0, i32 0, i32 0, i32 0
  %dst.0.0.0.06 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %dst, i64 0, i32 0, i32 0, i32 0, i32 0
  %3 = load i32, i32* %src.0.0.0.05, align 4
  store i32 %3, i32* %dst.0.0.0.06, align 512
  %src.1.0.0.011 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %src, i64 0, i32 1, i32 0, i32 0, i32 0
  %dst.1.0.0.012 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %dst, i64 0, i32 1, i32 0, i32 0, i32 0
  %4 = load i32, i32* %src.1.0.0.011, align 4
  store i32 %4, i32* %dst.1.0.0.012, align 4
  %src.2.0.0.017 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %src, i64 0, i32 2, i32 0, i32 0, i32 0
  %dst.2.0.0.018 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %dst, i64 0, i32 2, i32 0, i32 0, i32 0
  %5 = load i32, i32* %src.2.0.0.017, align 4
  store i32 %5, i32* %dst.2.0.0.018, align 8
  %src.3.0.0.023 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %src, i64 0, i32 3, i32 0, i32 0, i32 0
  %dst.3.0.0.024 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %dst, i64 0, i32 3, i32 0, i32 0, i32 0
  %6 = load i32, i32* %src.3.0.0.023, align 4
  store i32 %6, i32* %dst.3.0.0.024, align 4
  %src.4.0.0.029 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %src, i64 0, i32 4, i32 0, i32 0, i32 0
  %dst.4.0.0.030 = getelementptr %struct.PrunedBitmapInfo, %struct.PrunedBitmapInfo* %dst, i64 0, i32 4, i32 0, i32 0, i32 0
  %7 = load i32, i32* %src.4.0.0.029, align 4
  store i32 %7, i32* %dst.4.0.0.030, align 16
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<32>"* noalias readonly "unpacked"="1" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq %"struct.ap_uint<32>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<32>", %"struct.ap_uint<32>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = load i32, i32* %src.0.0.03, align 4
  store i32 %1, i32* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.64"(%"struct.ap_uint<32>"* noalias "unpacked"="0" %dst, i32* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq %"struct.ap_uint<32>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<32>", %"struct.ap_uint<32>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = load i32, i32* %src, align 512
  store i32 %1, i32* %dst.0.0.04, align 4
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<512>"* noalias readonly "unpacked"="1" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq %"struct.ap_uint<512>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<512>", %"struct.ap_uint<512>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = load i512, i512* %src.0.0.03, align 64
  store i512 %1, i512* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.78"(%"struct.ap_uint<512>"* noalias "unpacked"="0" %dst, i512* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq %"struct.ap_uint<512>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<512>", %"struct.ap_uint<512>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = load i512, i512* %src, align 512
  store i512 %1, i512* %dst.0.0.04, align 64
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<32>.98"([5242880 x i32]* nocapture "unpacked"="0.0" %dst, [5242880 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq [5242880 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a5242880struct.ap_uint<32>.101"([5242880 x i32]* %dst, [5242880 x %"struct.ap_uint<32>"]* nonnull %src, i64 5242880)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5242880struct.ap_uint<32>.101"([5242880 x i32]* nocapture "unpacked"="0.0" %dst, [5242880 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #5 {
entry:
  %0 = icmp eq [5242880 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [5242880 x %"struct.ap_uint<32>"], [5242880 x %"struct.ap_uint<32>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [5242880 x i32], [5242880 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #6

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a14a27a1024a1024f32.112.113([27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [14 x [27 x [1024 x [1024 x float]]]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #5 {
entry:
  %0 = icmp eq [14 x [27 x [1024 x [1024 x float]]]]* %src, null
  %1 = icmp eq [27 x [1024 x [1024 x float]]]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [14 x [27 x [1024 x [1024 x float]]]], [14 x [27 x [1024 x [1024 x float]]]]* %src, i64 0, i64 %for.loop.idx2
  switch i64 %for.loop.idx2, label %dst.addr.case.13 [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
    i64 2, label %dst.addr.case.2
    i64 3, label %dst.addr.case.3
    i64 4, label %dst.addr.case.4
    i64 5, label %dst.addr.case.5
    i64 6, label %dst.addr.case.6
    i64 7, label %dst.addr.case.7
    i64 8, label %dst.addr.case.8
    i64 9, label %dst.addr.case.9
    i64 10, label %dst.addr.case.10
    i64 11, label %dst.addr.case.11
    i64 12, label %dst.addr.case.12
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_0, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_1, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_2, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_3, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.4:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_4, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.5:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_5, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.6:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_6, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.7:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_7, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.8:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_8, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.9:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_9, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.10:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_10, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.11:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_11, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.12:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_12, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.case.13:                                 ; preds = %for.loop
  %3 = icmp eq i64 %for.loop.idx2, 13
  call void @llvm.assume(i1 %3)
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst_13, [27 x [1024 x [1024 x float]]]* %src.addr, i64 27)
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.13, %dst.addr.case.12, %dst.addr.case.11, %dst.addr.case.10, %dst.addr.case.9, %dst.addr.case.8, %dst.addr.case.7, %dst.addr.case.6, %dst.addr.case.5, %dst.addr.case.4, %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a14a27a1024a1024f32.111.114([27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [14 x [27 x [1024 x [1024 x float]]]]* readonly "orig.arg.no"="1" %src) #4 {
entry:
  %0 = icmp eq [27 x [1024 x [1024 x float]]]* %dst_0, null
  %1 = icmp eq [14 x [27 x [1024 x [1024 x float]]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a14a27a1024a1024f32.112.113([27 x [1024 x [1024 x float]]]* nonnull %dst_0, [27 x [1024 x [1024 x float]]]* %dst_1, [27 x [1024 x [1024 x float]]]* %dst_2, [27 x [1024 x [1024 x float]]]* %dst_3, [27 x [1024 x [1024 x float]]]* %dst_4, [27 x [1024 x [1024 x float]]]* %dst_5, [27 x [1024 x [1024 x float]]]* %dst_6, [27 x [1024 x [1024 x float]]]* %dst_7, [27 x [1024 x [1024 x float]]]* %dst_8, [27 x [1024 x [1024 x float]]]* %dst_9, [27 x [1024 x [1024 x float]]]* %dst_10, [27 x [1024 x [1024 x float]]]* %dst_11, [27 x [1024 x [1024 x float]]]* %dst_12, [27 x [1024 x [1024 x float]]]* %dst_13, [14 x [27 x [1024 x [1024 x float]]]]* nonnull %src, i64 14)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a14a1024f32.116.117([1024 x float]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [14 x [1024 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #5 {
entry:
  %0 = icmp eq [14 x [1024 x float]]* %src, null
  %1 = icmp eq [1024 x float]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [14 x [1024 x float]], [14 x [1024 x float]]* %src, i64 0, i64 %for.loop.idx2
  switch i64 %for.loop.idx2, label %dst.addr.case.13 [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
    i64 2, label %dst.addr.case.2
    i64 3, label %dst.addr.case.3
    i64 4, label %dst.addr.case.4
    i64 5, label %dst.addr.case.5
    i64 6, label %dst.addr.case.6
    i64 7, label %dst.addr.case.7
    i64 8, label %dst.addr.case.8
    i64 9, label %dst.addr.case.9
    i64 10, label %dst.addr.case.10
    i64 11, label %dst.addr.case.11
    i64 12, label %dst.addr.case.12
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_0, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_1, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_2, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_3, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.4:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_4, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.5:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_5, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.6:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_6, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.7:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_7, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.8:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_8, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.9:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_9, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.10:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_10, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.11:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_11, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.12:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_12, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.case.13:                                 ; preds = %for.loop
  %3 = icmp eq i64 %for.loop.idx2, 13
  call void @llvm.assume(i1 %3)
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst_13, [1024 x float]* %src.addr, i64 1024)
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.13, %dst.addr.case.12, %dst.addr.case.11, %dst.addr.case.10, %dst.addr.case.9, %dst.addr.case.8, %dst.addr.case.7, %dst.addr.case.6, %dst.addr.case.5, %dst.addr.case.4, %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a14a1024f32.115.118([1024 x float]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [1024 x float]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [14 x [1024 x float]]* readonly "orig.arg.no"="1" %src) #4 {
entry:
  %0 = icmp eq [1024 x float]* %dst_0, null
  %1 = icmp eq [14 x [1024 x float]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a14a1024f32.116.117([1024 x float]* nonnull %dst_0, [1024 x float]* %dst_1, [1024 x float]* %dst_2, [1024 x float]* %dst_3, [1024 x float]* %dst_4, [1024 x float]* %dst_5, [1024 x float]* %dst_6, [1024 x float]* %dst_7, [1024 x float]* %dst_8, [1024 x float]* %dst_9, [1024 x float]* %dst_10, [1024 x float]* %dst_11, [1024 x float]* %dst_12, [1024 x float]* %dst_13, [14 x [1024 x float]]* nonnull %src, i64 14)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_in(%"class.hls::stream<VoxelData, 0>"* "orig.arg.no"="0" "unpacked"="0", i1085* align 512 "orig.arg.no"="1" "unpacked"="1", [5242880 x %"struct.ap_uint<32>"]* readonly "orig.arg.no"="2" "unpacked"="2", [5242880 x i32]* nocapture "orig.arg.no"="3" "unpacked"="3.0", [14 x [27 x [1024 x [1024 x float]]]]* readonly "orig.arg.no"="4" "unpacked"="4", [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.0" %_0, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.1" %_1, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.2" %_2, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.3" %_3, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.4" %_4, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.5" %_5, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.6" %_6, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.7" %_7, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.8" %_8, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.9" %_9, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.10" %_10, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.11" %_11, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.12" %_12, [27 x [1024 x [1024 x float]]]* "orig.arg.no"="5" "unpacked"="5.13" %_13, [14 x [1024 x float]]* readonly "orig.arg.no"="6" "unpacked"="6", [1024 x float]* "orig.arg.no"="7" "unpacked"="7.0" %_01, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.1" %_14, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.2" %_25, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.3" %_36, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.4" %_47, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.5" %_58, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.6" %_69, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.7" %_710, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.8" %_811, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.9" %_912, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.10" %_1013, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.11" %_1114, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.12" %_1215, [1024 x float]* "orig.arg.no"="7" "unpacked"="7.13" %_1316, [262144 x %"struct.ap_uint<32>"]* readonly "orig.arg.no"="8" "unpacked"="8", [262144 x i32]* "orig.arg.no"="9" "unpacked"="9", [262144 x %"struct.ap_uint<32>"]* readonly "orig.arg.no"="10" "unpacked"="10", [262144 x i32]* "orig.arg.no"="11" "unpacked"="11", %"struct.ap_uint<512>"* readonly "orig.arg.no"="12" "unpacked"="12", i512* noalias nocapture align 512 "orig.arg.no"="13" "unpacked"="13.0", %"struct.ap_uint<512>"* readonly "orig.arg.no"="14" "unpacked"="14", i512* noalias nocapture align 512 "orig.arg.no"="15" "unpacked"="15.0", %"struct.ap_uint<512>"* readonly "orig.arg.no"="16" "unpacked"="16", i512* noalias nocapture align 512 "orig.arg.no"="17" "unpacked"="17.0", %"struct.ap_uint<512>"* readonly "orig.arg.no"="18" "unpacked"="18", i512* noalias nocapture align 512 "orig.arg.no"="19" "unpacked"="19.0", %struct.PrunedBitmapInfo* readonly "orig.arg.no"="20" "unpacked"="20", %struct.PrunedBitmapInfo* align 512 "orig.arg.no"="21" "unpacked"="21", %"struct.ap_uint<32>"* readonly "orig.arg.no"="22" "unpacked"="22", i32* noalias nocapture align 512 "orig.arg.no"="23" "unpacked"="23.0") #7 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>"(i1085* align 512 %1, %"class.hls::stream<VoxelData, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<32>.98"([5242880 x i32]* %3, [5242880 x %"struct.ap_uint<32>"]* %2)
  call void @onebyonecpy_hls.p0a14a27a1024a1024f32.111.114([27 x [1024 x [1024 x float]]]* %_0, [27 x [1024 x [1024 x float]]]* %_1, [27 x [1024 x [1024 x float]]]* %_2, [27 x [1024 x [1024 x float]]]* %_3, [27 x [1024 x [1024 x float]]]* %_4, [27 x [1024 x [1024 x float]]]* %_5, [27 x [1024 x [1024 x float]]]* %_6, [27 x [1024 x [1024 x float]]]* %_7, [27 x [1024 x [1024 x float]]]* %_8, [27 x [1024 x [1024 x float]]]* %_9, [27 x [1024 x [1024 x float]]]* %_10, [27 x [1024 x [1024 x float]]]* %_11, [27 x [1024 x [1024 x float]]]* %_12, [27 x [1024 x [1024 x float]]]* %_13, [14 x [27 x [1024 x [1024 x float]]]]* %4)
  call void @onebyonecpy_hls.p0a14a1024f32.115.118([1024 x float]* %_01, [1024 x float]* %_14, [1024 x float]* %_25, [1024 x float]* %_36, [1024 x float]* %_47, [1024 x float]* %_58, [1024 x float]* %_69, [1024 x float]* %_710, [1024 x float]* %_811, [1024 x float]* %_912, [1024 x float]* %_1013, [1024 x float]* %_1114, [1024 x float]* %_1215, [1024 x float]* %_1316, [14 x [1024 x float]]* %5)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>"([262144 x i32]* %7, [262144 x %"struct.ap_uint<32>"]* %6)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>"([262144 x i32]* %9, [262144 x %"struct.ap_uint<32>"]* %8)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* align 512 %11, %"struct.ap_uint<512>"* %10)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* align 512 %13, %"struct.ap_uint<512>"* %12)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* align 512 %15, %"struct.ap_uint<512>"* %14)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* align 512 %17, %"struct.ap_uint<512>"* %16)
  call fastcc void @onebyonecpy_hls.p0struct.PrunedBitmapInfo(%struct.PrunedBitmapInfo* align 512 %19, %struct.PrunedBitmapInfo* %18)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %21, %"struct.ap_uint<32>"* %20)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a14a27a1024a1024f32.124.125([14 x [27 x [1024 x [1024 x float]]]]* "orig.arg.no"="0" %dst, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, i64 "orig.arg.no"="2" %num) #5 {
entry:
  %0 = icmp eq [27 x [1024 x [1024 x float]]]* %src_0, null
  %1 = icmp eq [14 x [27 x [1024 x [1024 x float]]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [14 x [27 x [1024 x [1024 x float]]]], [14 x [27 x [1024 x [1024 x float]]]]* %dst, i64 0, i64 %for.loop.idx2
  switch i64 %for.loop.idx2, label %src.addr.case.13 [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
    i64 2, label %src.addr.case.2
    i64 3, label %src.addr.case.3
    i64 4, label %src.addr.case.4
    i64 5, label %src.addr.case.5
    i64 6, label %src.addr.case.6
    i64 7, label %src.addr.case.7
    i64 8, label %src.addr.case.8
    i64 9, label %src.addr.case.9
    i64 10, label %src.addr.case.10
    i64 11, label %src.addr.case.11
    i64 12, label %src.addr.case.12
  ]

src.addr.case.0:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_0, i64 27)
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_1, i64 27)
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_2, i64 27)
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_3, i64 27)
  br label %src.addr.exit

src.addr.case.4:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_4, i64 27)
  br label %src.addr.exit

src.addr.case.5:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_5, i64 27)
  br label %src.addr.exit

src.addr.case.6:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_6, i64 27)
  br label %src.addr.exit

src.addr.case.7:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_7, i64 27)
  br label %src.addr.exit

src.addr.case.8:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_8, i64 27)
  br label %src.addr.exit

src.addr.case.9:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_9, i64 27)
  br label %src.addr.exit

src.addr.case.10:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_10, i64 27)
  br label %src.addr.exit

src.addr.case.11:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_11, i64 27)
  br label %src.addr.exit

src.addr.case.12:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_12, i64 27)
  br label %src.addr.exit

src.addr.case.13:                                 ; preds = %for.loop
  %3 = icmp eq i64 %for.loop.idx2, 13
  call void @llvm.assume(i1 %3)
  call void @arraycpy_hls.p0a27a1024a1024f32([27 x [1024 x [1024 x float]]]* %dst.addr, [27 x [1024 x [1024 x float]]]* %src_13, i64 27)
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.13, %src.addr.case.12, %src.addr.case.11, %src.addr.case.10, %src.addr.case.9, %src.addr.case.8, %src.addr.case.7, %src.addr.case.6, %src.addr.case.5, %src.addr.case.4, %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a14a27a1024a1024f32.123.126([14 x [27 x [1024 x [1024 x float]]]]* "orig.arg.no"="0" %dst, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13) #4 {
entry:
  %0 = icmp eq [14 x [27 x [1024 x [1024 x float]]]]* %dst, null
  %1 = icmp eq [27 x [1024 x [1024 x float]]]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a14a27a1024a1024f32.124.125([14 x [27 x [1024 x [1024 x float]]]]* nonnull %dst, [27 x [1024 x [1024 x float]]]* nonnull %src_0, [27 x [1024 x [1024 x float]]]* %src_1, [27 x [1024 x [1024 x float]]]* %src_2, [27 x [1024 x [1024 x float]]]* %src_3, [27 x [1024 x [1024 x float]]]* %src_4, [27 x [1024 x [1024 x float]]]* %src_5, [27 x [1024 x [1024 x float]]]* %src_6, [27 x [1024 x [1024 x float]]]* %src_7, [27 x [1024 x [1024 x float]]]* %src_8, [27 x [1024 x [1024 x float]]]* %src_9, [27 x [1024 x [1024 x float]]]* %src_10, [27 x [1024 x [1024 x float]]]* %src_11, [27 x [1024 x [1024 x float]]]* %src_12, [27 x [1024 x [1024 x float]]]* %src_13, i64 14)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a14a1024f32.128.129([14 x [1024 x float]]* "orig.arg.no"="0" %dst, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, i64 "orig.arg.no"="2" %num) #5 {
entry:
  %0 = icmp eq [1024 x float]* %src_0, null
  %1 = icmp eq [14 x [1024 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [14 x [1024 x float]], [14 x [1024 x float]]* %dst, i64 0, i64 %for.loop.idx2
  switch i64 %for.loop.idx2, label %src.addr.case.13 [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
    i64 2, label %src.addr.case.2
    i64 3, label %src.addr.case.3
    i64 4, label %src.addr.case.4
    i64 5, label %src.addr.case.5
    i64 6, label %src.addr.case.6
    i64 7, label %src.addr.case.7
    i64 8, label %src.addr.case.8
    i64 9, label %src.addr.case.9
    i64 10, label %src.addr.case.10
    i64 11, label %src.addr.case.11
    i64 12, label %src.addr.case.12
  ]

src.addr.case.0:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_0, i64 1024)
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_1, i64 1024)
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_2, i64 1024)
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_3, i64 1024)
  br label %src.addr.exit

src.addr.case.4:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_4, i64 1024)
  br label %src.addr.exit

src.addr.case.5:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_5, i64 1024)
  br label %src.addr.exit

src.addr.case.6:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_6, i64 1024)
  br label %src.addr.exit

src.addr.case.7:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_7, i64 1024)
  br label %src.addr.exit

src.addr.case.8:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_8, i64 1024)
  br label %src.addr.exit

src.addr.case.9:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_9, i64 1024)
  br label %src.addr.exit

src.addr.case.10:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_10, i64 1024)
  br label %src.addr.exit

src.addr.case.11:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_11, i64 1024)
  br label %src.addr.exit

src.addr.case.12:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_12, i64 1024)
  br label %src.addr.exit

src.addr.case.13:                                 ; preds = %for.loop
  %3 = icmp eq i64 %for.loop.idx2, 13
  call void @llvm.assume(i1 %3)
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.addr, [1024 x float]* %src_13, i64 1024)
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.13, %src.addr.case.12, %src.addr.case.11, %src.addr.case.10, %src.addr.case.9, %src.addr.case.8, %src.addr.case.7, %src.addr.case.6, %src.addr.case.5, %src.addr.case.4, %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a14a1024f32.127.130([14 x [1024 x float]]* "orig.arg.no"="0" %dst, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [1024 x float]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13) #4 {
entry:
  %0 = icmp eq [14 x [1024 x float]]* %dst, null
  %1 = icmp eq [1024 x float]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a14a1024f32.128.129([14 x [1024 x float]]* nonnull %dst, [1024 x float]* nonnull %src_0, [1024 x float]* %src_1, [1024 x float]* %src_2, [1024 x float]* %src_3, [1024 x float]* %src_4, [1024 x float]* %src_5, [1024 x float]* %src_6, [1024 x float]* %src_7, [1024 x float]* %src_8, [1024 x float]* %src_9, [1024 x float]* %src_10, [1024 x float]* %src_11, [1024 x float]* %src_12, [1024 x float]* %src_13, i64 14)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_out(%"class.hls::stream<VoxelData, 0>"* "orig.arg.no"="0" "unpacked"="0", i1085* align 512 "orig.arg.no"="1" "unpacked"="1", [5242880 x %"struct.ap_uint<32>"]* "orig.arg.no"="2" "unpacked"="2", [5242880 x i32]* nocapture readonly "orig.arg.no"="3" "unpacked"="3.0", [14 x [27 x [1024 x [1024 x float]]]]* "orig.arg.no"="4" "unpacked"="4", [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.0" %_0, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.1" %_1, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.2" %_2, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.3" %_3, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.4" %_4, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.5" %_5, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.6" %_6, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.7" %_7, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.8" %_8, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.9" %_9, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.10" %_10, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.11" %_11, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.12" %_12, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.13" %_13, [14 x [1024 x float]]* "orig.arg.no"="6" "unpacked"="6", [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.0" %_01, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.1" %_14, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.2" %_25, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.3" %_36, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.4" %_47, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.5" %_58, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.6" %_69, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.7" %_710, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.8" %_811, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.9" %_912, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.10" %_1013, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.11" %_1114, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.12" %_1215, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.13" %_1316, [262144 x %"struct.ap_uint<32>"]* "orig.arg.no"="8" "unpacked"="8", [262144 x i32]* readonly "orig.arg.no"="9" "unpacked"="9", [262144 x %"struct.ap_uint<32>"]* "orig.arg.no"="10" "unpacked"="10", [262144 x i32]* readonly "orig.arg.no"="11" "unpacked"="11", %"struct.ap_uint<512>"* "orig.arg.no"="12" "unpacked"="12", i512* noalias nocapture readonly align 512 "orig.arg.no"="13" "unpacked"="13.0", %"struct.ap_uint<512>"* "orig.arg.no"="14" "unpacked"="14", i512* noalias nocapture readonly align 512 "orig.arg.no"="15" "unpacked"="15.0", %"struct.ap_uint<512>"* "orig.arg.no"="16" "unpacked"="16", i512* noalias nocapture readonly align 512 "orig.arg.no"="17" "unpacked"="17.0", %"struct.ap_uint<512>"* "orig.arg.no"="18" "unpacked"="18", i512* noalias nocapture readonly align 512 "orig.arg.no"="19" "unpacked"="19.0", %struct.PrunedBitmapInfo* "orig.arg.no"="20" "unpacked"="20", %struct.PrunedBitmapInfo* readonly align 512 "orig.arg.no"="21" "unpacked"="21", %"struct.ap_uint<32>"* "orig.arg.no"="22" "unpacked"="22", i32* noalias nocapture readonly align 512 "orig.arg.no"="23" "unpacked"="23.0") #8 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>.141"(%"class.hls::stream<VoxelData, 0>"* %0, i1085* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<32>"([5242880 x %"struct.ap_uint<32>"]* %2, [5242880 x i32]* %3)
  call void @onebyonecpy_hls.p0a14a27a1024a1024f32.123.126([14 x [27 x [1024 x [1024 x float]]]]* %4, [27 x [1024 x [1024 x float]]]* %_0, [27 x [1024 x [1024 x float]]]* %_1, [27 x [1024 x [1024 x float]]]* %_2, [27 x [1024 x [1024 x float]]]* %_3, [27 x [1024 x [1024 x float]]]* %_4, [27 x [1024 x [1024 x float]]]* %_5, [27 x [1024 x [1024 x float]]]* %_6, [27 x [1024 x [1024 x float]]]* %_7, [27 x [1024 x [1024 x float]]]* %_8, [27 x [1024 x [1024 x float]]]* %_9, [27 x [1024 x [1024 x float]]]* %_10, [27 x [1024 x [1024 x float]]]* %_11, [27 x [1024 x [1024 x float]]]* %_12, [27 x [1024 x [1024 x float]]]* %_13)
  call void @onebyonecpy_hls.p0a14a1024f32.127.130([14 x [1024 x float]]* %5, [1024 x float]* %_01, [1024 x float]* %_14, [1024 x float]* %_25, [1024 x float]* %_36, [1024 x float]* %_47, [1024 x float]* %_58, [1024 x float]* %_69, [1024 x float]* %_710, [1024 x float]* %_811, [1024 x float]* %_912, [1024 x float]* %_1013, [1024 x float]* %_1114, [1024 x float]* %_1215, [1024 x float]* %_1316)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.169"([262144 x %"struct.ap_uint<32>"]* %6, [262144 x i32]* %7)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.169"([262144 x %"struct.ap_uint<32>"]* %8, [262144 x i32]* %9)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.78"(%"struct.ap_uint<512>"* %10, i512* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.78"(%"struct.ap_uint<512>"* %12, i512* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.78"(%"struct.ap_uint<512>"* %14, i512* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.78"(%"struct.ap_uint<512>"* %16, i512* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0struct.PrunedBitmapInfo(%struct.PrunedBitmapInfo* %18, %struct.PrunedBitmapInfo* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.64"(%"struct.ap_uint<32>"* %20, i32* align 512 %21)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>.141"(%"class.hls::stream<VoxelData, 0>"* %dst, i1085* align 512 %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<VoxelData, 0>"* %dst, null
  %1 = icmp eq i1085* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<VoxelData, 0>.144"(%"class.hls::stream<VoxelData, 0>"* nonnull %dst, i1085* nonnull align 512 %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<VoxelData, 0>.144"(%"class.hls::stream<VoxelData, 0>"* nocapture, i1085* nocapture align 512) unnamed_addr #3 {
entry:
  %2 = alloca i1085
  %3 = alloca %"class.hls::stream<VoxelData, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast i1085* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_256(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast i1085* %2 to i8*
  %7 = bitcast i1085* %1 to i8*
  call void @fpga_fifo_pop_256(i8* %6, i8* %7)
  %8 = bitcast i1085* %2 to i1088*
  %9 = load i1088, i1088* %8
  %10 = trunc i1088 %9 to i1085
  %11 = call { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } @"_llvm.fpga.unpack.bits.s_class.hls::stream<VoxelData, 0>s.i1085"(i1085 %10)
  %newret = extractvalue { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } %11, 0
  %oldret1 = insertvalue %struct.VoxelData undef, %"struct.ap_uint<1>" %newret, 0
  %newret2 = extractvalue { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } %11, 1
  %oldret3 = insertvalue %struct.VoxelData %oldret1, [32 x float] %newret2, 1
  %newret4 = extractvalue { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } %11, 2
  %oldret5 = insertvalue %struct.VoxelData %oldret3, %"struct.ap_uint<60>" %newret4, 2
  %oldret = insertvalue %"class.hls::stream<VoxelData, 0>" undef, %struct.VoxelData %oldret5, 0
  store %"class.hls::stream<VoxelData, 0>" %oldret, %"class.hls::stream<VoxelData, 0>"* %3
  %12 = bitcast %"class.hls::stream<VoxelData, 0>"* %3 to i8*
  %13 = bitcast %"class.hls::stream<VoxelData, 0>"* %0 to i8*
  call void @fpga_fifo_push_144(i8* %12, i8* %13)
  br label %empty, !llvm.loop !552

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: alwaysinline nounwind readnone willreturn
define internal { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } @"_llvm.fpga.unpack.bits.s_class.hls::stream<VoxelData, 0>s.i1085"(i1085 %A) #9 {
  %1 = trunc i1085 %A to i1
  %.0 = insertvalue %"struct.ssdm_int<1, false>" undef, i1 %1, 0
  %.01 = insertvalue %"struct.ap_int_base<1, false>" undef, %"struct.ssdm_int<1, false>" %.0, 0
  %.02 = insertvalue %"struct.ap_uint<1>" undef, %"struct.ap_int_base<1, false>" %.01, 0
  %2 = lshr i1085 %A, 1
  %3 = trunc i1085 %2 to i32
  %.0.cast = bitcast i32 %3 to float
  %.04 = insertvalue [32 x float] undef, float %.0.cast, 0
  %4 = lshr i1085 %A, 33
  %5 = trunc i1085 %4 to i32
  %.1.cast = bitcast i32 %5 to float
  %.1 = insertvalue [32 x float] %.04, float %.1.cast, 1
  %6 = lshr i1085 %A, 65
  %7 = trunc i1085 %6 to i32
  %.2.cast = bitcast i32 %7 to float
  %.2 = insertvalue [32 x float] %.1, float %.2.cast, 2
  %8 = lshr i1085 %A, 97
  %9 = trunc i1085 %8 to i32
  %.3.cast = bitcast i32 %9 to float
  %.3 = insertvalue [32 x float] %.2, float %.3.cast, 3
  %10 = lshr i1085 %A, 129
  %11 = trunc i1085 %10 to i32
  %.4.cast = bitcast i32 %11 to float
  %.4 = insertvalue [32 x float] %.3, float %.4.cast, 4
  %12 = lshr i1085 %A, 161
  %13 = trunc i1085 %12 to i32
  %.5.cast = bitcast i32 %13 to float
  %.5 = insertvalue [32 x float] %.4, float %.5.cast, 5
  %14 = lshr i1085 %A, 193
  %15 = trunc i1085 %14 to i32
  %.6.cast = bitcast i32 %15 to float
  %.6 = insertvalue [32 x float] %.5, float %.6.cast, 6
  %16 = lshr i1085 %A, 225
  %17 = trunc i1085 %16 to i32
  %.7.cast = bitcast i32 %17 to float
  %.7 = insertvalue [32 x float] %.6, float %.7.cast, 7
  %18 = lshr i1085 %A, 257
  %19 = trunc i1085 %18 to i32
  %.8.cast = bitcast i32 %19 to float
  %.8 = insertvalue [32 x float] %.7, float %.8.cast, 8
  %20 = lshr i1085 %A, 289
  %21 = trunc i1085 %20 to i32
  %.9.cast = bitcast i32 %21 to float
  %.9 = insertvalue [32 x float] %.8, float %.9.cast, 9
  %22 = lshr i1085 %A, 321
  %23 = trunc i1085 %22 to i32
  %.10.cast = bitcast i32 %23 to float
  %.10 = insertvalue [32 x float] %.9, float %.10.cast, 10
  %24 = lshr i1085 %A, 353
  %25 = trunc i1085 %24 to i32
  %.11.cast = bitcast i32 %25 to float
  %.11 = insertvalue [32 x float] %.10, float %.11.cast, 11
  %26 = lshr i1085 %A, 385
  %27 = trunc i1085 %26 to i32
  %.12.cast = bitcast i32 %27 to float
  %.12 = insertvalue [32 x float] %.11, float %.12.cast, 12
  %28 = lshr i1085 %A, 417
  %29 = trunc i1085 %28 to i32
  %.13.cast = bitcast i32 %29 to float
  %.13 = insertvalue [32 x float] %.12, float %.13.cast, 13
  %30 = lshr i1085 %A, 449
  %31 = trunc i1085 %30 to i32
  %.14.cast = bitcast i32 %31 to float
  %.14 = insertvalue [32 x float] %.13, float %.14.cast, 14
  %32 = lshr i1085 %A, 481
  %33 = trunc i1085 %32 to i32
  %.15.cast = bitcast i32 %33 to float
  %.15 = insertvalue [32 x float] %.14, float %.15.cast, 15
  %34 = lshr i1085 %A, 513
  %35 = trunc i1085 %34 to i32
  %.16.cast = bitcast i32 %35 to float
  %.16 = insertvalue [32 x float] %.15, float %.16.cast, 16
  %36 = lshr i1085 %A, 545
  %37 = trunc i1085 %36 to i32
  %.17.cast = bitcast i32 %37 to float
  %.17 = insertvalue [32 x float] %.16, float %.17.cast, 17
  %38 = lshr i1085 %A, 577
  %39 = trunc i1085 %38 to i32
  %.18.cast = bitcast i32 %39 to float
  %.18 = insertvalue [32 x float] %.17, float %.18.cast, 18
  %40 = lshr i1085 %A, 609
  %41 = trunc i1085 %40 to i32
  %.19.cast = bitcast i32 %41 to float
  %.19 = insertvalue [32 x float] %.18, float %.19.cast, 19
  %42 = lshr i1085 %A, 641
  %43 = trunc i1085 %42 to i32
  %.20.cast = bitcast i32 %43 to float
  %.20 = insertvalue [32 x float] %.19, float %.20.cast, 20
  %44 = lshr i1085 %A, 673
  %45 = trunc i1085 %44 to i32
  %.21.cast = bitcast i32 %45 to float
  %.21 = insertvalue [32 x float] %.20, float %.21.cast, 21
  %46 = lshr i1085 %A, 705
  %47 = trunc i1085 %46 to i32
  %.22.cast = bitcast i32 %47 to float
  %.22 = insertvalue [32 x float] %.21, float %.22.cast, 22
  %48 = lshr i1085 %A, 737
  %49 = trunc i1085 %48 to i32
  %.23.cast = bitcast i32 %49 to float
  %.23 = insertvalue [32 x float] %.22, float %.23.cast, 23
  %50 = lshr i1085 %A, 769
  %51 = trunc i1085 %50 to i32
  %.24.cast = bitcast i32 %51 to float
  %.24 = insertvalue [32 x float] %.23, float %.24.cast, 24
  %52 = lshr i1085 %A, 801
  %53 = trunc i1085 %52 to i32
  %.25.cast = bitcast i32 %53 to float
  %.25 = insertvalue [32 x float] %.24, float %.25.cast, 25
  %54 = lshr i1085 %A, 833
  %55 = trunc i1085 %54 to i32
  %.26.cast = bitcast i32 %55 to float
  %.26 = insertvalue [32 x float] %.25, float %.26.cast, 26
  %56 = lshr i1085 %A, 865
  %57 = trunc i1085 %56 to i32
  %.27.cast = bitcast i32 %57 to float
  %.27 = insertvalue [32 x float] %.26, float %.27.cast, 27
  %58 = lshr i1085 %A, 897
  %59 = trunc i1085 %58 to i32
  %.28.cast = bitcast i32 %59 to float
  %.28 = insertvalue [32 x float] %.27, float %.28.cast, 28
  %60 = lshr i1085 %A, 929
  %61 = trunc i1085 %60 to i32
  %.29.cast = bitcast i32 %61 to float
  %.29 = insertvalue [32 x float] %.28, float %.29.cast, 29
  %62 = lshr i1085 %A, 961
  %63 = trunc i1085 %62 to i32
  %.30.cast = bitcast i32 %63 to float
  %.30 = insertvalue [32 x float] %.29, float %.30.cast, 30
  %64 = lshr i1085 %A, 993
  %65 = trunc i1085 %64 to i32
  %.31.cast = bitcast i32 %65 to float
  %.31 = insertvalue [32 x float] %.30, float %.31.cast, 31
  %66 = lshr i1085 %A, 1025
  %67 = trunc i1085 %66 to i60
  %.011 = insertvalue %"struct.ssdm_int<60, false>" undef, i60 %67, 0
  %.012 = insertvalue %"struct.ap_int_base<60, false>" undef, %"struct.ssdm_int<60, false>" %.011, 0
  %.013 = insertvalue %"struct.ap_uint<60>" undef, %"struct.ap_int_base<60, false>" %.012, 0
  %newret = insertvalue { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } undef, %"struct.ap_uint<1>" %.02, 0
  %newret2 = insertvalue { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } %newret, [32 x float] %.31, 1
  %newret4 = insertvalue { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } %newret2, %"struct.ap_uint<60>" %.013, 2
  ret { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } %newret4
}

; Function Attrs: alwaysinline nounwind readnone willreturn
define internal i1085 @"_llvm.fpga.pack.bits.i1085.s_class.hls::stream<VoxelData, 0>s"(%"class.hls::stream<VoxelData, 0>" %A) #9 {
  %A.0 = extractvalue %"class.hls::stream<VoxelData, 0>" %A, 0
  %A.0.0 = extractvalue %struct.VoxelData %A.0, 0
  %A.0.0.0 = extractvalue %"struct.ap_uint<1>" %A.0.0, 0
  %A.0.0.0.0 = extractvalue %"struct.ap_int_base<1, false>" %A.0.0.0, 0
  %A.0.0.0.0.0 = extractvalue %"struct.ssdm_int<1, false>" %A.0.0.0.0, 0
  %1 = zext i1 %A.0.0.0.0.0 to i1085
  %A.0.1 = extractvalue %struct.VoxelData %A.0, 1
  %A.0.1.0 = extractvalue [32 x float] %A.0.1, 0
  %A.0.1.0.cast = bitcast float %A.0.1.0 to i32
  %2 = zext i32 %A.0.1.0.cast to i1024
  %A.0.1.1 = extractvalue [32 x float] %A.0.1, 1
  %A.0.1.1.cast = bitcast float %A.0.1.1 to i32
  %3 = zext i32 %A.0.1.1.cast to i1024
  %4 = shl nuw nsw i1024 %3, 32
  %5 = or i1024 %4, %2
  %A.0.1.2 = extractvalue [32 x float] %A.0.1, 2
  %A.0.1.2.cast = bitcast float %A.0.1.2 to i32
  %6 = zext i32 %A.0.1.2.cast to i1024
  %7 = shl nuw nsw i1024 %6, 64
  %8 = or i1024 %5, %7
  %A.0.1.3 = extractvalue [32 x float] %A.0.1, 3
  %A.0.1.3.cast = bitcast float %A.0.1.3 to i32
  %9 = zext i32 %A.0.1.3.cast to i1024
  %10 = shl nuw nsw i1024 %9, 96
  %11 = or i1024 %8, %10
  %A.0.1.4 = extractvalue [32 x float] %A.0.1, 4
  %A.0.1.4.cast = bitcast float %A.0.1.4 to i32
  %12 = zext i32 %A.0.1.4.cast to i1024
  %13 = shl nuw nsw i1024 %12, 128
  %A.0.1.5 = extractvalue [32 x float] %A.0.1, 5
  %A.0.1.5.cast = bitcast float %A.0.1.5 to i32
  %14 = zext i32 %A.0.1.5.cast to i1024
  %15 = shl nuw nsw i1024 %14, 160
  %16 = or i1024 %11, %13
  %A.0.1.6 = extractvalue [32 x float] %A.0.1, 6
  %A.0.1.6.cast = bitcast float %A.0.1.6 to i32
  %17 = zext i32 %A.0.1.6.cast to i1024
  %18 = shl nuw nsw i1024 %17, 192
  %A.0.1.7 = extractvalue [32 x float] %A.0.1, 7
  %A.0.1.7.cast = bitcast float %A.0.1.7 to i32
  %19 = zext i32 %A.0.1.7.cast to i1024
  %20 = shl nuw nsw i1024 %19, 224
  %A.0.1.8 = extractvalue [32 x float] %A.0.1, 8
  %A.0.1.8.cast = bitcast float %A.0.1.8 to i32
  %21 = zext i32 %A.0.1.8.cast to i1024
  %22 = shl nuw nsw i1024 %21, 256
  %A.0.1.9 = extractvalue [32 x float] %A.0.1, 9
  %A.0.1.9.cast = bitcast float %A.0.1.9 to i32
  %23 = zext i32 %A.0.1.9.cast to i1024
  %24 = shl nuw nsw i1024 %23, 288
  %A.0.1.10 = extractvalue [32 x float] %A.0.1, 10
  %A.0.1.10.cast = bitcast float %A.0.1.10 to i32
  %25 = zext i32 %A.0.1.10.cast to i1024
  %26 = shl nuw nsw i1024 %25, 320
  %A.0.1.11 = extractvalue [32 x float] %A.0.1, 11
  %A.0.1.11.cast = bitcast float %A.0.1.11 to i32
  %27 = zext i32 %A.0.1.11.cast to i1024
  %28 = shl nuw nsw i1024 %27, 352
  %A.0.1.12 = extractvalue [32 x float] %A.0.1, 12
  %A.0.1.12.cast = bitcast float %A.0.1.12 to i32
  %29 = zext i32 %A.0.1.12.cast to i1024
  %30 = shl nuw nsw i1024 %29, 384
  %A.0.1.13 = extractvalue [32 x float] %A.0.1, 13
  %A.0.1.13.cast = bitcast float %A.0.1.13 to i32
  %31 = zext i32 %A.0.1.13.cast to i1024
  %32 = shl nuw nsw i1024 %31, 416
  %A.0.1.14 = extractvalue [32 x float] %A.0.1, 14
  %A.0.1.14.cast = bitcast float %A.0.1.14 to i32
  %33 = zext i32 %A.0.1.14.cast to i1024
  %34 = shl nuw nsw i1024 %33, 448
  %A.0.1.15 = extractvalue [32 x float] %A.0.1, 15
  %A.0.1.15.cast = bitcast float %A.0.1.15 to i32
  %35 = zext i32 %A.0.1.15.cast to i1024
  %36 = shl nuw nsw i1024 %35, 480
  %A.0.1.16 = extractvalue [32 x float] %A.0.1, 16
  %A.0.1.16.cast = bitcast float %A.0.1.16 to i32
  %37 = zext i32 %A.0.1.16.cast to i1024
  %38 = shl nuw nsw i1024 %37, 512
  %A.0.1.17 = extractvalue [32 x float] %A.0.1, 17
  %A.0.1.17.cast = bitcast float %A.0.1.17 to i32
  %39 = zext i32 %A.0.1.17.cast to i1024
  %40 = shl nuw nsw i1024 %39, 544
  %A.0.1.18 = extractvalue [32 x float] %A.0.1, 18
  %A.0.1.18.cast = bitcast float %A.0.1.18 to i32
  %41 = zext i32 %A.0.1.18.cast to i1024
  %42 = shl nuw nsw i1024 %41, 576
  %A.0.1.19 = extractvalue [32 x float] %A.0.1, 19
  %A.0.1.19.cast = bitcast float %A.0.1.19 to i32
  %43 = zext i32 %A.0.1.19.cast to i1024
  %44 = shl nuw nsw i1024 %43, 608
  %A.0.1.20 = extractvalue [32 x float] %A.0.1, 20
  %A.0.1.20.cast = bitcast float %A.0.1.20 to i32
  %45 = zext i32 %A.0.1.20.cast to i1024
  %46 = shl nuw nsw i1024 %45, 640
  %A.0.1.21 = extractvalue [32 x float] %A.0.1, 21
  %A.0.1.21.cast = bitcast float %A.0.1.21 to i32
  %47 = zext i32 %A.0.1.21.cast to i1024
  %48 = shl nuw nsw i1024 %47, 672
  %A.0.1.22 = extractvalue [32 x float] %A.0.1, 22
  %A.0.1.22.cast = bitcast float %A.0.1.22 to i32
  %49 = zext i32 %A.0.1.22.cast to i1024
  %50 = shl nuw nsw i1024 %49, 704
  %A.0.1.23 = extractvalue [32 x float] %A.0.1, 23
  %A.0.1.23.cast = bitcast float %A.0.1.23 to i32
  %51 = zext i32 %A.0.1.23.cast to i1024
  %52 = shl nuw nsw i1024 %51, 736
  %A.0.1.24 = extractvalue [32 x float] %A.0.1, 24
  %A.0.1.24.cast = bitcast float %A.0.1.24 to i32
  %53 = zext i32 %A.0.1.24.cast to i1024
  %54 = shl nuw nsw i1024 %53, 768
  %A.0.1.25 = extractvalue [32 x float] %A.0.1, 25
  %A.0.1.25.cast = bitcast float %A.0.1.25 to i32
  %55 = zext i32 %A.0.1.25.cast to i1024
  %56 = shl nuw nsw i1024 %55, 800
  %A.0.1.26 = extractvalue [32 x float] %A.0.1, 26
  %A.0.1.26.cast = bitcast float %A.0.1.26 to i32
  %57 = zext i32 %A.0.1.26.cast to i1024
  %58 = shl nuw nsw i1024 %57, 832
  %A.0.1.27 = extractvalue [32 x float] %A.0.1, 27
  %A.0.1.27.cast = bitcast float %A.0.1.27 to i32
  %59 = zext i32 %A.0.1.27.cast to i1024
  %60 = shl nuw nsw i1024 %59, 864
  %A.0.1.28 = extractvalue [32 x float] %A.0.1, 28
  %A.0.1.28.cast = bitcast float %A.0.1.28 to i32
  %61 = zext i32 %A.0.1.28.cast to i1024
  %62 = shl nuw nsw i1024 %61, 896
  %A.0.1.29 = extractvalue [32 x float] %A.0.1, 29
  %A.0.1.29.cast = bitcast float %A.0.1.29 to i32
  %63 = zext i32 %A.0.1.29.cast to i1024
  %64 = shl nuw nsw i1024 %63, 928
  %A.0.1.30 = extractvalue [32 x float] %A.0.1, 30
  %A.0.1.30.cast = bitcast float %A.0.1.30 to i32
  %65 = zext i32 %A.0.1.30.cast to i1024
  %66 = shl nuw nsw i1024 %65, 960
  %A.0.1.31 = extractvalue [32 x float] %A.0.1, 31
  %A.0.1.31.cast = bitcast float %A.0.1.31 to i32
  %67 = zext i32 %A.0.1.31.cast to i1024
  %68 = shl nuw i1024 %67, 992
  %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %16, %15
  %.masked2.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %18
  %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked2.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %20
  %.masked5.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %22
  %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked5.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %24
  %.masked7.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %26
  %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked7.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %28
  %.masked9.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %30
  %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked9.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %32
  %.masked11.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %34
  %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked11.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %36
  %.masked13.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %38
  %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked13.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %40
  %.masked15.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %42
  %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked15.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %44
  %.masked17.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked.masked, %46
  %.masked.masked.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked17.masked.masked.masked.masked.masked.masked.masked.masked.masked, %48
  %.masked19.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked.masked.masked, %50
  %.masked.masked.masked.masked.masked.masked.masked = or i1024 %.masked19.masked.masked.masked.masked.masked.masked.masked, %52
  %.masked21.masked.masked.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked.masked.masked, %54
  %.masked.masked.masked.masked.masked = or i1024 %.masked21.masked.masked.masked.masked.masked, %56
  %.masked23.masked.masked.masked = or i1024 %.masked.masked.masked.masked.masked, %58
  %.masked.masked.masked = or i1024 %.masked23.masked.masked.masked, %60
  %.masked25.masked = or i1024 %.masked.masked.masked, %62
  %.masked = or i1024 %.masked25.masked, %64
  %69 = or i1024 %.masked, %66
  %70 = or i1024 %69, %68
  %71 = zext i1024 %70 to i1085
  %72 = shl nuw nsw i1085 %71, 1
  %73 = or i1085 %72, %1
  %A.0.2 = extractvalue %struct.VoxelData %A.0, 2
  %A.0.2.0 = extractvalue %"struct.ap_uint<60>" %A.0.2, 0
  %A.0.2.0.0 = extractvalue %"struct.ap_int_base<60, false>" %A.0.2.0, 0
  %A.0.2.0.0.0 = extractvalue %"struct.ssdm_int<60, false>" %A.0.2.0.0, 0
  %74 = zext i60 %A.0.2.0.0.0 to i1085
  %75 = shl nuw i1085 %74, 1025
  %76 = or i1085 %73, %75
  ret i1085 %76
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>"([262144 x i32]* %dst, [262144 x %"struct.ap_uint<32>"]* readonly %src) unnamed_addr #4 {
entry:
  %0 = icmp eq [262144 x i32]* %dst, null
  %1 = icmp eq [262144 x %"struct.ap_uint<32>"]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a262144struct.ap_uint<32>.157"([262144 x i32]* nonnull %dst, [262144 x %"struct.ap_uint<32>"]* nonnull %src, i64 262144)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a262144struct.ap_uint<32>.157"([262144 x i32]* %dst, [262144 x %"struct.ap_uint<32>"]* readonly %src, i64 %num) local_unnamed_addr #5 {
entry:
  %0 = icmp eq [262144 x %"struct.ap_uint<32>"]* %src, null
  %1 = icmp eq [262144 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [262144 x %"struct.ap_uint<32>"], [262144 x %"struct.ap_uint<32>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [262144 x i32], [262144 x i32]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %4, i32* %3, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.169"([262144 x %"struct.ap_uint<32>"]* %dst, [262144 x i32]* readonly %src) unnamed_addr #4 {
entry:
  %0 = icmp eq [262144 x %"struct.ap_uint<32>"]* %dst, null
  %1 = icmp eq [262144 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a262144struct.ap_uint<32>.172"([262144 x %"struct.ap_uint<32>"]* nonnull %dst, [262144 x i32]* nonnull %src, i64 262144)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a262144struct.ap_uint<32>.172"([262144 x %"struct.ap_uint<32>"]* %dst, [262144 x i32]* readonly %src, i64 %num) local_unnamed_addr #5 {
entry:
  %0 = icmp eq [262144 x i32]* %src, null
  %1 = icmp eq [262144 x %"struct.ap_uint<32>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [262144 x i32], [262144 x i32]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [262144 x %"struct.ap_uint<32>"], [262144 x %"struct.ap_uint<32>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_minkowski_net_14_layer_pipeline_hw(i1085*, [5242880 x i32]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [262144 x i32]*, [262144 x i32]*, i512*, i512*, i512*, i512*, %struct.PrunedBitmapInfo*, i32*)

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_back(%"class.hls::stream<VoxelData, 0>"* "orig.arg.no"="0" "unpacked"="0", i1085* align 512 "orig.arg.no"="1" "unpacked"="1", [5242880 x %"struct.ap_uint<32>"]* "orig.arg.no"="2" "unpacked"="2", [5242880 x i32]* nocapture readonly "orig.arg.no"="3" "unpacked"="3.0", [14 x [27 x [1024 x [1024 x float]]]]* "orig.arg.no"="4" "unpacked"="4", [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.0" %_0, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.1" %_1, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.2" %_2, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.3" %_3, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.4" %_4, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.5" %_5, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.6" %_6, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.7" %_7, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.8" %_8, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.9" %_9, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.10" %_10, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.11" %_11, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.12" %_12, [27 x [1024 x [1024 x float]]]* readonly "orig.arg.no"="5" "unpacked"="5.13" %_13, [14 x [1024 x float]]* "orig.arg.no"="6" "unpacked"="6", [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.0" %_01, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.1" %_14, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.2" %_25, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.3" %_36, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.4" %_47, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.5" %_58, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.6" %_69, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.7" %_710, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.8" %_811, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.9" %_912, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.10" %_1013, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.11" %_1114, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.12" %_1215, [1024 x float]* readonly "orig.arg.no"="7" "unpacked"="7.13" %_1316, [262144 x %"struct.ap_uint<32>"]* "orig.arg.no"="8" "unpacked"="8", [262144 x i32]* readonly "orig.arg.no"="9" "unpacked"="9", [262144 x %"struct.ap_uint<32>"]* "orig.arg.no"="10" "unpacked"="10", [262144 x i32]* readonly "orig.arg.no"="11" "unpacked"="11", %"struct.ap_uint<512>"* "orig.arg.no"="12" "unpacked"="12", i512* noalias nocapture readonly align 512 "orig.arg.no"="13" "unpacked"="13.0", %"struct.ap_uint<512>"* "orig.arg.no"="14" "unpacked"="14", i512* noalias nocapture readonly align 512 "orig.arg.no"="15" "unpacked"="15.0", %"struct.ap_uint<512>"* "orig.arg.no"="16" "unpacked"="16", i512* noalias nocapture readonly align 512 "orig.arg.no"="17" "unpacked"="17.0", %"struct.ap_uint<512>"* "orig.arg.no"="18" "unpacked"="18", i512* noalias nocapture readonly align 512 "orig.arg.no"="19" "unpacked"="19.0", %struct.PrunedBitmapInfo* "orig.arg.no"="20" "unpacked"="20", %struct.PrunedBitmapInfo* readonly align 512 "orig.arg.no"="21" "unpacked"="21", %"struct.ap_uint<32>"* "orig.arg.no"="22" "unpacked"="22", i32* noalias nocapture readonly align 512 "orig.arg.no"="23" "unpacked"="23.0") #8 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>.141"(%"class.hls::stream<VoxelData, 0>"* %0, i1085* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<32>"([5242880 x %"struct.ap_uint<32>"]* %2, [5242880 x i32]* %3)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.169"([262144 x %"struct.ap_uint<32>"]* %6, [262144 x i32]* %7)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.169"([262144 x %"struct.ap_uint<32>"]* %8, [262144 x i32]* %9)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.78"(%"struct.ap_uint<512>"* %10, i512* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.78"(%"struct.ap_uint<512>"* %12, i512* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.78"(%"struct.ap_uint<512>"* %14, i512* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.78"(%"struct.ap_uint<512>"* %16, i512* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0struct.PrunedBitmapInfo(%struct.PrunedBitmapInfo* %18, %struct.PrunedBitmapInfo* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.64"(%"struct.ap_uint<32>"* %20, i32* align 512 %21)
  ret void
}

declare void @minkowski_net_14_layer_pipeline_hw_stub(%"class.hls::stream<VoxelData, 0>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, [27 x [1024 x [1024 x float]]]* noalias nocapture nonnull readonly, [1024 x float]* noalias nocapture nonnull readonly, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<512>"* noalias nonnull, %"struct.ap_uint<512>"* noalias nonnull, %"struct.ap_uint<512>"* noalias nonnull, %"struct.ap_uint<512>"* noalias nonnull, %struct.PrunedBitmapInfo* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull)

define void @minkowski_net_14_layer_pipeline_hw_stub_wrapper(i1085*, [5242880 x i32]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [27 x [1024 x [1024 x float]]]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [262144 x i32]*, [262144 x i32]*, i512*, i512*, i512*, i512*, %struct.PrunedBitmapInfo*, i32*) #10 {
entry:
  %38 = call i8* @malloc(i64 144)
  %39 = bitcast i8* %38 to %"class.hls::stream<VoxelData, 0>"*
  %40 = call i8* @malloc(i64 20971520)
  %41 = bitcast i8* %40 to [5242880 x %"struct.ap_uint<32>"]*
  %42 = call i8* @malloc(i64 1585446912)
  %43 = bitcast i8* %42 to [14 x [27 x [1024 x [1024 x float]]]]*
  %44 = call i8* @malloc(i64 57344)
  %45 = bitcast i8* %44 to [14 x [1024 x float]]*
  %46 = call i8* @malloc(i64 1048576)
  %47 = bitcast i8* %46 to [262144 x %"struct.ap_uint<32>"]*
  %48 = call i8* @malloc(i64 1048576)
  %49 = bitcast i8* %48 to [262144 x %"struct.ap_uint<32>"]*
  %50 = call i8* @malloc(i64 64)
  %51 = bitcast i8* %50 to %"struct.ap_uint<512>"*
  %52 = call i8* @malloc(i64 64)
  %53 = bitcast i8* %52 to %"struct.ap_uint<512>"*
  %54 = call i8* @malloc(i64 64)
  %55 = bitcast i8* %54 to %"struct.ap_uint<512>"*
  %56 = call i8* @malloc(i64 64)
  %57 = bitcast i8* %56 to %"struct.ap_uint<512>"*
  %58 = call i8* @malloc(i64 4)
  %59 = bitcast i8* %58 to %"struct.ap_uint<32>"*
  call void @copy_out(%"class.hls::stream<VoxelData, 0>"* %39, i1085* %0, [5242880 x %"struct.ap_uint<32>"]* %41, [5242880 x i32]* %1, [14 x [27 x [1024 x [1024 x float]]]]* %43, [27 x [1024 x [1024 x float]]]* %2, [27 x [1024 x [1024 x float]]]* %3, [27 x [1024 x [1024 x float]]]* %4, [27 x [1024 x [1024 x float]]]* %5, [27 x [1024 x [1024 x float]]]* %6, [27 x [1024 x [1024 x float]]]* %7, [27 x [1024 x [1024 x float]]]* %8, [27 x [1024 x [1024 x float]]]* %9, [27 x [1024 x [1024 x float]]]* %10, [27 x [1024 x [1024 x float]]]* %11, [27 x [1024 x [1024 x float]]]* %12, [27 x [1024 x [1024 x float]]]* %13, [27 x [1024 x [1024 x float]]]* %14, [27 x [1024 x [1024 x float]]]* %15, [14 x [1024 x float]]* %45, [1024 x float]* %16, [1024 x float]* %17, [1024 x float]* %18, [1024 x float]* %19, [1024 x float]* %20, [1024 x float]* %21, [1024 x float]* %22, [1024 x float]* %23, [1024 x float]* %24, [1024 x float]* %25, [1024 x float]* %26, [1024 x float]* %27, [1024 x float]* %28, [1024 x float]* %29, [262144 x %"struct.ap_uint<32>"]* %47, [262144 x i32]* %30, [262144 x %"struct.ap_uint<32>"]* %49, [262144 x i32]* %31, %"struct.ap_uint<512>"* %51, i512* %32, %"struct.ap_uint<512>"* %53, i512* %33, %"struct.ap_uint<512>"* %55, i512* %34, %"struct.ap_uint<512>"* %57, i512* %35, %struct.PrunedBitmapInfo* null, %struct.PrunedBitmapInfo* %36, %"struct.ap_uint<32>"* %59, i32* %37)
  %60 = bitcast [5242880 x %"struct.ap_uint<32>"]* %41 to %"struct.ap_uint<32>"*
  %61 = bitcast [14 x [27 x [1024 x [1024 x float]]]]* %43 to [27 x [1024 x [1024 x float]]]*
  %62 = bitcast [14 x [1024 x float]]* %45 to [1024 x float]*
  %63 = bitcast [262144 x %"struct.ap_uint<32>"]* %47 to %"struct.ap_uint<32>"*
  %64 = bitcast [262144 x %"struct.ap_uint<32>"]* %49 to %"struct.ap_uint<32>"*
  call void @minkowski_net_14_layer_pipeline_hw_stub(%"class.hls::stream<VoxelData, 0>"* %39, %"struct.ap_uint<32>"* %60, [27 x [1024 x [1024 x float]]]* %61, [1024 x float]* %62, %"struct.ap_uint<32>"* %63, %"struct.ap_uint<32>"* %64, %"struct.ap_uint<512>"* %51, %"struct.ap_uint<512>"* %53, %"struct.ap_uint<512>"* %55, %"struct.ap_uint<512>"* %57, %struct.PrunedBitmapInfo* %36, %"struct.ap_uint<32>"* %59)
  call void @copy_in(%"class.hls::stream<VoxelData, 0>"* %39, i1085* %0, [5242880 x %"struct.ap_uint<32>"]* %41, [5242880 x i32]* %1, [14 x [27 x [1024 x [1024 x float]]]]* %43, [27 x [1024 x [1024 x float]]]* %2, [27 x [1024 x [1024 x float]]]* %3, [27 x [1024 x [1024 x float]]]* %4, [27 x [1024 x [1024 x float]]]* %5, [27 x [1024 x [1024 x float]]]* %6, [27 x [1024 x [1024 x float]]]* %7, [27 x [1024 x [1024 x float]]]* %8, [27 x [1024 x [1024 x float]]]* %9, [27 x [1024 x [1024 x float]]]* %10, [27 x [1024 x [1024 x float]]]* %11, [27 x [1024 x [1024 x float]]]* %12, [27 x [1024 x [1024 x float]]]* %13, [27 x [1024 x [1024 x float]]]* %14, [27 x [1024 x [1024 x float]]]* %15, [14 x [1024 x float]]* %45, [1024 x float]* %16, [1024 x float]* %17, [1024 x float]* %18, [1024 x float]* %19, [1024 x float]* %20, [1024 x float]* %21, [1024 x float]* %22, [1024 x float]* %23, [1024 x float]* %24, [1024 x float]* %25, [1024 x float]* %26, [1024 x float]* %27, [1024 x float]* %28, [1024 x float]* %29, [262144 x %"struct.ap_uint<32>"]* %47, [262144 x i32]* %30, [262144 x %"struct.ap_uint<32>"]* %49, [262144 x i32]* %31, %"struct.ap_uint<512>"* %51, i512* %32, %"struct.ap_uint<512>"* %53, i512* %33, %"struct.ap_uint<512>"* %55, i512* %34, %"struct.ap_uint<512>"* %57, i512* %35, %struct.PrunedBitmapInfo* null, %struct.PrunedBitmapInfo* %36, %"struct.ap_uint<32>"* %59, i32* %37)
  call void @free(i8* %38)
  call void @free(i8* %40)
  call void @free(i8* %42)
  call void @free(i8* %44)
  call void @free(i8* %46)
  call void @free(i8* %48)
  call void @free(i8* %50)
  call void @free(i8* %52)
  call void @free(i8* %54)
  call void @free(i8* %56)
  call void @free(i8* %58)
  ret void
}

declare i1 @fpga_fifo_not_empty_144(i8*)

declare i1 @fpga_fifo_not_empty_256(i8*)

declare void @fpga_fifo_pop_144(i8*, i8*)

declare void @fpga_fifo_pop_256(i8*, i8*)

declare void @fpga_fifo_push_144(i8*, i8*)

declare void @fpga_fifo_push_256(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind willreturn }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #5 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #6 = { nounwind willreturn }
attributes #7 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #8 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #9 = { alwaysinline nounwind readnone willreturn }
attributes #10 = { "fpga.wrapper.func"="stub" }
attributes #11 = { inaccessiblememonly nounwind willreturn "xlx.port.bitwidth"="2048" "xlx.source"="user" }
attributes #12 = { inaccessiblememonly nounwind willreturn "xlx.source"="infer-from-pragma" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}
!datalayout.transforms.on.top = !{!5, !25}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !{!6, !8, !10}
!6 = !{!7}
!7 = !{!"2", [14 x [27 x [1024 x [1024 x float]]]]* null}
!8 = !{!9}
!9 = !{!"array_partition", !"type=Complete", !"dim=1"}
!10 = !{!11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24}
!11 = !{!"2.0", [27 x [1024 x [1024 x float]]]* null}
!12 = !{!"2.1", [27 x [1024 x [1024 x float]]]* null}
!13 = !{!"2.2", [27 x [1024 x [1024 x float]]]* null}
!14 = !{!"2.3", [27 x [1024 x [1024 x float]]]* null}
!15 = !{!"2.4", [27 x [1024 x [1024 x float]]]* null}
!16 = !{!"2.5", [27 x [1024 x [1024 x float]]]* null}
!17 = !{!"2.6", [27 x [1024 x [1024 x float]]]* null}
!18 = !{!"2.7", [27 x [1024 x [1024 x float]]]* null}
!19 = !{!"2.8", [27 x [1024 x [1024 x float]]]* null}
!20 = !{!"2.9", [27 x [1024 x [1024 x float]]]* null}
!21 = !{!"2.10", [27 x [1024 x [1024 x float]]]* null}
!22 = !{!"2.11", [27 x [1024 x [1024 x float]]]* null}
!23 = !{!"2.12", [27 x [1024 x [1024 x float]]]* null}
!24 = !{!"2.13", [27 x [1024 x [1024 x float]]]* null}
!25 = !{!26, !8, !28}
!26 = !{!27}
!27 = !{!"3", [14 x [1024 x float]]* null}
!28 = !{!29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42}
!29 = !{!"3.0", [1024 x float]* null}
!30 = !{!"3.1", [1024 x float]* null}
!31 = !{!"3.2", [1024 x float]* null}
!32 = !{!"3.3", [1024 x float]* null}
!33 = !{!"3.4", [1024 x float]* null}
!34 = !{!"3.5", [1024 x float]* null}
!35 = !{!"3.6", [1024 x float]* null}
!36 = !{!"3.7", [1024 x float]* null}
!37 = !{!"3.8", [1024 x float]* null}
!38 = !{!"3.9", [1024 x float]* null}
!39 = !{!"3.10", [1024 x float]* null}
!40 = !{!"3.11", [1024 x float]* null}
!41 = !{!"3.12", [1024 x float]* null}
!42 = !{!"3.13", [1024 x float]* null}
!43 = !DILocation(line: 49, column: 9, scope: !44)
!44 = distinct !DISubprogram(name: "minkowski_net_14_layer_pipeline", linkageName: "_Z31minkowski_net_14_layer_pipelineRN3hls6streamI9VoxelDataLi0EEEP7ap_uintILi32EEPA27_A1024_A1024_fPS7_S6_S6_PS4_ILi512EESD_SD_SD_R16PrunedBitmapInfoRS5_", scope: !45, file: !45, line: 17, type: !46, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !291, variables: !4)
!45 = !DIFile(filename: "minkowski_net.cpp", directory: "/home/robin/Desktop/ocnn-project")
!46 = !DISubroutineType(types: !47)
!47 = !{null, !48, !179, !227, !232, !179, !179, !235, !235, !235, !235, !283, !223}
!48 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "stream<VoxelData, 0>", scope: !51, file: !50, line: 53, size: 1152, flags: DIFlagTypePassByReference, elements: !52, templateParams: !176, identifier: "_ZTSN3hls6streamI9VoxelDataLi0EEE")
!50 = !DIFile(filename: "/tools/Xilinx/Vitis/2024.2/common/technology/autopilot/hls_stream_39.h", directory: "/home/robin/Desktop/ocnn-project")
!51 = !DINamespace(name: "hls", scope: null)
!52 = !{!53, !169}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !49, file: !50, line: 155, baseType: !54, size: 1152, flags: DIFlagPublic)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "VoxelData", file: !55, line: 99, size: 1152, flags: DIFlagTypePassByValue, elements: !56, identifier: "_ZTS9VoxelData")
!55 = !DIFile(filename: "./octree_master.h", directory: "/home/robin/Desktop/ocnn-project")
!56 = !{!57, !117, !121}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "occupancy", scope: !54, file: !55, line: 101, baseType: !58, size: 8)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_uint<1>", file: !59, line: 183, size: 8, flags: DIFlagTypePassByValue, elements: !60, templateParams: !116, identifier: "_ZTS7ap_uintILi1EE")
!59 = !DIFile(filename: "/tools/Xilinx/Vitis/2024.2/common/technology/autopilot/ap_int.h", directory: "/home/robin/Desktop/ocnn-project")
!60 = !{!61, !96, !101, !105, !110}
!61 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !58, baseType: !62)
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<1, false>", file: !63, line: 124, size: 8, flags: DIFlagTypePassByValue, elements: !64, templateParams: !94, identifier: "_ZTS11ap_int_baseILi1ELb0EE")
!63 = !DIFile(filename: "/tools/Xilinx/Vitis/2024.2/common/technology/autopilot/etc/ap_int_base.h", directory: "/home/robin/Desktop/ocnn-project")
!64 = !{!65, !83, !85, !87}
!65 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !62, baseType: !66)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<1, false>", file: !67, line: 519, size: 8, flags: DIFlagTypePassByValue, elements: !68, templateParams: !78, identifier: "_ZTS8ssdm_intILi1ELb0EE")
!67 = !DIFile(filename: "/tools/Xilinx/Vitis/2024.2/common/technology/autopilot/etc/ap_common.h", directory: "/home/robin/Desktop/ocnn-project")
!68 = !{!69, !71, !75}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !66, file: !67, line: 521, baseType: !70, size: 1, align: 8)
!70 = !DIBasicType(name: "uint1", size: 1, encoding: DW_ATE_unsigned)
!71 = !DISubprogram(name: "ssdm_int", scope: !66, file: !67, line: 522, type: !72, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DISubroutineType(types: !73)
!73 = !{null, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!75 = !DISubprogram(name: "ssdm_int", scope: !66, file: !67, line: 523, type: !76, isLocal: false, isDefinition: false, scopeLine: 523, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DISubroutineType(types: !77)
!77 = !{null, !74, !70}
!78 = !{!79, !81}
!79 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 1)
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DITemplateValueParameter(name: "_AP_S", type: !82, value: i8 0)
!82 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !62, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 1)
!84 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !80)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !62, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 false)
!86 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !82)
!87 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi1ELb0EEaSERKS0_", scope: !62, file: !63, line: 479, type: !88, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !91, !92}
!90 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !62, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!92 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !62)
!94 = !{!95, !81}
!95 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 1)
!96 = !DISubprogram(name: "ap_uint", scope: !58, file: !59, line: 298, type: !97, isLocal: false, isDefinition: false, scopeLine: 298, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DISubroutineType(types: !98)
!98 = !{null, !99, !100}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!100 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!101 = !DISubprogram(name: "ap_uint", scope: !58, file: !59, line: 299, type: !102, isLocal: false, isDefinition: false, scopeLine: 299, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DISubroutineType(types: !103)
!103 = !{null, !99, !104}
!104 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!105 = !DISubprogram(name: "ap_uint", scope: !58, file: !59, line: 300, type: !106, isLocal: false, isDefinition: false, scopeLine: 300, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DISubroutineType(types: !107)
!107 = !{null, !99, !108}
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "half", file: !67, line: 613, baseType: !109)
!109 = !DIBasicType(name: "__fp16", size: 16, encoding: DW_ATE_float)
!110 = !DISubprogram(name: "operator=", linkageName: "_ZN7ap_uintILi1EEaSERKS0_", scope: !58, file: !59, line: 311, type: !111, isLocal: false, isDefinition: false, scopeLine: 311, flags: DIFlagPrototyped, isOptimized: false)
!111 = !DISubroutineType(types: !112)
!112 = !{!113, !99, !114}
!113 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !58, size: 64)
!114 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!116 = !{!95}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "features", scope: !54, file: !55, line: 102, baseType: !118, size: 1024, offset: 32)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 1024, elements: !119)
!119 = !{!120}
!120 = !DISubrange(count: 32)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "morton_addr", scope: !54, file: !55, line: 103, baseType: !122, size: 64, offset: 1088)
!122 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_uint<60>", file: !59, line: 183, size: 64, flags: DIFlagTypePassByValue, elements: !123, templateParams: !168, identifier: "_ZTS7ap_uintILi60EE")
!123 = !{!124, !152, !156, !159, !162}
!124 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !122, baseType: !125)
!125 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<60, false>", file: !63, line: 124, size: 64, flags: DIFlagTypePassByValue, elements: !126, templateParams: !150, identifier: "_ZTS11ap_int_baseILi60ELb0EE")
!126 = !{!127, !141, !142, !143}
!127 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !125, baseType: !128)
!128 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<60, false>", file: !67, line: 519, size: 64, flags: DIFlagTypePassByValue, elements: !129, templateParams: !139, identifier: "_ZTS8ssdm_intILi60ELb0EE")
!129 = !{!130, !132, !136}
!130 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !128, file: !67, line: 521, baseType: !131, size: 60, align: 64)
!131 = !DIBasicType(name: "uint60", size: 60, encoding: DW_ATE_unsigned)
!132 = !DISubprogram(name: "ssdm_int", scope: !128, file: !67, line: 522, type: !133, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DISubroutineType(types: !134)
!134 = !{null, !135}
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!136 = !DISubprogram(name: "ssdm_int", scope: !128, file: !67, line: 523, type: !137, isLocal: false, isDefinition: false, scopeLine: 523, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DISubroutineType(types: !138)
!138 = !{null, !135, !131}
!139 = !{!140, !81}
!140 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 60)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !125, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 60)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !125, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 false)
!143 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi60ELb0EEaSERKS0_", scope: !125, file: !63, line: 479, type: !144, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DISubroutineType(types: !145)
!145 = !{!146, !147, !148}
!146 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !125, size: 64)
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!148 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !149, size: 64)
!149 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !125)
!150 = !{!151, !81}
!151 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 60)
!152 = !DISubprogram(name: "ap_uint", scope: !122, file: !59, line: 298, type: !153, isLocal: false, isDefinition: false, scopeLine: 298, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{null, !155, !100}
!155 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!156 = !DISubprogram(name: "ap_uint", scope: !122, file: !59, line: 299, type: !157, isLocal: false, isDefinition: false, scopeLine: 299, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DISubroutineType(types: !158)
!158 = !{null, !155, !104}
!159 = !DISubprogram(name: "ap_uint", scope: !122, file: !59, line: 300, type: !160, isLocal: false, isDefinition: false, scopeLine: 300, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DISubroutineType(types: !161)
!161 = !{null, !155, !108}
!162 = !DISubprogram(name: "operator=", linkageName: "_ZN7ap_uintILi60EEaSERKS0_", scope: !122, file: !59, line: 311, type: !163, isLocal: false, isDefinition: false, scopeLine: 311, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DISubroutineType(types: !164)
!164 = !{!165, !155, !166}
!165 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !122, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !167, size: 64)
!167 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !122)
!168 = !{!151}
!169 = !DISubprogram(name: "set_name", linkageName: "_ZN3hls6streamI9VoxelDataLi0EE8set_nameEPKc", scope: !49, file: !50, line: 152, type: !170, isLocal: false, isDefinition: false, scopeLine: 152, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!170 = !DISubroutineType(types: !171)
!171 = !{null, !172, !173}
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!173 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!174 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !175)
!175 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!176 = !{!177, !178}
!177 = !DITemplateTypeParameter(name: "__STREAM_T__", type: !54)
!178 = !DITemplateValueParameter(name: "DEPTH", type: !80, value: i32 0)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64)
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_uint<32>", file: !59, line: 183, size: 32, flags: DIFlagTypePassByValue, elements: !181, templateParams: !226, identifier: "_ZTS7ap_uintILi32EE")
!181 = !{!182, !210, !214, !217, !220}
!182 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !180, baseType: !183)
!183 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<32, false>", file: !63, line: 124, size: 32, flags: DIFlagTypePassByValue, elements: !184, templateParams: !208, identifier: "_ZTS11ap_int_baseILi32ELb0EE")
!184 = !{!185, !199, !200, !201}
!185 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !183, baseType: !186)
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<32, false>", file: !67, line: 519, size: 32, flags: DIFlagTypePassByValue, elements: !187, templateParams: !197, identifier: "_ZTS8ssdm_intILi32ELb0EE")
!187 = !{!188, !190, !194}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !186, file: !67, line: 521, baseType: !189, size: 32)
!189 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!190 = !DISubprogram(name: "ssdm_int", scope: !186, file: !67, line: 522, type: !191, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DISubroutineType(types: !192)
!192 = !{null, !193}
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!194 = !DISubprogram(name: "ssdm_int", scope: !186, file: !67, line: 523, type: !195, isLocal: false, isDefinition: false, scopeLine: 523, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DISubroutineType(types: !196)
!196 = !{null, !193, !189}
!197 = !{!198, !81}
!198 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 32)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !183, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 32)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !183, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 false)
!201 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi32ELb0EEaSERKS0_", scope: !183, file: !63, line: 479, type: !202, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DISubroutineType(types: !203)
!203 = !{!204, !205, !206}
!204 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !183, size: 64)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!206 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !207, size: 64)
!207 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !183)
!208 = !{!209, !81}
!209 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 32)
!210 = !DISubprogram(name: "ap_uint", scope: !180, file: !59, line: 298, type: !211, isLocal: false, isDefinition: false, scopeLine: 298, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DISubroutineType(types: !212)
!212 = !{null, !213, !100}
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!214 = !DISubprogram(name: "ap_uint", scope: !180, file: !59, line: 299, type: !215, isLocal: false, isDefinition: false, scopeLine: 299, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DISubroutineType(types: !216)
!216 = !{null, !213, !104}
!217 = !DISubprogram(name: "ap_uint", scope: !180, file: !59, line: 300, type: !218, isLocal: false, isDefinition: false, scopeLine: 300, flags: DIFlagPrototyped, isOptimized: false)
!218 = !DISubroutineType(types: !219)
!219 = !{null, !213, !108}
!220 = !DISubprogram(name: "operator=", linkageName: "_ZN7ap_uintILi32EEaSERKS0_", scope: !180, file: !59, line: 311, type: !221, isLocal: false, isDefinition: false, scopeLine: 311, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DISubroutineType(types: !222)
!222 = !{!223, !213, !224}
!223 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !180, size: 64)
!224 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !180)
!226 = !{!209}
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!228 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 905969664, elements: !229)
!229 = !{!230, !231, !231}
!230 = !DISubrange(count: 27)
!231 = !DISubrange(count: 1024)
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !233, size: 64)
!233 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 32768, elements: !234)
!234 = !{!231}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_uint<512>", file: !59, line: 183, size: 512, flags: DIFlagTypePassByValue, elements: !237, templateParams: !282, identifier: "_ZTS7ap_uintILi512EE")
!237 = !{!238, !266, !270, !273, !276}
!238 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !236, baseType: !239)
!239 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<512, false>", file: !63, line: 124, size: 512, flags: DIFlagTypePassByValue, elements: !240, templateParams: !264, identifier: "_ZTS11ap_int_baseILi512ELb0EE")
!240 = !{!241, !255, !256, !257}
!241 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !239, baseType: !242)
!242 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<512, false>", file: !67, line: 519, size: 512, flags: DIFlagTypePassByValue, elements: !243, templateParams: !253, identifier: "_ZTS8ssdm_intILi512ELb0EE")
!243 = !{!244, !246, !250}
!244 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !242, file: !67, line: 521, baseType: !245, size: 512, align: 512)
!245 = !DIBasicType(name: "uint512", size: 512, encoding: DW_ATE_unsigned)
!246 = !DISubprogram(name: "ssdm_int", scope: !242, file: !67, line: 522, type: !247, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DISubroutineType(types: !248)
!248 = !{null, !249}
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!250 = !DISubprogram(name: "ssdm_int", scope: !242, file: !67, line: 523, type: !251, isLocal: false, isDefinition: false, scopeLine: 523, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DISubroutineType(types: !252)
!252 = !{null, !249, !245}
!253 = !{!254, !81}
!254 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 512)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !239, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 512)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !239, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 false)
!257 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi512ELb0EEaSERKS0_", scope: !239, file: !63, line: 479, type: !258, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DISubroutineType(types: !259)
!259 = !{!260, !261, !262}
!260 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !239, size: 64)
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !239, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!262 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !263, size: 64)
!263 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !239)
!264 = !{!265, !81}
!265 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 512)
!266 = !DISubprogram(name: "ap_uint", scope: !236, file: !59, line: 298, type: !267, isLocal: false, isDefinition: false, scopeLine: 298, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DISubroutineType(types: !268)
!268 = !{null, !269, !100}
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!270 = !DISubprogram(name: "ap_uint", scope: !236, file: !59, line: 299, type: !271, isLocal: false, isDefinition: false, scopeLine: 299, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DISubroutineType(types: !272)
!272 = !{null, !269, !104}
!273 = !DISubprogram(name: "ap_uint", scope: !236, file: !59, line: 300, type: !274, isLocal: false, isDefinition: false, scopeLine: 300, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DISubroutineType(types: !275)
!275 = !{null, !269, !108}
!276 = !DISubprogram(name: "operator=", linkageName: "_ZN7ap_uintILi512EEaSERKS0_", scope: !236, file: !59, line: 311, type: !277, isLocal: false, isDefinition: false, scopeLine: 311, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DISubroutineType(types: !278)
!278 = !{!279, !269, !280}
!279 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !236, size: 64)
!280 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !281, size: 64)
!281 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !236)
!282 = !{!265}
!283 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !284, size: 64)
!284 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "PrunedBitmapInfo", file: !55, line: 81, size: 160, flags: DIFlagTypePassByValue, elements: !285, identifier: "_ZTS16PrunedBitmapInfo")
!285 = !{!286, !287, !288, !289, !290}
!286 = !DIDerivedType(tag: DW_TAG_member, name: "L3_size", scope: !284, file: !55, line: 84, baseType: !180, size: 32)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "L2_size", scope: !284, file: !55, line: 87, baseType: !180, size: 32, offset: 32)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "L1_size", scope: !284, file: !55, line: 90, baseType: !180, size: 32, offset: 64)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "L0_size", scope: !284, file: !55, line: 92, baseType: !180, size: 32, offset: 96)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "total_size", scope: !284, file: !55, line: 93, baseType: !180, size: 32, offset: 128)
!291 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !292, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !293, globals: !470)
!292 = !DIFile(filename: "/home/robin/Desktop/ocnn-project/minkowski_net/solution1/.autopilot/db/minkowski_net.pp.0.cpp", directory: "/home/robin/Desktop/ocnn-project")
!293 = !{!179, !294, !295, !322, !349, !376, !401, !428, !62, !436, !463, !183}
!294 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!295 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<21, false>", file: !63, line: 124, size: 32, flags: DIFlagTypePassByValue, elements: !296, templateParams: !320, identifier: "_ZTS11ap_int_baseILi21ELb0EE")
!296 = !{!297, !311, !312, !313}
!297 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !295, baseType: !298)
!298 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<21, false>", file: !67, line: 519, size: 32, flags: DIFlagTypePassByValue, elements: !299, templateParams: !309, identifier: "_ZTS8ssdm_intILi21ELb0EE")
!299 = !{!300, !302, !306}
!300 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !298, file: !67, line: 521, baseType: !301, size: 21, align: 32)
!301 = !DIBasicType(name: "uint21", size: 21, encoding: DW_ATE_unsigned)
!302 = !DISubprogram(name: "ssdm_int", scope: !298, file: !67, line: 522, type: !303, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DISubroutineType(types: !304)
!304 = !{null, !305}
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !298, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!306 = !DISubprogram(name: "ssdm_int", scope: !298, file: !67, line: 523, type: !307, isLocal: false, isDefinition: false, scopeLine: 523, flags: DIFlagPrototyped, isOptimized: false)
!307 = !DISubroutineType(types: !308)
!308 = !{null, !305, !301}
!309 = !{!310, !81}
!310 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 21)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !295, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 21)
!312 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !295, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 false)
!313 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi21ELb0EEaSERKS0_", scope: !295, file: !63, line: 479, type: !314, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DISubroutineType(types: !315)
!315 = !{!316, !317, !318}
!316 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !295, size: 64)
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!318 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !319, size: 64)
!319 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !295)
!320 = !{!321, !81}
!321 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 21)
!322 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<64, false>", file: !63, line: 124, size: 64, flags: DIFlagTypePassByValue, elements: !323, templateParams: !347, identifier: "_ZTS11ap_int_baseILi64ELb0EE")
!323 = !{!324, !338, !339, !340}
!324 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !322, baseType: !325)
!325 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<64, false>", file: !67, line: 519, size: 64, flags: DIFlagTypePassByValue, elements: !326, templateParams: !336, identifier: "_ZTS8ssdm_intILi64ELb0EE")
!326 = !{!327, !329, !333}
!327 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !325, file: !67, line: 521, baseType: !328, size: 64)
!328 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!329 = !DISubprogram(name: "ssdm_int", scope: !325, file: !67, line: 522, type: !330, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{null, !332}
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!333 = !DISubprogram(name: "ssdm_int", scope: !325, file: !67, line: 523, type: !334, isLocal: false, isDefinition: false, scopeLine: 523, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{null, !332, !328}
!336 = !{!337, !81}
!337 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 64)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !322, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 64)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !322, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 false)
!340 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi64ELb0EEaSERKS0_", scope: !322, file: !63, line: 479, type: !341, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{!343, !344, !345}
!343 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !322, size: 64)
!344 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !322, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!345 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !346, size: 64)
!346 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !322)
!347 = !{!348, !81}
!348 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 64)
!349 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<20, false>", file: !63, line: 124, size: 32, flags: DIFlagTypePassByValue, elements: !350, templateParams: !374, identifier: "_ZTS11ap_int_baseILi20ELb0EE")
!350 = !{!351, !365, !366, !367}
!351 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !349, baseType: !352)
!352 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<20, false>", file: !67, line: 519, size: 32, flags: DIFlagTypePassByValue, elements: !353, templateParams: !363, identifier: "_ZTS8ssdm_intILi20ELb0EE")
!353 = !{!354, !356, !360}
!354 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !352, file: !67, line: 521, baseType: !355, size: 20, align: 32)
!355 = !DIBasicType(name: "uint20", size: 20, encoding: DW_ATE_unsigned)
!356 = !DISubprogram(name: "ssdm_int", scope: !352, file: !67, line: 522, type: !357, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{null, !359}
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !352, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!360 = !DISubprogram(name: "ssdm_int", scope: !352, file: !67, line: 523, type: !361, isLocal: false, isDefinition: false, scopeLine: 523, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DISubroutineType(types: !362)
!362 = !{null, !359, !355}
!363 = !{!364, !81}
!364 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 20)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !349, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 20)
!366 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !349, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 false)
!367 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi20ELb0EEaSERKS0_", scope: !349, file: !63, line: 479, type: !368, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!368 = !DISubroutineType(types: !369)
!369 = !{!370, !371, !372}
!370 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !349, size: 64)
!371 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !349, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!372 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !373, size: 64)
!373 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !349)
!374 = !{!375, !81}
!375 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 20)
!376 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<32, true>", file: !63, line: 124, size: 32, flags: DIFlagTypePassByValue, elements: !377, templateParams: !400, identifier: "_ZTS11ap_int_baseILi32ELb1EE")
!377 = !{!378, !391, !392, !393}
!378 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !376, baseType: !379)
!379 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<32, true>", file: !67, line: 511, size: 32, flags: DIFlagTypePassByValue, elements: !380, templateParams: !389, identifier: "_ZTS8ssdm_intILi32ELb1EE")
!380 = !{!381, !382, !386}
!381 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !379, file: !67, line: 513, baseType: !80, size: 32)
!382 = !DISubprogram(name: "ssdm_int", scope: !379, file: !67, line: 514, type: !383, isLocal: false, isDefinition: false, scopeLine: 514, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DISubroutineType(types: !384)
!384 = !{null, !385}
!385 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !379, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!386 = !DISubprogram(name: "ssdm_int", scope: !379, file: !67, line: 515, type: !387, isLocal: false, isDefinition: false, scopeLine: 515, flags: DIFlagPrototyped, isOptimized: false)
!387 = !DISubroutineType(types: !388)
!388 = !{null, !385, !80}
!389 = !{!198, !390}
!390 = !DITemplateValueParameter(name: "_AP_S", type: !82, value: i8 1)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !376, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 32)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !376, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 true)
!393 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi32ELb1EEaSERKS0_", scope: !376, file: !63, line: 479, type: !394, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!394 = !DISubroutineType(types: !395)
!395 = !{!396, !397, !398}
!396 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !376, size: 64)
!397 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !376, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!398 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !399, size: 64)
!399 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !376)
!400 = !{!209, !390}
!401 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<65, true>", file: !63, line: 124, size: 128, flags: DIFlagTypePassByValue, elements: !402, templateParams: !426, identifier: "_ZTS11ap_int_baseILi65ELb1EE")
!402 = !{!403, !417, !418, !419}
!403 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !401, baseType: !404)
!404 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<65, true>", file: !67, line: 511, size: 128, flags: DIFlagTypePassByValue, elements: !405, templateParams: !415, identifier: "_ZTS8ssdm_intILi65ELb1EE")
!405 = !{!406, !408, !412}
!406 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !404, file: !67, line: 513, baseType: !407, size: 65, align: 128)
!407 = !DIBasicType(name: "int65", size: 65, encoding: DW_ATE_signed)
!408 = !DISubprogram(name: "ssdm_int", scope: !404, file: !67, line: 514, type: !409, isLocal: false, isDefinition: false, scopeLine: 514, flags: DIFlagPrototyped, isOptimized: false)
!409 = !DISubroutineType(types: !410)
!410 = !{null, !411}
!411 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !404, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!412 = !DISubprogram(name: "ssdm_int", scope: !404, file: !67, line: 515, type: !413, isLocal: false, isDefinition: false, scopeLine: 515, flags: DIFlagPrototyped, isOptimized: false)
!413 = !DISubroutineType(types: !414)
!414 = !{null, !411, !407}
!415 = !{!416, !390}
!416 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 65)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !401, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 65)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !401, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 true)
!419 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi65ELb1EEaSERKS0_", scope: !401, file: !63, line: 479, type: !420, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!420 = !DISubroutineType(types: !421)
!421 = !{!422, !423, !424}
!422 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !401, size: 64)
!423 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !401, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!424 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !425, size: 64)
!425 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !401)
!426 = !{!427, !390}
!427 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 65)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "RetType", scope: !183, file: !63, line: 146, baseType: !429)
!429 = !DIDerivedType(tag: DW_TAG_typedef, name: "Type", scope: !430, file: !63, line: 67, baseType: !433)
!430 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "retval<8, false>", file: !63, line: 66, size: 8, flags: DIFlagTypePassByValue, elements: !4, templateParams: !431, identifier: "_ZTS6retvalILi8ELb0EE")
!431 = !{!432, !81}
!432 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 8)
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "ap_ulong", file: !434, line: 188, baseType: !435)
!434 = !DIFile(filename: "/tools/Xilinx/Vitis/2024.2/common/technology/autopilot/etc/ap_decl.h", directory: "/home/robin/Desktop/ocnn-project")
!435 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!436 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<34, true>", file: !63, line: 124, size: 64, flags: DIFlagTypePassByValue, elements: !437, templateParams: !461, identifier: "_ZTS11ap_int_baseILi34ELb1EE")
!437 = !{!438, !452, !453, !454}
!438 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !436, baseType: !439)
!439 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<34, true>", file: !67, line: 511, size: 64, flags: DIFlagTypePassByValue, elements: !440, templateParams: !450, identifier: "_ZTS8ssdm_intILi34ELb1EE")
!440 = !{!441, !443, !447}
!441 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !439, file: !67, line: 513, baseType: !442, size: 34, align: 64)
!442 = !DIBasicType(name: "int34", size: 34, encoding: DW_ATE_signed)
!443 = !DISubprogram(name: "ssdm_int", scope: !439, file: !67, line: 514, type: !444, isLocal: false, isDefinition: false, scopeLine: 514, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DISubroutineType(types: !445)
!445 = !{null, !446}
!446 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !439, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!447 = !DISubprogram(name: "ssdm_int", scope: !439, file: !67, line: 515, type: !448, isLocal: false, isDefinition: false, scopeLine: 515, flags: DIFlagPrototyped, isOptimized: false)
!448 = !DISubroutineType(types: !449)
!449 = !{null, !446, !442}
!450 = !{!451, !390}
!451 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 34)
!452 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !436, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 34)
!453 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !436, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 true)
!454 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi34ELb1EEaSERKS0_", scope: !436, file: !63, line: 479, type: !455, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!455 = !DISubroutineType(types: !456)
!456 = !{!457, !458, !459}
!457 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !436, size: 64)
!458 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !436, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!459 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !460, size: 64)
!460 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !436)
!461 = !{!462, !390}
!462 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 34)
!463 = !DIDerivedType(tag: DW_TAG_typedef, name: "RetType", scope: !401, file: !63, line: 146, baseType: !464)
!464 = !DIDerivedType(tag: DW_TAG_typedef, name: "Type", scope: !465, file: !63, line: 62, baseType: !468)
!465 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "retval<9, true>", file: !63, line: 61, size: 8, flags: DIFlagTypePassByValue, elements: !4, templateParams: !466, identifier: "_ZTS6retvalILi9ELb1EE")
!466 = !{!467, !390}
!467 = !DITemplateValueParameter(name: "_AP_N", type: !80, value: i32 9)
!468 = !DIDerivedType(tag: DW_TAG_typedef, name: "ap_slong", file: !434, line: 187, baseType: !469)
!469 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!470 = !{!471, !502, !513, !535, !540, !542, !544, !546, !548}
!471 = !DIGlobalVariableExpression(var: !472, expr: !DIExpression())
!472 = distinct !DIGlobalVariable(name: "NEIGHBOR_OFFSETS", linkageName: "NEIGHBOR_OFFSETS", scope: !291, file: !55, line: 132, type: !473, isLocal: true, isDefinition: true)
!473 = !DICompositeType(tag: DW_TAG_array_type, baseType: !474, size: 648, align: 1, elements: !500)
!474 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<8, true>", file: !63, line: 124, size: 8, flags: DIFlagTypePassByValue, elements: !475, templateParams: !498, identifier: "_ZTS11ap_int_baseILi8ELb1EE")
!475 = !{!476, !489, !490, !491}
!476 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !474, baseType: !477)
!477 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<8, true>", file: !67, line: 511, size: 8, flags: DIFlagTypePassByValue, elements: !478, templateParams: !488, identifier: "_ZTS8ssdm_intILi8ELb1EE")
!478 = !{!479, !481, !485}
!479 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !477, file: !67, line: 513, baseType: !480, size: 8)
!480 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!481 = !DISubprogram(name: "ssdm_int", scope: !477, file: !67, line: 514, type: !482, isLocal: false, isDefinition: false, scopeLine: 514, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DISubroutineType(types: !483)
!483 = !{null, !484}
!484 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !477, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!485 = !DISubprogram(name: "ssdm_int", scope: !477, file: !67, line: 515, type: !486, isLocal: false, isDefinition: false, scopeLine: 515, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DISubroutineType(types: !487)
!487 = !{null, !484, !480}
!488 = !{!432, !390}
!489 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !474, file: !63, line: 148, baseType: !84, flags: DIFlagStaticMember, extraData: i32 8)
!490 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !474, file: !63, line: 149, baseType: !86, flags: DIFlagStaticMember, extraData: i1 true)
!491 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi8ELb1EEaSERKS0_", scope: !474, file: !63, line: 479, type: !492, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DISubroutineType(types: !493)
!493 = !{!494, !495, !496}
!494 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !474, size: 64)
!495 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !474, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!496 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !497, size: 64)
!497 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !474)
!498 = !{!499, !390}
!499 = !DITemplateValueParameter(name: "_AP_W", type: !80, value: i32 8)
!500 = !{!230, !501}
!501 = !DISubrange(count: 3)
!502 = !DIGlobalVariableExpression(var: !503, expr: !DIExpression())
!503 = distinct !DIGlobalVariable(name: "access_pointers", scope: !44, file: !45, line: 122, type: !504, isLocal: true, isDefinition: true)
!504 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "StreamingPointers", file: !55, line: 200, size: 224, flags: DIFlagTypePassByValue, elements: !505, identifier: "_ZTS17StreamingPointers")
!505 = !{!506, !507, !508, !509, !510, !511, !512}
!506 = !DIDerivedType(tag: DW_TAG_member, name: "current_ptr_L3", scope: !504, file: !55, line: 202, baseType: !180, size: 32)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "current_ptr_L2", scope: !504, file: !55, line: 203, baseType: !180, size: 32, offset: 32)
!508 = !DIDerivedType(tag: DW_TAG_member, name: "current_ptr_L1", scope: !504, file: !55, line: 204, baseType: !180, size: 32, offset: 64)
!509 = !DIDerivedType(tag: DW_TAG_member, name: "current_ptr_L0", scope: !504, file: !55, line: 205, baseType: !180, size: 32, offset: 96)
!510 = !DIDerivedType(tag: DW_TAG_member, name: "current_l2_idx", scope: !504, file: !55, line: 206, baseType: !180, size: 32, offset: 128)
!511 = !DIDerivedType(tag: DW_TAG_member, name: "current_l1_idx", scope: !504, file: !55, line: 207, baseType: !180, size: 32, offset: 160)
!512 = !DIDerivedType(tag: DW_TAG_member, name: "initialized", scope: !504, file: !55, line: 208, baseType: !58, size: 8, offset: 192)
!513 = !DIGlobalVariableExpression(var: !514, expr: !DIExpression())
!514 = distinct !DIGlobalVariable(name: "z_buffer", scope: !515, file: !45, line: 225, type: !532, isLocal: true, isDefinition: true)
!515 = distinct !DISubprogram(name: "layer_convolution_with_persistent_accelerator", linkageName: "_Z45layer_convolution_with_persistent_acceleratoriRK11LayerConfigPA1024_A1024_fPfP7ap_uintILi512EES8_S8_S8_R16PrunedBitmapInfoPS6_ILi32EESC_SB_", scope: !45, file: !45, line: 204, type: !516, isLocal: false, isDefinition: true, scopeLine: 221, flags: DIFlagPrototyped, isOptimized: false, unit: !291, variables: !4)
!516 = !DISubroutineType(types: !517)
!517 = !{null, !80, !518, !529, !294, !235, !235, !235, !235, !283, !179, !179, !180}
!518 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !519, size: 64)
!519 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !520)
!520 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LayerConfig", file: !521, line: 7, size: 192, flags: DIFlagTypePassByValue, elements: !522, identifier: "_ZTS11LayerConfig")
!521 = !DIFile(filename: "./minkowski_net_14_layer.h", directory: "/home/robin/Desktop/ocnn-project")
!522 = !{!523, !524, !525, !526, !527, !528}
!523 = !DIDerivedType(tag: DW_TAG_member, name: "input_channels", scope: !520, file: !521, line: 8, baseType: !80, size: 32)
!524 = !DIDerivedType(tag: DW_TAG_member, name: "output_channels", scope: !520, file: !521, line: 9, baseType: !80, size: 32, offset: 32)
!525 = !DIDerivedType(tag: DW_TAG_member, name: "input_spatial_dim", scope: !520, file: !521, line: 10, baseType: !80, size: 32, offset: 64)
!526 = !DIDerivedType(tag: DW_TAG_member, name: "output_spatial_dim", scope: !520, file: !521, line: 11, baseType: !80, size: 32, offset: 96)
!527 = !DIDerivedType(tag: DW_TAG_member, name: "stride", scope: !520, file: !521, line: 12, baseType: !80, size: 32, offset: 128)
!528 = !DIDerivedType(tag: DW_TAG_member, name: "is_transpose", scope: !520, file: !521, line: 13, baseType: !82, size: 8, offset: 160)
!529 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !530, size: 64)
!530 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 33554432, elements: !531)
!531 = !{!231, !231}
!532 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 50331648, elements: !533)
!533 = !{!501, !534, !231}
!534 = !DISubrange(count: 512)
!535 = !DIGlobalVariableExpression(var: !536, expr: !DIExpression())
!536 = distinct !DIGlobalVariable(name: "MINKOWSKI_LAYERS.input_channels", linkageName: "MINKOWSKI_LAYERS.input_channels", scope: !291, file: !521, line: 17, type: !537, isLocal: true, isDefinition: true)
!537 = !DICompositeType(tag: DW_TAG_array_type, baseType: !80, size: 448, align: 4, elements: !538)
!538 = !{!539}
!539 = !DISubrange(count: 14)
!540 = !DIGlobalVariableExpression(var: !541, expr: !DIExpression())
!541 = distinct !DIGlobalVariable(name: "MINKOWSKI_LAYERS.output_channels", linkageName: "MINKOWSKI_LAYERS.output_channels", scope: !291, file: !521, line: 17, type: !537, isLocal: true, isDefinition: true)
!542 = !DIGlobalVariableExpression(var: !543, expr: !DIExpression())
!543 = distinct !DIGlobalVariable(name: "MINKOWSKI_LAYERS.input_spatial_dim", linkageName: "MINKOWSKI_LAYERS.input_spatial_dim", scope: !291, file: !521, line: 17, type: !537, isLocal: true, isDefinition: true)
!544 = !DIGlobalVariableExpression(var: !545, expr: !DIExpression())
!545 = distinct !DIGlobalVariable(name: "MINKOWSKI_LAYERS.output_spatial_dim", linkageName: "MINKOWSKI_LAYERS.output_spatial_dim", scope: !291, file: !521, line: 17, type: !537, isLocal: true, isDefinition: true)
!546 = !DIGlobalVariableExpression(var: !547, expr: !DIExpression())
!547 = distinct !DIGlobalVariable(name: "MINKOWSKI_LAYERS.stride", linkageName: "MINKOWSKI_LAYERS.stride", scope: !291, file: !521, line: 17, type: !537, isLocal: true, isDefinition: true)
!548 = !DIGlobalVariableExpression(var: !549, expr: !DIExpression())
!549 = distinct !DIGlobalVariable(name: "MINKOWSKI_LAYERS.is_transpose", linkageName: "MINKOWSKI_LAYERS.is_transpose", scope: !291, file: !521, line: 17, type: !550, isLocal: true, isDefinition: true)
!550 = !DICompositeType(tag: DW_TAG_array_type, baseType: !82, size: 112, align: 1, elements: !538)
!551 = !DILocation(line: 50, column: 9, scope: !44)
!552 = distinct !{!552, !553}
!553 = !{!"llvm.loop.rotate.disable"}
