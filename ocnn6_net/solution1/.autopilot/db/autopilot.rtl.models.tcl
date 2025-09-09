set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME ocnn6_net_8_layer_pipeline_entry_proc}
  {SRCNAME Block_entry_proc MODELNAME Block_entry_proc RTLNAME ocnn6_net_8_layer_pipeline_Block_entry_proc}
  {SRCNAME streaming_bitmap_constructor MODELNAME streaming_bitmap_constructor RTLNAME ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_bitset_512ns_512ns_32s_1ns_512_1_1 RTLNAME ocnn6_net_8_layer_pipeline_bitset_512ns_512ns_32s_1ns_512_1_1 BINDTYPE op TYPE bitset IMPL auto}
      {MODELNAME ocnn6_net_8_layer_pipeline_bitset_64ns_64ns_32ns_1ns_64_1_1 RTLNAME ocnn6_net_8_layer_pipeline_bitset_64ns_64ns_32ns_1ns_64_1_1 BINDTYPE op TYPE bitset IMPL auto}
      {MODELNAME ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor_streaming_bitmap_constructor_stream_stream_streabkb RTLNAME ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor_streaming_bitmap_constructor_stream_stream_streabkb BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor_streaming_bitmap_constructor_stream_stream_streadEe RTLNAME ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor_streaming_bitmap_constructor_stream_stream_streadEe BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor_l2_temp_buffer_RAM_AUTO_1R1W RTLNAME ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor_l2_temp_buffer_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME pipeline_bitmap_stage MODELNAME pipeline_bitmap_stage RTLNAME ocnn6_net_8_layer_pipeline_pipeline_bitmap_stage}
  {SRCNAME Loop_VITIS_LOOP_131_1_proc MODELNAME Loop_VITIS_LOOP_131_1_proc RTLNAME ocnn6_net_8_layer_pipeline_Loop_VITIS_LOOP_131_1_proc}
  {SRCNAME Block_entry_proc.24 MODELNAME Block_entry_proc_24 RTLNAME ocnn6_net_8_layer_pipeline_Block_entry_proc_24}
  {SRCNAME Loop_VITIS_LOOP_209_5_proc MODELNAME Loop_VITIS_LOOP_209_5_proc RTLNAME ocnn6_net_8_layer_pipeline_Loop_VITIS_LOOP_209_5_proc}
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_proc MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_proc RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_proc}
  {SRCNAME reset MODELNAME reset RTLNAME ocnn6_net_8_layer_pipeline_reset}
  {SRCNAME initialize_z_buffer MODELNAME initialize_z_buffer RTLNAME ocnn6_net_8_layer_pipeline_initialize_z_buffer}
  {SRCNAME compute_single_voxel_parallel MODELNAME compute_single_voxel_parallel RTLNAME ocnn6_net_8_layer_pipeline_compute_single_voxel_parallel
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fadd_32ns_32ns_32_7_full_dsp_1 RTLNAME ocnn6_net_8_layer_pipeline_fadd_32ns_32ns_32_7_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME ocnn6_net_8_layer_pipeline_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME ocnn6_net_8_layer_pipeline_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME ocnn6_net_8_layer_pipeline_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME ocnn6_net_8_layer_pipeline_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights1_rd_engine_initialized_f MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights1_rd_engine_initialized_f RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights1_rd_engine_initialized_f}
  {SRCNAME ocnn6_streaming_layer_pipeline MODELNAME ocnn6_streaming_layer_pipeline RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc30_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc31_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc32_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc33_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc34_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc35_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc36_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc37_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc38_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc39_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc40_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc41_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc42_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc43_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc44_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc45_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc46_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc47_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc48_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc49_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc50_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc51_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc52_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc53_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc54_i_U}
    }
  }
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_proc.27 MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_proc_27 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_proc_27}
  {SRCNAME initialize_z_buffer.8 MODELNAME initialize_z_buffer_8 RTLNAME ocnn6_net_8_layer_pipeline_initialize_z_buffer_8}
  {SRCNAME compute_single_voxel_parallel.9 MODELNAME compute_single_voxel_parallel_9 RTLNAME ocnn6_net_8_layer_pipeline_compute_single_voxel_parallel_9}
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights2_rd_engine_initialized_f MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights2_rd_engine_initialized_f RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights2_rd_engine_initialized_f}
  {SRCNAME ocnn6_streaming_layer_pipeline.1 MODELNAME ocnn6_streaming_layer_pipeline_1 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_1
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc30_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc31_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc32_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc33_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc34_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc35_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc36_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc37_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc38_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc39_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc40_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc41_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc42_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc43_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc44_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc45_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc46_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc47_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc48_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc49_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc50_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc51_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc52_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc53_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc54_i_U}
    }
  }
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_proc.28 MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_proc_28 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_proc_28}
  {SRCNAME initialize_z_buffer.10 MODELNAME initialize_z_buffer_10 RTLNAME ocnn6_net_8_layer_pipeline_initialize_z_buffer_10}
  {SRCNAME compute_single_voxel_parallel.11 MODELNAME compute_single_voxel_parallel_11 RTLNAME ocnn6_net_8_layer_pipeline_compute_single_voxel_parallel_11}
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights3_rd_engine_initialized_f MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights3_rd_engine_initialized_f RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights3_rd_engine_initialized_f}
  {SRCNAME ocnn6_streaming_layer_pipeline.2 MODELNAME ocnn6_streaming_layer_pipeline_2 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_2
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc30_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc31_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc32_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc33_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc34_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc35_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc36_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc37_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc38_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc39_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc40_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc41_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc42_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc43_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc44_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc45_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc46_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc47_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc48_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc49_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc50_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc51_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc52_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc53_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc54_i_U}
    }
  }
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_proc.29 MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_proc_29 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_proc_29}
  {SRCNAME initialize_z_buffer.12 MODELNAME initialize_z_buffer_12 RTLNAME ocnn6_net_8_layer_pipeline_initialize_z_buffer_12}
  {SRCNAME compute_single_voxel_parallel.13 MODELNAME compute_single_voxel_parallel_13 RTLNAME ocnn6_net_8_layer_pipeline_compute_single_voxel_parallel_13}
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights4_rd_engine_initialized_f MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights4_rd_engine_initialized_f RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights4_rd_engine_initialized_f}
  {SRCNAME ocnn6_streaming_layer_pipeline.3 MODELNAME ocnn6_streaming_layer_pipeline_3 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_3
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc30_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc31_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc32_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc33_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc34_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc35_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc36_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc37_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc38_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc39_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc40_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc41_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc42_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc43_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc44_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc45_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc46_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc47_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc48_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc49_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc50_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc51_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc52_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc53_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x1 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc54_i_U}
    }
  }
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_proc.30 MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_proc_30 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_proc_30}
  {SRCNAME initialize_z_buffer.14 MODELNAME initialize_z_buffer_14 RTLNAME ocnn6_net_8_layer_pipeline_initialize_z_buffer_14}
  {SRCNAME compute_single_voxel_parallel.15 MODELNAME compute_single_voxel_parallel_15 RTLNAME ocnn6_net_8_layer_pipeline_compute_single_voxel_parallel_15}
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights5_rd_engine_initialized_f MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights5_rd_engine_initialized_f RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights5_rd_engine_initialized_f}
  {SRCNAME ocnn6_streaming_layer_pipeline.4 MODELNAME ocnn6_streaming_layer_pipeline_4 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_4
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc30_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc31_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc32_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc33_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc34_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc35_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc36_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc37_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc38_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc39_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc40_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc41_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc42_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc43_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc44_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc45_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc46_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc47_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc48_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc49_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc50_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc51_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc52_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc53_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x2 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc54_i_U}
    }
  }
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_proc.31 MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_proc_31 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_proc_31}
  {SRCNAME initialize_z_buffer.16 MODELNAME initialize_z_buffer_16 RTLNAME ocnn6_net_8_layer_pipeline_initialize_z_buffer_16}
  {SRCNAME compute_single_voxel_parallel.17 MODELNAME compute_single_voxel_parallel_17 RTLNAME ocnn6_net_8_layer_pipeline_compute_single_voxel_parallel_17}
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights6_rd_engine_initialized_f MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights6_rd_engine_initialized_f RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights6_rd_engine_initialized_f}
  {SRCNAME ocnn6_streaming_layer_pipeline.5 MODELNAME ocnn6_streaming_layer_pipeline_5 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_5
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc30_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc31_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc32_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc33_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc34_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc35_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc36_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc37_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc38_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc39_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc40_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc41_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc42_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc43_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc44_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc45_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc46_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc47_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc48_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc49_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc50_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc51_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc52_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc53_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x3 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc54_i_U}
    }
  }
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_proc.32 MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_proc_32 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_proc_32}
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights7_rd_engine_initialized_f MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights7_rd_engine_initialized_f RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights7_rd_engine_initialized_f}
  {SRCNAME ocnn6_streaming_layer_pipeline.6 MODELNAME ocnn6_streaming_layer_pipeline_6 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_6
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc30_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc31_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc32_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc33_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc34_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc35_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc36_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc37_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc38_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc39_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc40_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc41_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc42_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc43_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc44_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc45_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc46_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc47_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc48_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc49_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc50_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc51_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc52_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc53_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x4 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc54_i_U}
    }
  }
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_proc.33 MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_proc_33 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_proc_33}
  {SRCNAME initialize_z_buffer.18 MODELNAME initialize_z_buffer_18 RTLNAME ocnn6_net_8_layer_pipeline_initialize_z_buffer_18}
  {SRCNAME compute_single_voxel_parallel.19 MODELNAME compute_single_voxel_parallel_19 RTLNAME ocnn6_net_8_layer_pipeline_compute_single_voxel_parallel_19}
  {SRCNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights8_rd_engine_initialized_f MODELNAME ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights8_rd_engine_initialized_f RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights8_rd_engine_initialized_f}
  {SRCNAME ocnn6_streaming_layer_pipeline.7 MODELNAME ocnn6_streaming_layer_pipeline_7 RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_streaming_layer_pipeline_7
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc30_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc31_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc32_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc33_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc34_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc35_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc36_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc37_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc38_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc39_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc40_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc41_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc42_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc43_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc44_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc45_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc46_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc47_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc48_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc49_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc50_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc51_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc52_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc53_i_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x5 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc54_i_U}
    }
  }
  {SRCNAME ocnn6_assembly_line_8_layers MODELNAME ocnn6_assembly_line_8_layers RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_assembly_line_8_layers
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_ocnn6_assembly_line_8_layers_ocnn6_streaming_layer_pipeline_stream_stream_floeOg RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_assembly_line_8_layers_ocnn6_streaming_layer_pipeline_stream_stream_floeOg BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ocnn6_net_8_layer_pipeline_ocnn6_assembly_line_8_layers_ocnn6_streaming_layer_pipeline_stream_stream_floCeG RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_assembly_line_8_layers_ocnn6_streaming_layer_pipeline_stream_stream_floCeG BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ocnn6_net_8_layer_pipeline_ocnn6_assembly_line_8_layers_ocnn6_streaming_layer_pipeline_stream_stream_floKfY RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_assembly_line_8_layers_ocnn6_streaming_layer_pipeline_stream_stream_floKfY BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME layer_streams_1_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME layer_streams_2_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME layer_streams_3_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME layer_streams_4_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME layer_streams_5_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME layer_streams_6_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME layer_streams_7_U}
    }
  }
  {SRCNAME Block_entry_proc.25 MODELNAME Block_entry_proc_25 RTLNAME ocnn6_net_8_layer_pipeline_Block_entry_proc_25
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A_x RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A_x BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME initial_stream_i_U}
    }
  }
  {SRCNAME ocnn6_final_layer_output_reconstruction_streaming MODELNAME ocnn6_final_layer_output_reconstruction_streaming RTLNAME ocnn6_net_8_layer_pipeline_ocnn6_final_layer_output_reconstruction_streaming}
  {SRCNAME ocnn6_net_8_layer_pipeline MODELNAME ocnn6_net_8_layer_pipeline RTLNAME ocnn6_net_8_layer_pipeline IS_TOP 1
    SUBMODULES {
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x6 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x6 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME final_output_full_cubic_c_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x6 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x6 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME pruned_feature_dram_read_c_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME feature_data_stream_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w60_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w60_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME write_addr_stream_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME pruned_voxel_count_0_loc_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME wide_trip_count_loc_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w34_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w34_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME p_loc_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME pruned_voxel_count_0_reload_loc_c1_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w9_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w9_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME current_morton_list_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A RTLNAME ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME pruned_voxel_count_0_reload_loc_c_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A_x0 RTLNAME ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A_x0 BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME layer_pipeline_streams_8_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_start_for_Loop_VITIS_LOOP_131_1_proc_U0 RTLNAME ocnn6_net_8_layer_pipeline_start_for_Loop_VITIS_LOOP_131_1_proc_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_131_1_proc_U0_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_start_for_ocnn6_final_layer_output_reconstruction_streaming_U0 RTLNAME ocnn6_net_8_layer_pipeline_start_for_ocnn6_final_layer_output_reconstruction_streaming_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_ocnn6_final_layer_output_reconstruction_streaming_U0_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_start_for_Block_entry_proc_24_U0 RTLNAME ocnn6_net_8_layer_pipeline_start_for_Block_entry_proc_24_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Block_entry_proc_24_U0_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_start_for_Loop_VITIS_LOOP_209_5_proc_U0 RTLNAME ocnn6_net_8_layer_pipeline_start_for_Loop_VITIS_LOOP_209_5_proc_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_209_5_proc_U0_U}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_output_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_output_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_weights1_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_weights1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_weights2_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_weights2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_weights3_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_weights3_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_weights4_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_weights4_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_weights5_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_weights5_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_weights6_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_weights6_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_weights7_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_weights7_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_weights8_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_weights8_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_bias1_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_bias1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_bias2_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_bias2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_bias3_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_bias3_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_bias4_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_bias4_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_bias5_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_bias5_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_bias6_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_bias6_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_bias7_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_bias7_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_bias8_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_bias8_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_gmem_read_m_axi RTLNAME ocnn6_net_8_layer_pipeline_gmem_read_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ocnn6_net_8_layer_pipeline_control_s_axi RTLNAME ocnn6_net_8_layer_pipeline_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
