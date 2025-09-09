; ModuleID = '/home/robin/Desktop/ocnn-project/ocnn6_net/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
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
define void @apatb_ocnn6_net_8_layer_pipeline_ir(%"class.hls::stream<VoxelData, 0>"* noalias nocapture nonnull dereferenceable(144) %input_voxel_stream, %"struct.ap_uint<32>"* noalias nocapture nonnull "maxi" %final_output_full_cubic, float* noalias nocapture nonnull readonly "maxi" %conv1_weights, float* noalias nocapture nonnull readonly "maxi" %conv2_weights, float* noalias nocapture nonnull readonly "maxi" %conv3_weights, float* noalias nocapture nonnull readonly "maxi" %conv4_weights, float* noalias nocapture nonnull readonly "maxi" %conv5_weights, float* noalias nocapture nonnull readonly "maxi" %conv6_weights, float* noalias nocapture nonnull readonly "maxi" %fc1_weights, float* noalias nocapture nonnull readonly "maxi" %fc2_weights, float* noalias nocapture nonnull readonly "maxi" %conv1_bias, float* noalias nocapture nonnull readonly "maxi" %conv2_bias, float* noalias nocapture nonnull readonly "maxi" %conv3_bias, float* noalias nocapture nonnull readonly "maxi" %conv4_bias, float* noalias nocapture nonnull readonly "maxi" %conv5_bias, float* noalias nocapture nonnull readonly "maxi" %conv6_bias, float* noalias nocapture nonnull readonly "maxi" %fc1_bias, float* noalias nocapture nonnull readonly "maxi" %fc2_bias, %"struct.ap_uint<32>"* noalias nocapture nonnull "maxi" %pruned_feature_dram_read, %"struct.ap_uint<32>"* noalias nocapture nonnull readonly "maxi" %pruned_feature_dram_write, %"struct.ap_uint<512>"* noalias nonnull %L3_bitmap, %"struct.ap_uint<512>"* noalias nonnull %L2_bitmap, %"struct.ap_uint<512>"* noalias nonnull %L1_bitmap, %"struct.ap_uint<512>"* noalias nonnull %L0_bitmap, %struct.PrunedBitmapInfo* noalias nocapture nonnull dereferenceable(20) %bitmap_info, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %total_processed_voxels) local_unnamed_addr #1 {
entry:
  %input_voxel_stream_copy = alloca i1085, align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(i1085* %input_voxel_stream_copy, i32 0) ]
  %0 = bitcast %"struct.ap_uint<32>"* %final_output_full_cubic to [10485760 x %"struct.ap_uint<32>"]*
  %1 = call i8* @malloc(i64 41943040)
  %final_output_full_cubic_copy = bitcast i8* %1 to [10485760 x i32]*
  %2 = bitcast float* %conv1_weights to [1296 x float]*
  %3 = call i8* @malloc(i64 5184)
  %conv1_weights_copy = bitcast i8* %3 to [1296 x float]*
  %4 = bitcast float* %conv2_weights to [13824 x float]*
  %5 = call i8* @malloc(i64 55296)
  %conv2_weights_copy = bitcast i8* %5 to [13824 x float]*
  %6 = bitcast float* %conv3_weights to [55296 x float]*
  %7 = call i8* @malloc(i64 221184)
  %conv3_weights_copy = bitcast i8* %7 to [55296 x float]*
  %8 = bitcast float* %conv4_weights to [221184 x float]*
  %9 = call i8* @malloc(i64 884736)
  %conv4_weights_copy = bitcast i8* %9 to [221184 x float]*
  %10 = bitcast float* %conv5_weights to [884736 x float]*
  %11 = call i8* @malloc(i64 3538944)
  %conv5_weights_copy = bitcast i8* %11 to [884736 x float]*
  %12 = bitcast float* %conv6_weights to [3538944 x float]*
  %13 = call i8* @malloc(i64 14155776)
  %conv6_weights_copy = bitcast i8* %13 to [3538944 x float]*
  %14 = bitcast float* %fc1_weights to [65536 x float]*
  %15 = call i8* @malloc(i64 262144)
  %fc1_weights_copy = bitcast i8* %15 to [65536 x float]*
  %16 = bitcast float* %fc2_weights to [5120 x float]*
  %17 = call i8* @malloc(i64 20480)
  %fc2_weights_copy = bitcast i8* %17 to [5120 x float]*
  %18 = bitcast float* %conv1_bias to [16 x float]*
  %conv1_bias_copy = alloca [16 x float], align 512
  %19 = bitcast float* %conv2_bias to [32 x float]*
  %conv2_bias_copy = alloca [32 x float], align 512
  %20 = bitcast float* %conv3_bias to [64 x float]*
  %conv3_bias_copy = alloca [64 x float], align 512
  %21 = bitcast float* %conv4_bias to [128 x float]*
  %conv4_bias_copy = alloca [128 x float], align 512
  %22 = bitcast float* %conv5_bias to [256 x float]*
  %conv5_bias_copy = alloca [256 x float], align 512
  %23 = bitcast float* %conv6_bias to [512 x float]*
  %conv6_bias_copy = alloca [512 x float], align 512
  %24 = bitcast float* %fc1_bias to [128 x float]*
  %fc1_bias_copy = alloca [128 x float], align 512
  %25 = bitcast float* %fc2_bias to [40 x float]*
  %fc2_bias_copy = alloca [40 x float], align 512
  %26 = bitcast %"struct.ap_uint<32>"* %pruned_feature_dram_read to [262144 x %"struct.ap_uint<32>"]*
  %27 = call i8* @malloc(i64 1048576)
  %pruned_feature_dram_read_copy = bitcast i8* %27 to [262144 x i32]*
  %28 = bitcast %"struct.ap_uint<32>"* %pruned_feature_dram_write to [262144 x %"struct.ap_uint<32>"]*
  %29 = call i8* @malloc(i64 1048576)
  %pruned_feature_dram_write_copy = bitcast i8* %29 to [262144 x i32]*
  %30 = getelementptr [262144 x i32], [262144 x i32]* %pruned_feature_dram_write_copy, i64 0, i64 0
  %L3_bitmap_copy = alloca i512, align 512
  %L2_bitmap_copy = alloca i512, align 512
  %L1_bitmap_copy = alloca i512, align 512
  %L0_bitmap_copy = alloca i512, align 512
  %bitmap_info_copy = alloca %struct.PrunedBitmapInfo, align 512
  %total_processed_voxels_copy = alloca i32, align 512
  call fastcc void @copy_in(%"class.hls::stream<VoxelData, 0>"* nonnull %input_voxel_stream, i1085* nonnull align 512 %input_voxel_stream_copy, [10485760 x %"struct.ap_uint<32>"]* nonnull %0, [10485760 x i32]* %final_output_full_cubic_copy, [1296 x float]* nonnull %2, [1296 x float]* %conv1_weights_copy, [13824 x float]* nonnull %4, [13824 x float]* %conv2_weights_copy, [55296 x float]* nonnull %6, [55296 x float]* %conv3_weights_copy, [221184 x float]* nonnull %8, [221184 x float]* %conv4_weights_copy, [884736 x float]* nonnull %10, [884736 x float]* %conv5_weights_copy, [3538944 x float]* nonnull %12, [3538944 x float]* %conv6_weights_copy, [65536 x float]* nonnull %14, [65536 x float]* %fc1_weights_copy, [5120 x float]* nonnull %16, [5120 x float]* %fc2_weights_copy, [16 x float]* nonnull %18, [16 x float]* nonnull align 512 %conv1_bias_copy, [32 x float]* nonnull %19, [32 x float]* nonnull align 512 %conv2_bias_copy, [64 x float]* nonnull %20, [64 x float]* nonnull align 512 %conv3_bias_copy, [128 x float]* nonnull %21, [128 x float]* nonnull align 512 %conv4_bias_copy, [256 x float]* nonnull %22, [256 x float]* nonnull align 512 %conv5_bias_copy, [512 x float]* nonnull %23, [512 x float]* nonnull align 512 %conv6_bias_copy, [128 x float]* nonnull %24, [128 x float]* nonnull align 512 %fc1_bias_copy, [40 x float]* nonnull %25, [40 x float]* nonnull align 512 %fc2_bias_copy, [262144 x %"struct.ap_uint<32>"]* nonnull %26, [262144 x i32]* %pruned_feature_dram_read_copy, [262144 x %"struct.ap_uint<32>"]* nonnull %28, [262144 x i32]* %pruned_feature_dram_write_copy, %"struct.ap_uint<512>"* nonnull %L3_bitmap, i512* nonnull align 512 %L3_bitmap_copy, %"struct.ap_uint<512>"* nonnull %L2_bitmap, i512* nonnull align 512 %L2_bitmap_copy, %"struct.ap_uint<512>"* nonnull %L1_bitmap, i512* nonnull align 512 %L1_bitmap_copy, %"struct.ap_uint<512>"* nonnull %L0_bitmap, i512* nonnull align 512 %L0_bitmap_copy, %struct.PrunedBitmapInfo* nonnull %bitmap_info, %struct.PrunedBitmapInfo* nonnull align 512 %bitmap_info_copy, %"struct.ap_uint<32>"* nonnull %total_processed_voxels, i32* nonnull align 512 %total_processed_voxels_copy)
  call void @apatb_ocnn6_net_8_layer_pipeline_hw(i1085* %input_voxel_stream_copy, [10485760 x i32]* %final_output_full_cubic_copy, [1296 x float]* %conv1_weights_copy, [13824 x float]* %conv2_weights_copy, [55296 x float]* %conv3_weights_copy, [221184 x float]* %conv4_weights_copy, [884736 x float]* %conv5_weights_copy, [3538944 x float]* %conv6_weights_copy, [65536 x float]* %fc1_weights_copy, [5120 x float]* %fc2_weights_copy, [16 x float]* %conv1_bias_copy, [32 x float]* %conv2_bias_copy, [64 x float]* %conv3_bias_copy, [128 x float]* %conv4_bias_copy, [256 x float]* %conv5_bias_copy, [512 x float]* %conv6_bias_copy, [128 x float]* %fc1_bias_copy, [40 x float]* %fc2_bias_copy, [262144 x i32]* %pruned_feature_dram_read_copy, i32* %30, i512* %L3_bitmap_copy, i512* %L2_bitmap_copy, i512* %L1_bitmap_copy, i512* %L0_bitmap_copy, %struct.PrunedBitmapInfo* %bitmap_info_copy, i32* %total_processed_voxels_copy)
  call void @copy_back(%"class.hls::stream<VoxelData, 0>"* %input_voxel_stream, i1085* %input_voxel_stream_copy, [10485760 x %"struct.ap_uint<32>"]* %0, [10485760 x i32]* %final_output_full_cubic_copy, [1296 x float]* %2, [1296 x float]* %conv1_weights_copy, [13824 x float]* %4, [13824 x float]* %conv2_weights_copy, [55296 x float]* %6, [55296 x float]* %conv3_weights_copy, [221184 x float]* %8, [221184 x float]* %conv4_weights_copy, [884736 x float]* %10, [884736 x float]* %conv5_weights_copy, [3538944 x float]* %12, [3538944 x float]* %conv6_weights_copy, [65536 x float]* %14, [65536 x float]* %fc1_weights_copy, [5120 x float]* %16, [5120 x float]* %fc2_weights_copy, [16 x float]* %18, [16 x float]* %conv1_bias_copy, [32 x float]* %19, [32 x float]* %conv2_bias_copy, [64 x float]* %20, [64 x float]* %conv3_bias_copy, [128 x float]* %21, [128 x float]* %conv4_bias_copy, [256 x float]* %22, [256 x float]* %conv5_bias_copy, [512 x float]* %23, [512 x float]* %conv6_bias_copy, [128 x float]* %24, [128 x float]* %fc1_bias_copy, [40 x float]* %25, [40 x float]* %fc2_bias_copy, [262144 x %"struct.ap_uint<32>"]* %26, [262144 x i32]* %pruned_feature_dram_read_copy, [262144 x %"struct.ap_uint<32>"]* %28, [262144 x i32]* %pruned_feature_dram_write_copy, %"struct.ap_uint<512>"* %L3_bitmap, i512* %L3_bitmap_copy, %"struct.ap_uint<512>"* %L2_bitmap, i512* %L2_bitmap_copy, %"struct.ap_uint<512>"* %L1_bitmap, i512* %L1_bitmap_copy, %"struct.ap_uint<512>"* %L0_bitmap, i512* %L0_bitmap_copy, %struct.PrunedBitmapInfo* %bitmap_info, %struct.PrunedBitmapInfo* %bitmap_info_copy, %"struct.ap_uint<32>"* %total_processed_voxels, i32* %total_processed_voxels_copy)
  call void @free(i8* %1)
  tail call void @free(i8* %3)
  tail call void @free(i8* %5)
  tail call void @free(i8* %7)
  tail call void @free(i8* %9)
  tail call void @free(i8* %11)
  tail call void @free(i8* %13)
  tail call void @free(i8* %15)
  tail call void @free(i8* %17)
  call void @free(i8* %27)
  call void @free(i8* %29)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_in(%"class.hls::stream<VoxelData, 0>"* "unpacked"="0", i1085* align 512 "unpacked"="1", [10485760 x %"struct.ap_uint<32>"]* readonly "unpacked"="2", [10485760 x i32]* nocapture "unpacked"="3.0", [1296 x float]* readonly "unpacked"="4", [1296 x float]* "unpacked"="5", [13824 x float]* readonly "unpacked"="6", [13824 x float]* "unpacked"="7", [55296 x float]* readonly "unpacked"="8", [55296 x float]* "unpacked"="9", [221184 x float]* readonly "unpacked"="10", [221184 x float]* "unpacked"="11", [884736 x float]* readonly "unpacked"="12", [884736 x float]* "unpacked"="13", [3538944 x float]* readonly "unpacked"="14", [3538944 x float]* "unpacked"="15", [65536 x float]* readonly "unpacked"="16", [65536 x float]* "unpacked"="17", [5120 x float]* readonly "unpacked"="18", [5120 x float]* "unpacked"="19", [16 x float]* readonly "unpacked"="20", [16 x float]* align 512 "unpacked"="21", [32 x float]* readonly "unpacked"="22", [32 x float]* align 512 "unpacked"="23", [64 x float]* readonly "unpacked"="24", [64 x float]* align 512 "unpacked"="25", [128 x float]* readonly "unpacked"="26", [128 x float]* align 512 "unpacked"="27", [256 x float]* readonly "unpacked"="28", [256 x float]* align 512 "unpacked"="29", [512 x float]* readonly "unpacked"="30", [512 x float]* align 512 "unpacked"="31", [128 x float]* readonly "unpacked"="32", [128 x float]* align 512 "unpacked"="33", [40 x float]* readonly "unpacked"="34", [40 x float]* align 512 "unpacked"="35", [262144 x %"struct.ap_uint<32>"]* readonly "unpacked"="36", [262144 x i32]* "unpacked"="37", [262144 x %"struct.ap_uint<32>"]* readonly "unpacked"="38", [262144 x i32]* nocapture "unpacked"="39.0", %"struct.ap_uint<512>"* readonly "unpacked"="40", i512* noalias nocapture align 512 "unpacked"="41.0", %"struct.ap_uint<512>"* readonly "unpacked"="42", i512* noalias nocapture align 512 "unpacked"="43.0", %"struct.ap_uint<512>"* readonly "unpacked"="44", i512* noalias nocapture align 512 "unpacked"="45.0", %"struct.ap_uint<512>"* readonly "unpacked"="46", i512* noalias nocapture align 512 "unpacked"="47.0", %struct.PrunedBitmapInfo* readonly "unpacked"="48", %struct.PrunedBitmapInfo* align 512 "unpacked"="49", %"struct.ap_uint<32>"* readonly "unpacked"="50", i32* noalias nocapture align 512 "unpacked"="51.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>.204"(i1085* align 512 %1, %"class.hls::stream<VoxelData, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0a10485760struct.ap_uint<32>"([10485760 x i32]* %3, [10485760 x %"struct.ap_uint<32>"]* %2)
  call fastcc void @onebyonecpy_hls.p0a1296f32([1296 x float]* %5, [1296 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a13824f32([13824 x float]* %7, [13824 x float]* %6)
  call fastcc void @onebyonecpy_hls.p0a55296f32([55296 x float]* %9, [55296 x float]* %8)
  call fastcc void @onebyonecpy_hls.p0a221184f32([221184 x float]* %11, [221184 x float]* %10)
  call fastcc void @onebyonecpy_hls.p0a884736f32([884736 x float]* %13, [884736 x float]* %12)
  call fastcc void @onebyonecpy_hls.p0a3538944f32([3538944 x float]* %15, [3538944 x float]* %14)
  call fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* %17, [65536 x float]* %16)
  call fastcc void @onebyonecpy_hls.p0a5120f32([5120 x float]* %19, [5120 x float]* %18)
  call fastcc void @onebyonecpy_hls.p0a16f32([16 x float]* align 512 %21, [16 x float]* %20)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %23, [32 x float]* %22)
  call fastcc void @onebyonecpy_hls.p0a64f32([64 x float]* align 512 %25, [64 x float]* %24)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* align 512 %27, [128 x float]* %26)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %29, [256 x float]* %28)
  call fastcc void @onebyonecpy_hls.p0a512f32([512 x float]* align 512 %31, [512 x float]* %30)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* align 512 %33, [128 x float]* %32)
  call fastcc void @onebyonecpy_hls.p0a40f32([40 x float]* align 512 %35, [40 x float]* %34)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>"([262144 x i32]* %37, [262144 x %"struct.ap_uint<32>"]* %36)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.107"([262144 x i32]* %39, [262144 x %"struct.ap_uint<32>"]* %38)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* align 512 %41, %"struct.ap_uint<512>"* %40)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* align 512 %43, %"struct.ap_uint<512>"* %42)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* align 512 %45, %"struct.ap_uint<512>"* %44)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* align 512 %47, %"struct.ap_uint<512>"* %46)
  call fastcc void @onebyonecpy_hls.p0struct.PrunedBitmapInfo(%struct.PrunedBitmapInfo* align 512 %49, %struct.PrunedBitmapInfo* %48)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %51, %"struct.ap_uint<32>"* %50)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>"(%"class.hls::stream<VoxelData, 0>"* %dst, i1085* align 512 %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<VoxelData, 0>"* %dst, null
  %1 = icmp eq i1085* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<VoxelData, 0>"(%"class.hls::stream<VoxelData, 0>"* nonnull %dst, i1085* nonnull align 512 %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<VoxelData, 0>"(%"class.hls::stream<VoxelData, 0>"* nocapture, i1085* nocapture align 512) unnamed_addr #4 {
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
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a10485760struct.ap_uint<32>"([10485760 x i32]* nocapture "unpacked"="0.0" %dst, [10485760 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [10485760 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a10485760struct.ap_uint<32>"([10485760 x i32]* %dst, [10485760 x %"struct.ap_uint<32>"]* nonnull %src, i64 10485760)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a10485760struct.ap_uint<32>"([10485760 x i32]* nocapture "unpacked"="0.0" %dst, [10485760 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [10485760 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [10485760 x %"struct.ap_uint<32>"], [10485760 x %"struct.ap_uint<32>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [10485760 x i32], [10485760 x i32]* %dst, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a1296f32([1296 x float]* %dst, [1296 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [1296 x float]* %dst, null
  %1 = icmp eq [1296 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1296f32([1296 x float]* nonnull %dst, [1296 x float]* nonnull %src, i64 1296)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1296f32([1296 x float]* %dst, [1296 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [1296 x float]* %src, null
  %1 = icmp eq [1296 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1296 x float], [1296 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1296 x float], [1296 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a13824f32([13824 x float]* %dst, [13824 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [13824 x float]* %dst, null
  %1 = icmp eq [13824 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a13824f32([13824 x float]* nonnull %dst, [13824 x float]* nonnull %src, i64 13824)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a13824f32([13824 x float]* %dst, [13824 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [13824 x float]* %src, null
  %1 = icmp eq [13824 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [13824 x float], [13824 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [13824 x float], [13824 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a55296f32([55296 x float]* %dst, [55296 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [55296 x float]* %dst, null
  %1 = icmp eq [55296 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a55296f32([55296 x float]* nonnull %dst, [55296 x float]* nonnull %src, i64 55296)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a55296f32([55296 x float]* %dst, [55296 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [55296 x float]* %src, null
  %1 = icmp eq [55296 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [55296 x float], [55296 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [55296 x float], [55296 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a221184f32([221184 x float]* %dst, [221184 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [221184 x float]* %dst, null
  %1 = icmp eq [221184 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a221184f32([221184 x float]* nonnull %dst, [221184 x float]* nonnull %src, i64 221184)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a221184f32([221184 x float]* %dst, [221184 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [221184 x float]* %src, null
  %1 = icmp eq [221184 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [221184 x float], [221184 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [221184 x float], [221184 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a884736f32([884736 x float]* %dst, [884736 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [884736 x float]* %dst, null
  %1 = icmp eq [884736 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a884736f32([884736 x float]* nonnull %dst, [884736 x float]* nonnull %src, i64 884736)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a884736f32([884736 x float]* %dst, [884736 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [884736 x float]* %src, null
  %1 = icmp eq [884736 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [884736 x float], [884736 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [884736 x float], [884736 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a3538944f32([3538944 x float]* %dst, [3538944 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [3538944 x float]* %dst, null
  %1 = icmp eq [3538944 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a3538944f32([3538944 x float]* nonnull %dst, [3538944 x float]* nonnull %src, i64 3538944)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3538944f32([3538944 x float]* %dst, [3538944 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [3538944 x float]* %src, null
  %1 = icmp eq [3538944 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3538944 x float], [3538944 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3538944 x float], [3538944 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* %dst, [65536 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [65536 x float]* %dst, null
  %1 = icmp eq [65536 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a65536f32([65536 x float]* nonnull %dst, [65536 x float]* nonnull %src, i64 65536)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a65536f32([65536 x float]* %dst, [65536 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [65536 x float]* %src, null
  %1 = icmp eq [65536 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [65536 x float], [65536 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [65536 x float], [65536 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a5120f32([5120 x float]* %dst, [5120 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [5120 x float]* %dst, null
  %1 = icmp eq [5120 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a5120f32([5120 x float]* nonnull %dst, [5120 x float]* nonnull %src, i64 5120)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a5120f32([5120 x float]* %dst, [5120 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [5120 x float]* %src, null
  %1 = icmp eq [5120 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [5120 x float], [5120 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [5120 x float], [5120 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a16f32([16 x float]* align 512 %dst, [16 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [16 x float]* %dst, null
  %1 = icmp eq [16 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a16f32([16 x float]* nonnull %dst, [16 x float]* nonnull %src, i64 16)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a16f32([16 x float]* %dst, [16 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [16 x float]* %src, null
  %1 = icmp eq [16 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [16 x float], [16 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [16 x float], [16 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %dst, [32 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [32 x float]* %dst, null
  %1 = icmp eq [32 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a32f32([32 x float]* nonnull %dst, [32 x float]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32f32([32 x float]* %dst, [32 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [32 x float]* %src, null
  %1 = icmp eq [32 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x float], [32 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x float], [32 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a64f32([64 x float]* align 512 %dst, [64 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [64 x float]* %dst, null
  %1 = icmp eq [64 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a64f32([64 x float]* nonnull %dst, [64 x float]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a64f32([64 x float]* %dst, [64 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [64 x float]* %src, null
  %1 = icmp eq [64 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [64 x float], [64 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [64 x float], [64 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* align 512 %dst, [128 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [128 x float]* %dst, null
  %1 = icmp eq [128 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a128f32([128 x float]* nonnull %dst, [128 x float]* nonnull %src, i64 128)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a128f32([128 x float]* %dst, [128 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [128 x float]* %src, null
  %1 = icmp eq [128 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [128 x float], [128 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [128 x float], [128 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %dst, [256 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [256 x float]* %dst, null
  %1 = icmp eq [256 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a256f32([256 x float]* nonnull %dst, [256 x float]* nonnull %src, i64 256)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a256f32([256 x float]* %dst, [256 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [256 x float]* %src, null
  %1 = icmp eq [256 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [256 x float], [256 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [256 x float], [256 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a512f32([512 x float]* align 512 %dst, [512 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [512 x float]* %dst, null
  %1 = icmp eq [512 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a512f32([512 x float]* nonnull %dst, [512 x float]* nonnull %src, i64 512)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a512f32([512 x float]* %dst, [512 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [512 x float]* %src, null
  %1 = icmp eq [512 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [512 x float], [512 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [512 x float], [512 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a40f32([40 x float]* align 512 %dst, [40 x float]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [40 x float]* %dst, null
  %1 = icmp eq [40 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a40f32([40 x float]* nonnull %dst, [40 x float]* nonnull %src, i64 40)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a40f32([40 x float]* %dst, [40 x float]* readonly %src, i64 %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [40 x float]* %src, null
  %1 = icmp eq [40 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [40 x float], [40 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [40 x float], [40 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>"([262144 x i32]* %dst, [262144 x %"struct.ap_uint<32>"]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [262144 x i32]* %dst, null
  %1 = icmp eq [262144 x %"struct.ap_uint<32>"]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a262144struct.ap_uint<32>"([262144 x i32]* nonnull %dst, [262144 x %"struct.ap_uint<32>"]* nonnull %src, i64 262144)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a262144struct.ap_uint<32>"([262144 x i32]* %dst, [262144 x %"struct.ap_uint<32>"]* readonly %src, i64 %num) local_unnamed_addr #6 {
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
define internal fastcc void @onebyonecpy_hls.p0struct.PrunedBitmapInfo(%struct.PrunedBitmapInfo* align 512 %dst, %struct.PrunedBitmapInfo* readonly %src) unnamed_addr #5 {
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
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<32>"* noalias readonly "unpacked"="1" %src) unnamed_addr #5 {
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

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_out(%"class.hls::stream<VoxelData, 0>"* "unpacked"="0", i1085* align 512 "unpacked"="1", [10485760 x %"struct.ap_uint<32>"]* "unpacked"="2", [10485760 x i32]* nocapture readonly "unpacked"="3.0", [1296 x float]* "unpacked"="4", [1296 x float]* readonly "unpacked"="5", [13824 x float]* "unpacked"="6", [13824 x float]* readonly "unpacked"="7", [55296 x float]* "unpacked"="8", [55296 x float]* readonly "unpacked"="9", [221184 x float]* "unpacked"="10", [221184 x float]* readonly "unpacked"="11", [884736 x float]* "unpacked"="12", [884736 x float]* readonly "unpacked"="13", [3538944 x float]* "unpacked"="14", [3538944 x float]* readonly "unpacked"="15", [65536 x float]* "unpacked"="16", [65536 x float]* readonly "unpacked"="17", [5120 x float]* "unpacked"="18", [5120 x float]* readonly "unpacked"="19", [16 x float]* "unpacked"="20", [16 x float]* readonly align 512 "unpacked"="21", [32 x float]* "unpacked"="22", [32 x float]* readonly align 512 "unpacked"="23", [64 x float]* "unpacked"="24", [64 x float]* readonly align 512 "unpacked"="25", [128 x float]* "unpacked"="26", [128 x float]* readonly align 512 "unpacked"="27", [256 x float]* "unpacked"="28", [256 x float]* readonly align 512 "unpacked"="29", [512 x float]* "unpacked"="30", [512 x float]* readonly align 512 "unpacked"="31", [128 x float]* "unpacked"="32", [128 x float]* readonly align 512 "unpacked"="33", [40 x float]* "unpacked"="34", [40 x float]* readonly align 512 "unpacked"="35", [262144 x %"struct.ap_uint<32>"]* "unpacked"="36", [262144 x i32]* readonly "unpacked"="37", [262144 x %"struct.ap_uint<32>"]* "unpacked"="38", [262144 x i32]* nocapture readonly "unpacked"="39.0", %"struct.ap_uint<512>"* "unpacked"="40", i512* noalias nocapture readonly align 512 "unpacked"="41.0", %"struct.ap_uint<512>"* "unpacked"="42", i512* noalias nocapture readonly align 512 "unpacked"="43.0", %"struct.ap_uint<512>"* "unpacked"="44", i512* noalias nocapture readonly align 512 "unpacked"="45.0", %"struct.ap_uint<512>"* "unpacked"="46", i512* noalias nocapture readonly align 512 "unpacked"="47.0", %struct.PrunedBitmapInfo* "unpacked"="48", %struct.PrunedBitmapInfo* readonly align 512 "unpacked"="49", %"struct.ap_uint<32>"* "unpacked"="50", i32* noalias nocapture readonly align 512 "unpacked"="51.0") unnamed_addr #7 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>"(%"class.hls::stream<VoxelData, 0>"* %0, i1085* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a10485760struct.ap_uint<32>.122"([10485760 x %"struct.ap_uint<32>"]* %2, [10485760 x i32]* %3)
  call fastcc void @onebyonecpy_hls.p0a1296f32([1296 x float]* %4, [1296 x float]* %5)
  call fastcc void @onebyonecpy_hls.p0a13824f32([13824 x float]* %6, [13824 x float]* %7)
  call fastcc void @onebyonecpy_hls.p0a55296f32([55296 x float]* %8, [55296 x float]* %9)
  call fastcc void @onebyonecpy_hls.p0a221184f32([221184 x float]* %10, [221184 x float]* %11)
  call fastcc void @onebyonecpy_hls.p0a884736f32([884736 x float]* %12, [884736 x float]* %13)
  call fastcc void @onebyonecpy_hls.p0a3538944f32([3538944 x float]* %14, [3538944 x float]* %15)
  call fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* %16, [65536 x float]* %17)
  call fastcc void @onebyonecpy_hls.p0a5120f32([5120 x float]* %18, [5120 x float]* %19)
  call fastcc void @onebyonecpy_hls.p0a16f32([16 x float]* %20, [16 x float]* align 512 %21)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %22, [32 x float]* align 512 %23)
  call fastcc void @onebyonecpy_hls.p0a64f32([64 x float]* %24, [64 x float]* align 512 %25)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* %26, [128 x float]* align 512 %27)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %28, [256 x float]* align 512 %29)
  call fastcc void @onebyonecpy_hls.p0a512f32([512 x float]* %30, [512 x float]* align 512 %31)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* %32, [128 x float]* align 512 %33)
  call fastcc void @onebyonecpy_hls.p0a40f32([40 x float]* %34, [40 x float]* align 512 %35)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.214"([262144 x %"struct.ap_uint<32>"]* %36, [262144 x i32]* %37)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.114"([262144 x %"struct.ap_uint<32>"]* %38, [262144 x i32]* %39)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.87"(%"struct.ap_uint<512>"* %40, i512* align 512 %41)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.87"(%"struct.ap_uint<512>"* %42, i512* align 512 %43)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.87"(%"struct.ap_uint<512>"* %44, i512* align 512 %45)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.87"(%"struct.ap_uint<512>"* %46, i512* align 512 %47)
  call fastcc void @onebyonecpy_hls.p0struct.PrunedBitmapInfo(%struct.PrunedBitmapInfo* %48, %struct.PrunedBitmapInfo* align 512 %49)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.73"(%"struct.ap_uint<32>"* %50, i32* align 512 %51)
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.73"(%"struct.ap_uint<32>"* noalias "unpacked"="0" %dst, i32* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #5 {
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
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<512>"* noalias readonly "unpacked"="1" %src) unnamed_addr #5 {
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
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.87"(%"struct.ap_uint<512>"* noalias "unpacked"="0" %dst, i512* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #5 {
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
define internal fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.107"([262144 x i32]* nocapture "unpacked"="0.0" %dst, [262144 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [262144 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a262144struct.ap_uint<32>.110"([262144 x i32]* %dst, [262144 x %"struct.ap_uint<32>"]* nonnull %src, i64 262144)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a262144struct.ap_uint<32>.110"([262144 x i32]* nocapture "unpacked"="0.0" %dst, [262144 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [262144 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [262144 x %"struct.ap_uint<32>"], [262144 x %"struct.ap_uint<32>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [262144 x i32], [262144 x i32]* %dst, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.114"([262144 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [262144 x i32]* nocapture readonly "unpacked"="1.0" %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [262144 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a262144struct.ap_uint<32>.117"([262144 x %"struct.ap_uint<32>"]* nonnull %dst, [262144 x i32]* %src, i64 262144)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a262144struct.ap_uint<32>.117"([262144 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [262144 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [262144 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [262144 x i32], [262144 x i32]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [262144 x %"struct.ap_uint<32>"], [262144 x %"struct.ap_uint<32>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
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
define internal fastcc void @"onebyonecpy_hls.p0a10485760struct.ap_uint<32>.122"([10485760 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [10485760 x i32]* nocapture readonly "unpacked"="1.0" %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [10485760 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a10485760struct.ap_uint<32>.125"([10485760 x %"struct.ap_uint<32>"]* nonnull %dst, [10485760 x i32]* %src, i64 10485760)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a10485760struct.ap_uint<32>.125"([10485760 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [10485760 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [10485760 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [10485760 x i32], [10485760 x i32]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [10485760 x %"struct.ap_uint<32>"], [10485760 x %"struct.ap_uint<32>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
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

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>.204"(i1085* align 512 %dst, %"class.hls::stream<VoxelData, 0>"* %src) unnamed_addr #3 {
entry:
  %0 = icmp eq i1085* %dst, null
  %1 = icmp eq %"class.hls::stream<VoxelData, 0>"* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<VoxelData, 0>.207"(i1085* nonnull align 512 %dst, %"class.hls::stream<VoxelData, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<VoxelData, 0>.207"(i1085* nocapture align 512, %"class.hls::stream<VoxelData, 0>"* nocapture) unnamed_addr #4 {
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
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: alwaysinline nounwind readnone willreturn
define internal i1085 @"_llvm.fpga.pack.bits.i1085.s_class.hls::stream<VoxelData, 0>s"(%"class.hls::stream<VoxelData, 0>" %A) #8 {
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

; Function Attrs: alwaysinline nounwind readnone willreturn
define internal { %"struct.ap_uint<1>", [32 x float], %"struct.ap_uint<60>" } @"_llvm.fpga.unpack.bits.s_class.hls::stream<VoxelData, 0>s.i1085"(i1085 %A) #8 {
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

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.214"([262144 x %"struct.ap_uint<32>"]* %dst, [262144 x i32]* readonly %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [262144 x %"struct.ap_uint<32>"]* %dst, null
  %1 = icmp eq [262144 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a262144struct.ap_uint<32>.217"([262144 x %"struct.ap_uint<32>"]* nonnull %dst, [262144 x i32]* nonnull %src, i64 262144)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a262144struct.ap_uint<32>.217"([262144 x %"struct.ap_uint<32>"]* %dst, [262144 x i32]* readonly %src, i64 %num) local_unnamed_addr #6 {
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

declare void @apatb_ocnn6_net_8_layer_pipeline_hw(i1085*, [10485760 x i32]*, [1296 x float]*, [13824 x float]*, [55296 x float]*, [221184 x float]*, [884736 x float]*, [3538944 x float]*, [65536 x float]*, [5120 x float]*, [16 x float]*, [32 x float]*, [64 x float]*, [128 x float]*, [256 x float]*, [512 x float]*, [128 x float]*, [40 x float]*, [262144 x i32]*, i32*, i512*, i512*, i512*, i512*, %struct.PrunedBitmapInfo*, i32*)

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_back(%"class.hls::stream<VoxelData, 0>"* "unpacked"="0", i1085* align 512 "unpacked"="1", [10485760 x %"struct.ap_uint<32>"]* "unpacked"="2", [10485760 x i32]* nocapture readonly "unpacked"="3.0", [1296 x float]* "unpacked"="4", [1296 x float]* readonly "unpacked"="5", [13824 x float]* "unpacked"="6", [13824 x float]* readonly "unpacked"="7", [55296 x float]* "unpacked"="8", [55296 x float]* readonly "unpacked"="9", [221184 x float]* "unpacked"="10", [221184 x float]* readonly "unpacked"="11", [884736 x float]* "unpacked"="12", [884736 x float]* readonly "unpacked"="13", [3538944 x float]* "unpacked"="14", [3538944 x float]* readonly "unpacked"="15", [65536 x float]* "unpacked"="16", [65536 x float]* readonly "unpacked"="17", [5120 x float]* "unpacked"="18", [5120 x float]* readonly "unpacked"="19", [16 x float]* "unpacked"="20", [16 x float]* readonly align 512 "unpacked"="21", [32 x float]* "unpacked"="22", [32 x float]* readonly align 512 "unpacked"="23", [64 x float]* "unpacked"="24", [64 x float]* readonly align 512 "unpacked"="25", [128 x float]* "unpacked"="26", [128 x float]* readonly align 512 "unpacked"="27", [256 x float]* "unpacked"="28", [256 x float]* readonly align 512 "unpacked"="29", [512 x float]* "unpacked"="30", [512 x float]* readonly align 512 "unpacked"="31", [128 x float]* "unpacked"="32", [128 x float]* readonly align 512 "unpacked"="33", [40 x float]* "unpacked"="34", [40 x float]* readonly align 512 "unpacked"="35", [262144 x %"struct.ap_uint<32>"]* "unpacked"="36", [262144 x i32]* readonly "unpacked"="37", [262144 x %"struct.ap_uint<32>"]* "unpacked"="38", [262144 x i32]* nocapture readonly "unpacked"="39.0", %"struct.ap_uint<512>"* "unpacked"="40", i512* noalias nocapture readonly align 512 "unpacked"="41.0", %"struct.ap_uint<512>"* "unpacked"="42", i512* noalias nocapture readonly align 512 "unpacked"="43.0", %"struct.ap_uint<512>"* "unpacked"="44", i512* noalias nocapture readonly align 512 "unpacked"="45.0", %"struct.ap_uint<512>"* "unpacked"="46", i512* noalias nocapture readonly align 512 "unpacked"="47.0", %struct.PrunedBitmapInfo* "unpacked"="48", %struct.PrunedBitmapInfo* readonly align 512 "unpacked"="49", %"struct.ap_uint<32>"* "unpacked"="50", i32* noalias nocapture readonly align 512 "unpacked"="51.0") unnamed_addr #7 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<VoxelData, 0>"(%"class.hls::stream<VoxelData, 0>"* %0, i1085* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a10485760struct.ap_uint<32>.122"([10485760 x %"struct.ap_uint<32>"]* %2, [10485760 x i32]* %3)
  call fastcc void @"onebyonecpy_hls.p0a262144struct.ap_uint<32>.214"([262144 x %"struct.ap_uint<32>"]* %36, [262144 x i32]* %37)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.87"(%"struct.ap_uint<512>"* %40, i512* align 512 %41)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.87"(%"struct.ap_uint<512>"* %42, i512* align 512 %43)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.87"(%"struct.ap_uint<512>"* %44, i512* align 512 %45)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.87"(%"struct.ap_uint<512>"* %46, i512* align 512 %47)
  call fastcc void @onebyonecpy_hls.p0struct.PrunedBitmapInfo(%struct.PrunedBitmapInfo* %48, %struct.PrunedBitmapInfo* align 512 %49)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.73"(%"struct.ap_uint<32>"* %50, i32* align 512 %51)
  ret void
}

declare void @ocnn6_net_8_layer_pipeline_hw_stub(%"class.hls::stream<VoxelData, 0>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull readonly, %"struct.ap_uint<512>"* noalias nonnull, %"struct.ap_uint<512>"* noalias nonnull, %"struct.ap_uint<512>"* noalias nonnull, %"struct.ap_uint<512>"* noalias nonnull, %struct.PrunedBitmapInfo* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull)

define void @ocnn6_net_8_layer_pipeline_hw_stub_wrapper(i1085*, [10485760 x i32]*, [1296 x float]*, [13824 x float]*, [55296 x float]*, [221184 x float]*, [884736 x float]*, [3538944 x float]*, [65536 x float]*, [5120 x float]*, [16 x float]*, [32 x float]*, [64 x float]*, [128 x float]*, [256 x float]*, [512 x float]*, [128 x float]*, [40 x float]*, [262144 x i32]*, i32*, i512*, i512*, i512*, i512*, %struct.PrunedBitmapInfo*, i32*) #9 {
entry:
  %26 = call i8* @malloc(i64 144)
  %27 = bitcast i8* %26 to %"class.hls::stream<VoxelData, 0>"*
  %28 = call i8* @malloc(i64 41943040)
  %29 = bitcast i8* %28 to [10485760 x %"struct.ap_uint<32>"]*
  %30 = call i8* @malloc(i64 1048576)
  %31 = bitcast i8* %30 to [262144 x %"struct.ap_uint<32>"]*
  %32 = call i8* @malloc(i64 1048576)
  %33 = bitcast i8* %32 to [262144 x %"struct.ap_uint<32>"]*
  %34 = bitcast i32* %19 to [262144 x i32]*
  %35 = call i8* @malloc(i64 64)
  %36 = bitcast i8* %35 to %"struct.ap_uint<512>"*
  %37 = call i8* @malloc(i64 64)
  %38 = bitcast i8* %37 to %"struct.ap_uint<512>"*
  %39 = call i8* @malloc(i64 64)
  %40 = bitcast i8* %39 to %"struct.ap_uint<512>"*
  %41 = call i8* @malloc(i64 64)
  %42 = bitcast i8* %41 to %"struct.ap_uint<512>"*
  %43 = call i8* @malloc(i64 4)
  %44 = bitcast i8* %43 to %"struct.ap_uint<32>"*
  call void @copy_out(%"class.hls::stream<VoxelData, 0>"* %27, i1085* %0, [10485760 x %"struct.ap_uint<32>"]* %29, [10485760 x i32]* %1, [1296 x float]* null, [1296 x float]* %2, [13824 x float]* null, [13824 x float]* %3, [55296 x float]* null, [55296 x float]* %4, [221184 x float]* null, [221184 x float]* %5, [884736 x float]* null, [884736 x float]* %6, [3538944 x float]* null, [3538944 x float]* %7, [65536 x float]* null, [65536 x float]* %8, [5120 x float]* null, [5120 x float]* %9, [16 x float]* null, [16 x float]* %10, [32 x float]* null, [32 x float]* %11, [64 x float]* null, [64 x float]* %12, [128 x float]* null, [128 x float]* %13, [256 x float]* null, [256 x float]* %14, [512 x float]* null, [512 x float]* %15, [128 x float]* null, [128 x float]* %16, [40 x float]* null, [40 x float]* %17, [262144 x %"struct.ap_uint<32>"]* %31, [262144 x i32]* %18, [262144 x %"struct.ap_uint<32>"]* %33, [262144 x i32]* %34, %"struct.ap_uint<512>"* %36, i512* %20, %"struct.ap_uint<512>"* %38, i512* %21, %"struct.ap_uint<512>"* %40, i512* %22, %"struct.ap_uint<512>"* %42, i512* %23, %struct.PrunedBitmapInfo* null, %struct.PrunedBitmapInfo* %24, %"struct.ap_uint<32>"* %44, i32* %25)
  %45 = bitcast [10485760 x %"struct.ap_uint<32>"]* %29 to %"struct.ap_uint<32>"*
  %46 = bitcast [1296 x float]* %2 to float*
  %47 = bitcast [13824 x float]* %3 to float*
  %48 = bitcast [55296 x float]* %4 to float*
  %49 = bitcast [221184 x float]* %5 to float*
  %50 = bitcast [884736 x float]* %6 to float*
  %51 = bitcast [3538944 x float]* %7 to float*
  %52 = bitcast [65536 x float]* %8 to float*
  %53 = bitcast [5120 x float]* %9 to float*
  %54 = bitcast [16 x float]* %10 to float*
  %55 = bitcast [32 x float]* %11 to float*
  %56 = bitcast [64 x float]* %12 to float*
  %57 = bitcast [128 x float]* %13 to float*
  %58 = bitcast [256 x float]* %14 to float*
  %59 = bitcast [512 x float]* %15 to float*
  %60 = bitcast [128 x float]* %16 to float*
  %61 = bitcast [40 x float]* %17 to float*
  %62 = bitcast [262144 x %"struct.ap_uint<32>"]* %31 to %"struct.ap_uint<32>"*
  %63 = bitcast [262144 x %"struct.ap_uint<32>"]* %33 to %"struct.ap_uint<32>"*
  call void @ocnn6_net_8_layer_pipeline_hw_stub(%"class.hls::stream<VoxelData, 0>"* %27, %"struct.ap_uint<32>"* %45, float* %46, float* %47, float* %48, float* %49, float* %50, float* %51, float* %52, float* %53, float* %54, float* %55, float* %56, float* %57, float* %58, float* %59, float* %60, float* %61, %"struct.ap_uint<32>"* %62, %"struct.ap_uint<32>"* %63, %"struct.ap_uint<512>"* %36, %"struct.ap_uint<512>"* %38, %"struct.ap_uint<512>"* %40, %"struct.ap_uint<512>"* %42, %struct.PrunedBitmapInfo* %24, %"struct.ap_uint<32>"* %44)
  call void @copy_in(%"class.hls::stream<VoxelData, 0>"* %27, i1085* %0, [10485760 x %"struct.ap_uint<32>"]* %29, [10485760 x i32]* %1, [1296 x float]* null, [1296 x float]* %2, [13824 x float]* null, [13824 x float]* %3, [55296 x float]* null, [55296 x float]* %4, [221184 x float]* null, [221184 x float]* %5, [884736 x float]* null, [884736 x float]* %6, [3538944 x float]* null, [3538944 x float]* %7, [65536 x float]* null, [65536 x float]* %8, [5120 x float]* null, [5120 x float]* %9, [16 x float]* null, [16 x float]* %10, [32 x float]* null, [32 x float]* %11, [64 x float]* null, [64 x float]* %12, [128 x float]* null, [128 x float]* %13, [256 x float]* null, [256 x float]* %14, [512 x float]* null, [512 x float]* %15, [128 x float]* null, [128 x float]* %16, [40 x float]* null, [40 x float]* %17, [262144 x %"struct.ap_uint<32>"]* %31, [262144 x i32]* %18, [262144 x %"struct.ap_uint<32>"]* %33, [262144 x i32]* %34, %"struct.ap_uint<512>"* %36, i512* %20, %"struct.ap_uint<512>"* %38, i512* %21, %"struct.ap_uint<512>"* %40, i512* %22, %"struct.ap_uint<512>"* %42, i512* %23, %struct.PrunedBitmapInfo* null, %struct.PrunedBitmapInfo* %24, %"struct.ap_uint<32>"* %44, i32* %25)
  call void @free(i8* %26)
  call void @free(i8* %28)
  call void @free(i8* %30)
  call void @free(i8* %32)
  call void @free(i8* %35)
  call void @free(i8* %37)
  call void @free(i8* %39)
  call void @free(i8* %41)
  call void @free(i8* %43)
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
attributes #2 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #7 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #8 = { alwaysinline nounwind readnone willreturn }
attributes #9 = { "fpga.wrapper.func"="stub" }
attributes #10 = { inaccessiblememonly nounwind willreturn "xlx.port.bitwidth"="2048" "xlx.source"="user" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
