set moduleName pipeline_bitmap_stage
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 52
set C_modelName {pipeline_bitmap_stage}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ input_voxel_stream int 1085 regular {fifo 0 volatile }  }
	{ feature_data_stream int 1085 regular {fifo 1 volatile }  }
	{ write_addr_stream int 60 regular {fifo 1 volatile }  }
	{ L3_bitmap int 512 regular {pointer 2}  }
	{ L2_bitmap int 512 regular {pointer 2}  }
	{ L1_bitmap int 512 regular {pointer 2}  }
	{ L0_bitmap int 512 regular {pointer 2}  }
	{ bitmap_info int 160 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "input_voxel_stream", "interface" : "fifo", "bitwidth" : 1085, "direction" : "READONLY"} , 
 	{ "Name" : "feature_data_stream", "interface" : "fifo", "bitwidth" : 1085, "direction" : "WRITEONLY"} , 
 	{ "Name" : "write_addr_stream", "interface" : "fifo", "bitwidth" : 60, "direction" : "WRITEONLY"} , 
 	{ "Name" : "L3_bitmap", "interface" : "wire", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "L2_bitmap", "interface" : "wire", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "L1_bitmap", "interface" : "wire", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "L0_bitmap", "interface" : "wire", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "bitmap_info", "interface" : "wire", "bitwidth" : 160, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_voxel_stream_dout sc_in sc_lv 1085 signal 0 } 
	{ input_voxel_stream_empty_n sc_in sc_logic 1 signal 0 } 
	{ input_voxel_stream_read sc_out sc_logic 1 signal 0 } 
	{ feature_data_stream_din sc_out sc_lv 1085 signal 1 } 
	{ feature_data_stream_full_n sc_in sc_logic 1 signal 1 } 
	{ feature_data_stream_write sc_out sc_logic 1 signal 1 } 
	{ feature_data_stream_num_data_valid sc_in sc_lv 11 signal 1 } 
	{ feature_data_stream_fifo_cap sc_in sc_lv 11 signal 1 } 
	{ write_addr_stream_din sc_out sc_lv 60 signal 2 } 
	{ write_addr_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ write_addr_stream_write sc_out sc_logic 1 signal 2 } 
	{ write_addr_stream_num_data_valid sc_in sc_lv 11 signal 2 } 
	{ write_addr_stream_fifo_cap sc_in sc_lv 11 signal 2 } 
	{ L3_bitmap_i sc_in sc_lv 512 signal 3 } 
	{ L3_bitmap_o sc_out sc_lv 512 signal 3 } 
	{ L3_bitmap_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ L2_bitmap_i sc_in sc_lv 512 signal 4 } 
	{ L2_bitmap_o sc_out sc_lv 512 signal 4 } 
	{ L2_bitmap_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ L1_bitmap_i sc_in sc_lv 512 signal 5 } 
	{ L1_bitmap_o sc_out sc_lv 512 signal 5 } 
	{ L1_bitmap_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ L0_bitmap_i sc_in sc_lv 512 signal 6 } 
	{ L0_bitmap_o sc_out sc_lv 512 signal 6 } 
	{ L0_bitmap_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ bitmap_info sc_out sc_lv 160 signal 7 } 
	{ bitmap_info_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_voxel_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1085, "type": "signal", "bundle":{"name": "input_voxel_stream", "role": "dout" }} , 
 	{ "name": "input_voxel_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_voxel_stream", "role": "empty_n" }} , 
 	{ "name": "input_voxel_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_voxel_stream", "role": "read" }} , 
 	{ "name": "feature_data_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1085, "type": "signal", "bundle":{"name": "feature_data_stream", "role": "din" }} , 
 	{ "name": "feature_data_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feature_data_stream", "role": "full_n" }} , 
 	{ "name": "feature_data_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feature_data_stream", "role": "write" }} , 
 	{ "name": "feature_data_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "feature_data_stream", "role": "num_data_valid" }} , 
 	{ "name": "feature_data_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "feature_data_stream", "role": "fifo_cap" }} , 
 	{ "name": "write_addr_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":60, "type": "signal", "bundle":{"name": "write_addr_stream", "role": "din" }} , 
 	{ "name": "write_addr_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "write_addr_stream", "role": "full_n" }} , 
 	{ "name": "write_addr_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "write_addr_stream", "role": "write" }} , 
 	{ "name": "write_addr_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "write_addr_stream", "role": "num_data_valid" }} , 
 	{ "name": "write_addr_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "write_addr_stream", "role": "fifo_cap" }} , 
 	{ "name": "L3_bitmap_i", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L3_bitmap", "role": "i" }} , 
 	{ "name": "L3_bitmap_o", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L3_bitmap", "role": "o" }} , 
 	{ "name": "L3_bitmap_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "L3_bitmap", "role": "o_ap_vld" }} , 
 	{ "name": "L2_bitmap_i", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L2_bitmap", "role": "i" }} , 
 	{ "name": "L2_bitmap_o", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L2_bitmap", "role": "o" }} , 
 	{ "name": "L2_bitmap_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "L2_bitmap", "role": "o_ap_vld" }} , 
 	{ "name": "L1_bitmap_i", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L1_bitmap", "role": "i" }} , 
 	{ "name": "L1_bitmap_o", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L1_bitmap", "role": "o" }} , 
 	{ "name": "L1_bitmap_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "L1_bitmap", "role": "o_ap_vld" }} , 
 	{ "name": "L0_bitmap_i", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L0_bitmap", "role": "i" }} , 
 	{ "name": "L0_bitmap_o", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L0_bitmap", "role": "o" }} , 
 	{ "name": "L0_bitmap_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "L0_bitmap", "role": "o_ap_vld" }} , 
 	{ "name": "bitmap_info", "direction": "out", "datatype": "sc_lv", "bitwidth":160, "type": "signal", "bundle":{"name": "bitmap_info", "role": "default" }} , 
 	{ "name": "bitmap_info_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "bitmap_info", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "pipeline_bitmap_stage",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_voxel_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "input_voxel_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "feature_data_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "feature_data_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "write_addr_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "write_addr_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "L3_bitmap", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "L2_bitmap", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "L2_bitmap", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "L1_bitmap", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "L0_bitmap", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "bitmap_info", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "initialized", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "initialized", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "l2_write_pos", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "l2_write_pos", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "voxel_count", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "voxel_count", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "retained_block_count", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "retained_block_count", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "l0_write_pos", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "l0_write_pos", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "l1_write_pos", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "l1_write_pos", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "l2_temp_buffer", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_106", "Port" : "l2_temp_buffer", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47"],
		"CDFG" : "streaming_bitmap_constructor",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_voxel_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_voxel_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "feature_data_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "feature_data_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "write_addr_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "write_addr_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "L2_bitmap", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "L2_bitmap_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "initialized", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "l2_write_pos", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "voxel_count", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "retained_block_count", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "l0_write_pos", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "l1_write_pos", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "l2_temp_buffer", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_111_1_VITIS_LOOP_112_2_VITIS_LOOP_113_3", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "40", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state5"]}},
			{"Name" : "VITIS_LOOP_118_4_VITIS_LOOP_119_5_VITIS_LOOP_120_6", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "40", "FirstState" : "ap_ST_fsm_pp1_stage0", "FirstStateIter" : "ap_enable_reg_pp1_iter0", "FirstStateBlock" : "ap_block_pp1_stage0_subdone", "LastState" : "ap_ST_fsm_pp1_stage0", "LastStateIter" : "ap_enable_reg_pp1_iter1", "LastStateBlock" : "ap_block_pp1_stage0_subdone", "PreState" : ["ap_ST_fsm_state5"], "QuitState" : "ap_ST_fsm_pp1_stage0", "QuitStateIter" : "ap_enable_reg_pp1_iter1", "QuitStateBlock" : "ap_block_pp1_stage0_subdone", "PostState" : ["ap_ST_fsm_state8"]}},
			{"Name" : "VITIS_LOOP_125_7_VITIS_LOOP_126_8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "40", "FirstState" : "ap_ST_fsm_state9", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state9"], "PreState" : ["ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state9_blk"}},
			{"Name" : "VOXEL_PROCESSING", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "40", "FirstState" : "ap_ST_fsm_pp3_stage0", "FirstStateIter" : "ap_enable_reg_pp3_iter0", "FirstStateBlock" : "ap_block_pp3_stage0_subdone", "LastState" : "ap_ST_fsm_pp3_stage0", "LastStateIter" : "ap_enable_reg_pp3_iter1", "LastStateBlock" : "ap_block_pp3_stage0_subdone", "PreState" : ["ap_ST_fsm_state10"], "QuitState" : "ap_ST_fsm_pp3_stage0", "QuitStateIter" : "ap_enable_reg_pp3_iter1", "QuitStateBlock" : "ap_block_pp3_stage0_subdone", "PostState" : ["ap_ST_fsm_state13"]}},
			{"Name" : "L0_TO_L1_PRUNING", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "40", "FirstState" : "ap_ST_fsm_pp4_stage0", "FirstStateIter" : "ap_enable_reg_pp4_iter0", "FirstStateBlock" : "ap_block_pp4_stage0_subdone", "LastState" : "ap_ST_fsm_pp4_stage0", "LastStateIter" : "ap_enable_reg_pp4_iter1", "LastStateBlock" : "ap_block_pp4_stage0_subdone", "PreState" : ["ap_ST_fsm_state13"], "QuitState" : "ap_ST_fsm_pp4_stage1", "QuitStateIter" : "ap_enable_reg_pp4_iter0", "QuitStateBlock" : "ap_block_pp4_stage1_subdone", "PostState" : ["ap_ST_fsm_state31"]}},
			{"Name" : "L1_TO_L2_PRUNING", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "40", "FirstState" : "ap_ST_fsm_pp5_stage0", "FirstStateIter" : "ap_enable_reg_pp5_iter0", "FirstStateBlock" : "ap_block_pp5_stage0_subdone", "LastState" : "ap_ST_fsm_pp5_stage1", "LastStateIter" : "ap_enable_reg_pp5_iter1", "LastStateBlock" : "ap_block_pp5_stage1_subdone", "PreState" : ["ap_ST_fsm_state31"], "QuitState" : "ap_ST_fsm_pp5_stage2", "QuitStateIter" : "ap_enable_reg_pp5_iter0", "QuitStateBlock" : "ap_block_pp5_stage2_subdone", "PostState" : ["ap_ST_fsm_state42"]}},
			{"Name" : "VITIS_LOOP_258_18_VITIS_LOOP_260_19", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "40", "FirstState" : "ap_ST_fsm_pp6_stage0", "FirstStateIter" : "ap_enable_reg_pp6_iter0", "FirstStateBlock" : "ap_block_pp6_stage0_subdone", "LastState" : "ap_ST_fsm_pp6_stage0", "LastStateIter" : "ap_enable_reg_pp6_iter1", "LastStateBlock" : "ap_block_pp6_stage0_subdone", "PreState" : ["ap_ST_fsm_state42"], "QuitState" : "ap_ST_fsm_pp6_stage0", "QuitStateIter" : "ap_enable_reg_pp6_iter1", "QuitStateBlock" : "ap_block_pp6_stage0_subdone", "PostState" : ["ap_ST_fsm_state45"]}},
			{"Name" : "VITIS_LOOP_275_20", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "40", "FirstState" : "ap_ST_fsm_pp7_stage0", "FirstStateIter" : "ap_enable_reg_pp7_iter0", "FirstStateBlock" : "ap_block_pp7_stage0_subdone", "LastState" : "ap_ST_fsm_pp7_stage0", "LastStateIter" : "ap_enable_reg_pp7_iter1", "LastStateBlock" : "ap_block_pp7_stage0_subdone", "PreState" : ["ap_ST_fsm_state45"], "QuitState" : "ap_ST_fsm_pp7_stage0", "QuitStateIter" : "ap_enable_reg_pp7_iter1", "QuitStateBlock" : "ap_block_pp7_stage0_subdone", "PostState" : ["ap_ST_fsm_state48"]}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_2_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_1_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.l2_temp_buffer_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U7", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U8", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U9", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U10", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U11", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U12", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U13", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U14", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U15", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U16", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U17", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U18", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U19", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U20", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U21", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U22", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U23", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U24", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U25", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U26", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U27", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U28", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U29", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U30", "Parent" : "1"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U31", "Parent" : "1"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U32", "Parent" : "1"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U33", "Parent" : "1"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U34", "Parent" : "1"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U35", "Parent" : "1"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U36", "Parent" : "1"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U37", "Parent" : "1"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U38", "Parent" : "1"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U39", "Parent" : "1"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U40", "Parent" : "1"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U41", "Parent" : "1"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U42", "Parent" : "1"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U43", "Parent" : "1"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U44", "Parent" : "1"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U45", "Parent" : "1"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U46", "Parent" : "1"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_64ns_64ns_32ns_1ns_64_1_1_U47", "Parent" : "1"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_106.bitset_512ns_512ns_32s_1ns_512_1_1_U48", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	pipeline_bitmap_stage {
		input_voxel_stream {Type I LastRead 7 FirstWrite -1}
		feature_data_stream {Type O LastRead -1 FirstWrite 8}
		write_addr_stream {Type O LastRead -1 FirstWrite 8}
		L3_bitmap {Type IO LastRead 1 FirstWrite 2}
		L2_bitmap {Type IO LastRead 0 FirstWrite 19}
		L1_bitmap {Type IO LastRead 1 FirstWrite 2}
		L0_bitmap {Type IO LastRead 1 FirstWrite 2}
		bitmap_info {Type O LastRead -1 FirstWrite 2}
		initialized {Type IO LastRead -1 FirstWrite -1}
		l2_write_pos {Type IO LastRead -1 FirstWrite -1}
		voxel_count {Type IO LastRead -1 FirstWrite -1}
		retained_block_count {Type IO LastRead -1 FirstWrite -1}
		l0_write_pos {Type IO LastRead -1 FirstWrite -1}
		l1_write_pos {Type IO LastRead -1 FirstWrite -1}
		streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_2 {Type IO LastRead -1 FirstWrite -1}
		streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_1 {Type IO LastRead -1 FirstWrite -1}
		streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap {Type IO LastRead -1 FirstWrite -1}
		l2_temp_buffer {Type IO LastRead -1 FirstWrite -1}}
	streaming_bitmap_constructor {
		input_voxel_stream {Type I LastRead 7 FirstWrite -1}
		feature_data_stream {Type O LastRead -1 FirstWrite 8}
		write_addr_stream {Type O LastRead -1 FirstWrite 8}
		p_read {Type I LastRead 0 FirstWrite -1}
		L2_bitmap {Type O LastRead -1 FirstWrite 19}
		L2_bitmap_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		initialized {Type IO LastRead -1 FirstWrite -1}
		l2_write_pos {Type IO LastRead -1 FirstWrite -1}
		voxel_count {Type IO LastRead -1 FirstWrite -1}
		retained_block_count {Type IO LastRead -1 FirstWrite -1}
		l0_write_pos {Type IO LastRead -1 FirstWrite -1}
		l1_write_pos {Type IO LastRead -1 FirstWrite -1}
		streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_2 {Type IO LastRead -1 FirstWrite -1}
		streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap_1 {Type IO LastRead -1 FirstWrite -1}
		streaming_bitmap_constructor_stream_stream_stream_stream_stream_ap_uint_ap {Type IO LastRead -1 FirstWrite -1}
		l2_temp_buffer {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_voxel_stream { ap_fifo {  { input_voxel_stream_dout fifo_data_in 0 1085 }  { input_voxel_stream_empty_n fifo_status 0 1 }  { input_voxel_stream_read fifo_port_we 1 1 } } }
	feature_data_stream { ap_fifo {  { feature_data_stream_din fifo_data_in 1 1085 }  { feature_data_stream_full_n fifo_status 0 1 }  { feature_data_stream_write fifo_port_we 1 1 }  { feature_data_stream_num_data_valid fifo_status_num_data_valid 0 11 }  { feature_data_stream_fifo_cap fifo_update 0 11 } } }
	write_addr_stream { ap_fifo {  { write_addr_stream_din fifo_data_in 1 60 }  { write_addr_stream_full_n fifo_status 0 1 }  { write_addr_stream_write fifo_port_we 1 1 }  { write_addr_stream_num_data_valid fifo_status_num_data_valid 0 11 }  { write_addr_stream_fifo_cap fifo_update 0 11 } } }
	L3_bitmap { ap_ovld {  { L3_bitmap_i in_data 0 512 }  { L3_bitmap_o out_data 1 512 }  { L3_bitmap_o_ap_vld out_vld 1 1 } } }
	L2_bitmap { ap_ovld {  { L2_bitmap_i in_data 0 512 }  { L2_bitmap_o out_data 1 512 }  { L2_bitmap_o_ap_vld out_vld 1 1 } } }
	L1_bitmap { ap_ovld {  { L1_bitmap_i in_data 0 512 }  { L1_bitmap_o out_data 1 512 }  { L1_bitmap_o_ap_vld out_vld 1 1 } } }
	L0_bitmap { ap_ovld {  { L0_bitmap_i in_data 0 512 }  { L0_bitmap_o out_data 1 512 }  { L0_bitmap_o_ap_vld out_vld 1 1 } } }
	bitmap_info { ap_vld {  { bitmap_info out_data 1 160 }  { bitmap_info_ap_vld out_vld 1 1 } } }
}
