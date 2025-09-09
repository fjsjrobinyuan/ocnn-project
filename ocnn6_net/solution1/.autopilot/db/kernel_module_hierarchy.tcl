set ModuleHierarchy {[{
"Name" : "ocnn6_net_8_layer_pipeline","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "pipeline_bitmap_stage_U0","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_streaming_bitmap_constructor_fu_106","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_111_1_VITIS_LOOP_112_2_VITIS_LOOP_113_3","ID" : "3","Type" : "pipeline"},
			{"Name" : "VITIS_LOOP_118_4_VITIS_LOOP_119_5_VITIS_LOOP_120_6","ID" : "4","Type" : "pipeline"},
			{"Name" : "VITIS_LOOP_125_7_VITIS_LOOP_126_8","ID" : "5","Type" : "pipeline"},
			{"Name" : "VOXEL_PROCESSING","ID" : "6","Type" : "pipeline"},
			{"Name" : "L0_TO_L1_PRUNING","ID" : "7","Type" : "pipeline"},
			{"Name" : "L1_TO_L2_PRUNING","ID" : "8","Type" : "pipeline"},
			{"Name" : "VITIS_LOOP_258_18_VITIS_LOOP_260_19","ID" : "9","Type" : "pipeline"},
			{"Name" : "VITIS_LOOP_275_20","ID" : "10","Type" : "pipeline"},]},]},
	{"Name" : "entry_proc_U0","ID" : "11","Type" : "sequential"},
	{"Name" : "Loop_VITIS_LOOP_131_1_proc_U0","ID" : "12","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_131_1","ID" : "13","Type" : "pipeline"},]},
	{"Name" : "Block_entry_proc_24_U0","ID" : "14","Type" : "sequential"},
	{"Name" : "Loop_VITIS_LOOP_209_5_proc_U0","ID" : "15","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_209_5","ID" : "16","Type" : "pipeline"},]},
	{"Name" : "Block_entry_proc_25_U0","ID" : "17","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_ocnn6_assembly_line_8_layers_fu_611","ID" : "18","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_ocnn6_streaming_layer_pipeline_fu_536","ID" : "19","Type" : "dataflow",
				"SubInsts" : [
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_proc_U0","ID" : "20","Type" : "sequential"},
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights1_rd_engine_initialized_f_U0","ID" : "21","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_initialize_z_buffer_fu_763","ID" : "22","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_reset_fu_304","ID" : "23","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "RESET_SPATIAL_COVERAGE","ID" : "24","Type" : "pipeline"},]},],
						"SubLoops" : [
						{"Name" : "STORE_WEIGHTS_VITIS_LOOP_326_1","ID" : "25","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "STREAMING_VOXEL_PROCESSING","ID" : "26","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_compute_single_voxel_parallel_fu_967","ID" : "27","Type" : "sequential"},]},]},]},
			{"Name" : "grp_ocnn6_streaming_layer_pipeline_1_fu_746","ID" : "28","Type" : "dataflow",
				"SubInsts" : [
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_proc_27_U0","ID" : "29","Type" : "sequential"},
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights2_rd_engine_initialized_f_U0","ID" : "30","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_initialize_z_buffer_8_fu_765","ID" : "31","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_reset_fu_306","ID" : "32","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "RESET_SPATIAL_COVERAGE","ID" : "33","Type" : "pipeline"},]},],
						"SubLoops" : [
						{"Name" : "STORE_WEIGHTS_VITIS_LOOP_326_1","ID" : "34","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "STREAMING_VOXEL_PROCESSING","ID" : "35","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_compute_single_voxel_parallel_9_fu_969","ID" : "36","Type" : "sequential"},]},]},]},
			{"Name" : "grp_ocnn6_streaming_layer_pipeline_2_fu_955","ID" : "37","Type" : "dataflow",
				"SubInsts" : [
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_proc_28_U0","ID" : "38","Type" : "sequential"},
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights3_rd_engine_initialized_f_U0","ID" : "39","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_initialize_z_buffer_10_fu_765","ID" : "40","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_reset_fu_306","ID" : "41","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "RESET_SPATIAL_COVERAGE","ID" : "42","Type" : "pipeline"},]},],
						"SubLoops" : [
						{"Name" : "STORE_WEIGHTS_VITIS_LOOP_326_1","ID" : "43","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "STREAMING_VOXEL_PROCESSING","ID" : "44","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_compute_single_voxel_parallel_11_fu_969","ID" : "45","Type" : "sequential"},]},]},]},
			{"Name" : "grp_ocnn6_streaming_layer_pipeline_3_fu_1164","ID" : "46","Type" : "dataflow",
				"SubInsts" : [
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_proc_29_U0","ID" : "47","Type" : "sequential"},
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights4_rd_engine_initialized_f_U0","ID" : "48","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_initialize_z_buffer_12_fu_765","ID" : "49","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_reset_fu_306","ID" : "50","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "RESET_SPATIAL_COVERAGE","ID" : "51","Type" : "pipeline"},]},],
						"SubLoops" : [
						{"Name" : "STORE_WEIGHTS_VITIS_LOOP_326_1","ID" : "52","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "STREAMING_VOXEL_PROCESSING","ID" : "53","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_compute_single_voxel_parallel_13_fu_969","ID" : "54","Type" : "sequential"},]},]},]},
			{"Name" : "grp_ocnn6_streaming_layer_pipeline_4_fu_1373","ID" : "55","Type" : "dataflow",
				"SubInsts" : [
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_proc_30_U0","ID" : "56","Type" : "sequential"},
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights5_rd_engine_initialized_f_U0","ID" : "57","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_initialize_z_buffer_14_fu_763","ID" : "58","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_reset_fu_304","ID" : "59","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "RESET_SPATIAL_COVERAGE","ID" : "60","Type" : "pipeline"},]},],
						"SubLoops" : [
						{"Name" : "STORE_WEIGHTS_VITIS_LOOP_326_1","ID" : "61","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "STREAMING_VOXEL_PROCESSING","ID" : "62","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_compute_single_voxel_parallel_15_fu_967","ID" : "63","Type" : "sequential"},]},]},]},
			{"Name" : "grp_ocnn6_streaming_layer_pipeline_5_fu_1582","ID" : "64","Type" : "dataflow",
				"SubInsts" : [
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_proc_31_U0","ID" : "65","Type" : "sequential"},
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights6_rd_engine_initialized_f_U0","ID" : "66","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_initialize_z_buffer_16_fu_765","ID" : "67","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_reset_fu_306","ID" : "68","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "RESET_SPATIAL_COVERAGE","ID" : "69","Type" : "pipeline"},]},],
						"SubLoops" : [
						{"Name" : "STORE_WEIGHTS_VITIS_LOOP_326_1","ID" : "70","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "STREAMING_VOXEL_PROCESSING","ID" : "71","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_compute_single_voxel_parallel_17_fu_969","ID" : "72","Type" : "sequential"},]},]},]},
			{"Name" : "grp_ocnn6_streaming_layer_pipeline_6_fu_1791","ID" : "73","Type" : "dataflow",
				"SubInsts" : [
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_proc_32_U0","ID" : "74","Type" : "sequential"},
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights7_rd_engine_initialized_f_U0","ID" : "75","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_initialize_z_buffer_12_fu_765","ID" : "76","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_reset_fu_306","ID" : "77","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "RESET_SPATIAL_COVERAGE","ID" : "78","Type" : "pipeline"},]},],
						"SubLoops" : [
						{"Name" : "STORE_WEIGHTS_VITIS_LOOP_326_1","ID" : "79","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "STREAMING_VOXEL_PROCESSING","ID" : "80","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_compute_single_voxel_parallel_13_fu_969","ID" : "81","Type" : "sequential"},]},]},]},
			{"Name" : "grp_ocnn6_streaming_layer_pipeline_7_fu_2000","ID" : "82","Type" : "dataflow",
				"SubInsts" : [
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_proc_33_U0","ID" : "83","Type" : "sequential"},
				{"Name" : "ocnn6_streaming_layer_pipeline_Block_entry_gmem_weights8_rd_engine_initialized_f_U0","ID" : "84","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_initialize_z_buffer_18_fu_767","ID" : "85","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_reset_fu_308","ID" : "86","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "RESET_SPATIAL_COVERAGE","ID" : "87","Type" : "pipeline"},]},],
						"SubLoops" : [
						{"Name" : "STORE_WEIGHTS_VITIS_LOOP_326_1","ID" : "88","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "STREAMING_VOXEL_PROCESSING","ID" : "89","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_compute_single_voxel_parallel_19_fu_971","ID" : "90","Type" : "sequential"},]},]},]},]},],
		"SubLoops" : [
		{"Name" : "INIT_FIRST_STREAM","ID" : "91","Type" : "pipeline"},
		{"Name" : "INIT_PIPELINE_STREAM","ID" : "92","Type" : "pipeline"},]},
	{"Name" : "ocnn6_final_layer_output_reconstruction_streaming_U0","ID" : "93","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "INIT_FULL_OUTPUT","ID" : "94","Type" : "pipeline"},
		{"Name" : "RECONSTRUCT_FROM_STREAM","ID" : "95","Type" : "pipeline"},]},
	{"Name" : "Block_entry_proc_U0","ID" : "96","Type" : "sequential"},]
}]}