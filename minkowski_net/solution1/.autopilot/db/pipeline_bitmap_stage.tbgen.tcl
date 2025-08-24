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
set cdfgNum 9
set C_modelName {pipeline_bitmap_stage}
set C_modelType { int 1696 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ input_voxel_stream int 1085 regular {fifo 0 volatile }  }
	{ feature_data_stream int 1085 regular {fifo 1 volatile }  }
	{ write_addr_stream int 60 regular {fifo 1 volatile }  }
	{ L3_bitmap_read int 512 regular  }
	{ L2_bitmap int 512 regular {pointer 2}  }
	{ L1_bitmap_read int 512 regular  }
	{ L0_bitmap_read int 512 regular  }
	{ initial_processed_voxels_constprop int 32 regular {pointer 2} {global 2}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "input_voxel_stream", "interface" : "fifo", "bitwidth" : 1085, "direction" : "READONLY"} , 
 	{ "Name" : "feature_data_stream", "interface" : "fifo", "bitwidth" : 1085, "direction" : "WRITEONLY"} , 
 	{ "Name" : "write_addr_stream", "interface" : "fifo", "bitwidth" : 60, "direction" : "WRITEONLY"} , 
 	{ "Name" : "L3_bitmap_read", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "L2_bitmap", "interface" : "wire", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "L1_bitmap_read", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "L0_bitmap_read", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "initial_processed_voxels_constprop", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1696} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_voxel_stream_dout sc_in sc_lv 1085 signal 0 } 
	{ input_voxel_stream_empty_n sc_in sc_logic 1 signal 0 } 
	{ input_voxel_stream_read sc_out sc_logic 1 signal 0 } 
	{ feature_data_stream_din sc_out sc_lv 1085 signal 1 } 
	{ feature_data_stream_full_n sc_in sc_logic 1 signal 1 } 
	{ feature_data_stream_write sc_out sc_logic 1 signal 1 } 
	{ write_addr_stream_din sc_out sc_lv 60 signal 2 } 
	{ write_addr_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ write_addr_stream_write sc_out sc_logic 1 signal 2 } 
	{ L3_bitmap_read sc_in sc_lv 512 signal 3 } 
	{ L2_bitmap_i sc_in sc_lv 512 signal 4 } 
	{ L2_bitmap_o sc_out sc_lv 512 signal 4 } 
	{ L2_bitmap_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ L1_bitmap_read sc_in sc_lv 512 signal 5 } 
	{ L0_bitmap_read sc_in sc_lv 512 signal 6 } 
	{ initial_processed_voxels_constprop_i sc_in sc_lv 32 signal 7 } 
	{ initial_processed_voxels_constprop_o sc_out sc_lv 32 signal 7 } 
	{ initial_processed_voxels_constprop_o_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ ap_return_0 sc_out sc_lv 160 signal -1 } 
	{ ap_return_1 sc_out sc_lv 512 signal -1 } 
	{ ap_return_2 sc_out sc_lv 512 signal -1 } 
	{ ap_return_3 sc_out sc_lv 512 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_voxel_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1085, "type": "signal", "bundle":{"name": "input_voxel_stream", "role": "dout" }} , 
 	{ "name": "input_voxel_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_voxel_stream", "role": "empty_n" }} , 
 	{ "name": "input_voxel_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_voxel_stream", "role": "read" }} , 
 	{ "name": "feature_data_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1085, "type": "signal", "bundle":{"name": "feature_data_stream", "role": "din" }} , 
 	{ "name": "feature_data_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feature_data_stream", "role": "full_n" }} , 
 	{ "name": "feature_data_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feature_data_stream", "role": "write" }} , 
 	{ "name": "write_addr_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":60, "type": "signal", "bundle":{"name": "write_addr_stream", "role": "din" }} , 
 	{ "name": "write_addr_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "write_addr_stream", "role": "full_n" }} , 
 	{ "name": "write_addr_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "write_addr_stream", "role": "write" }} , 
 	{ "name": "L3_bitmap_read", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L3_bitmap_read", "role": "default" }} , 
 	{ "name": "L2_bitmap_i", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L2_bitmap", "role": "i" }} , 
 	{ "name": "L2_bitmap_o", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L2_bitmap", "role": "o" }} , 
 	{ "name": "L2_bitmap_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "L2_bitmap", "role": "o_ap_vld" }} , 
 	{ "name": "L1_bitmap_read", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L1_bitmap_read", "role": "default" }} , 
 	{ "name": "L0_bitmap_read", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "L0_bitmap_read", "role": "default" }} , 
 	{ "name": "initial_processed_voxels_constprop_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "initial_processed_voxels_constprop", "role": "i" }} , 
 	{ "name": "initial_processed_voxels_constprop_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "initial_processed_voxels_constprop", "role": "o" }} , 
 	{ "name": "initial_processed_voxels_constprop_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "initial_processed_voxels_constprop", "role": "o_ap_vld" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":160, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "pipeline_bitmap_stage",
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
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_voxel_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "input_voxel_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "feature_data_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "feature_data_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "write_addr_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "write_addr_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "L3_bitmap_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "L2_bitmap", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "L2_bitmap", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "L1_bitmap_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "L0_bitmap_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "initialized", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "initialized", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "l0_write_pos", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "l0_write_pos", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "l1_write_pos", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "l1_write_pos", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "l2_write_pos", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "l2_write_pos", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "voxel_count", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "voxel_count", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "retained_block_count", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "retained_block_count", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "L1_temp", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "L1_temp", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "L2_temp", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "L2_temp", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "initial_processed_voxels_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streaming_bitmap_constructor_fu_74", "Port" : "initial_processed_voxels_constprop", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"],
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
			{"Name" : "l0_write_pos", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "l1_write_pos", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "l2_write_pos", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "voxel_count", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "retained_block_count", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "L1_temp", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "L2_temp", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "initial_processed_voxels_constprop", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_105_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "29", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state2"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state2_blk"}},
			{"Name" : "VITIS_LOOP_109_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "29", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state4_blk"}},
			{"Name" : "VOXEL_PROCESSING", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "29", "FirstState" : "ap_ST_fsm_pp2_stage0", "FirstStateIter" : "ap_enable_reg_pp2_iter0", "FirstStateBlock" : "ap_block_pp2_stage0_subdone", "LastState" : "ap_ST_fsm_pp2_stage0", "LastStateIter" : "ap_enable_reg_pp2_iter1", "LastStateBlock" : "ap_block_pp2_stage0_subdone", "PreState" : ["ap_ST_fsm_state5"], "QuitState" : "ap_ST_fsm_pp2_stage0", "QuitStateIter" : "ap_enable_reg_pp2_iter1", "QuitStateBlock" : "ap_block_pp2_stage0_subdone", "PostState" : ["ap_ST_fsm_state8"]}},
			{"Name" : "L2_CONSTRUCTION_VITIS_LOOP_134_3", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "29", "FirstState" : "ap_ST_fsm_pp3_stage0", "FirstStateIter" : "ap_enable_reg_pp3_iter0", "FirstStateBlock" : "ap_block_pp3_stage0_subdone", "LastState" : "ap_ST_fsm_pp3_stage0", "LastStateIter" : "ap_enable_reg_pp3_iter1", "LastStateBlock" : "ap_block_pp3_stage0_subdone", "PreState" : ["ap_ST_fsm_state8"], "QuitState" : "ap_ST_fsm_pp3_stage0", "QuitStateIter" : "ap_enable_reg_pp3_iter1", "QuitStateBlock" : "ap_block_pp3_stage0_subdone", "PostState" : ["ap_ST_fsm_state26"]}},
			{"Name" : "VITIS_LOOP_176_8", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "29", "FirstState" : "ap_ST_fsm_pp4_stage0", "FirstStateIter" : "ap_enable_reg_pp4_iter0", "FirstStateBlock" : "ap_block_pp4_stage0_subdone", "LastState" : "ap_ST_fsm_pp4_stage0", "LastStateIter" : "ap_enable_reg_pp4_iter1", "LastStateBlock" : "ap_block_pp4_stage0_subdone", "PreState" : ["ap_ST_fsm_state26"], "QuitState" : "ap_ST_fsm_pp4_stage0", "QuitStateIter" : "ap_enable_reg_pp4_iter1", "QuitStateBlock" : "ap_block_pp4_stage0_subdone", "PostState" : ["ap_ST_fsm_state29"]}},
			{"Name" : "VITIS_LOOP_189_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "29", "FirstState" : "ap_ST_fsm_state30", "LastState" : ["ap_ST_fsm_state30"], "QuitState" : ["ap_ST_fsm_state30"], "PreState" : ["ap_ST_fsm_state29"], "PostState" : ["ap_ST_fsm_state31"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state30_blk"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.L1_temp_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.L2_temp_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1s_512_1_1_U1", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U2", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U3", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U4", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U5", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U6", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U7", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U8", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U9", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U10", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U11", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U12", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U13", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U14", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U15", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U16", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U17", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_8ns_8ns_32ns_1ns_8_1_1_U18", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitselect_1ns_8ns_32ns_1_1_1_U19", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streaming_bitmap_constructor_fu_74.bitset_512ns_512ns_32s_1ns_512_1_1_U20", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	pipeline_bitmap_stage {
		input_voxel_stream {Type I LastRead 5 FirstWrite -1}
		feature_data_stream {Type O LastRead 6 FirstWrite 6}
		write_addr_stream {Type O LastRead 6 FirstWrite 6}
		L3_bitmap_read {Type I LastRead 1 FirstWrite -1}
		L2_bitmap {Type IO LastRead 0 FirstWrite 12}
		L1_bitmap_read {Type I LastRead 1 FirstWrite -1}
		L0_bitmap_read {Type I LastRead 1 FirstWrite -1}
		initialized {Type IO LastRead -1 FirstWrite -1}
		l0_write_pos {Type IO LastRead -1 FirstWrite -1}
		l1_write_pos {Type IO LastRead -1 FirstWrite -1}
		l2_write_pos {Type IO LastRead -1 FirstWrite -1}
		voxel_count {Type IO LastRead -1 FirstWrite -1}
		retained_block_count {Type IO LastRead -1 FirstWrite -1}
		L1_temp {Type IO LastRead -1 FirstWrite -1}
		L2_temp {Type IO LastRead -1 FirstWrite -1}
		initial_processed_voxels_constprop {Type IO LastRead 5 FirstWrite 5}}
	streaming_bitmap_constructor {
		input_voxel_stream {Type I LastRead 5 FirstWrite -1}
		feature_data_stream {Type O LastRead 6 FirstWrite 6}
		write_addr_stream {Type O LastRead 6 FirstWrite 6}
		p_read {Type I LastRead 0 FirstWrite -1}
		L2_bitmap {Type O LastRead -1 FirstWrite 12}
		L2_bitmap_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		initialized {Type IO LastRead -1 FirstWrite -1}
		l0_write_pos {Type IO LastRead -1 FirstWrite -1}
		l1_write_pos {Type IO LastRead -1 FirstWrite -1}
		l2_write_pos {Type IO LastRead -1 FirstWrite -1}
		voxel_count {Type IO LastRead -1 FirstWrite -1}
		retained_block_count {Type IO LastRead -1 FirstWrite -1}
		L1_temp {Type IO LastRead -1 FirstWrite -1}
		L2_temp {Type IO LastRead -1 FirstWrite -1}
		initial_processed_voxels_constprop {Type IO LastRead 5 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_voxel_stream { ap_fifo {  { input_voxel_stream_dout fifo_data_in 0 1085 }  { input_voxel_stream_empty_n fifo_status 0 1 }  { input_voxel_stream_read fifo_port_we 1 1 } } }
	feature_data_stream { ap_fifo {  { feature_data_stream_din fifo_data_in 1 1085 }  { feature_data_stream_full_n fifo_status 0 1 }  { feature_data_stream_write fifo_port_we 1 1 } } }
	write_addr_stream { ap_fifo {  { write_addr_stream_din fifo_data_in 1 60 }  { write_addr_stream_full_n fifo_status 0 1 }  { write_addr_stream_write fifo_port_we 1 1 } } }
	L3_bitmap_read { ap_none {  { L3_bitmap_read in_data 0 512 } } }
	L2_bitmap { ap_ovld {  { L2_bitmap_i in_data 0 512 }  { L2_bitmap_o out_data 1 512 }  { L2_bitmap_o_ap_vld out_vld 1 1 } } }
	L1_bitmap_read { ap_none {  { L1_bitmap_read in_data 0 512 } } }
	L0_bitmap_read { ap_none {  { L0_bitmap_read in_data 0 512 } } }
	initial_processed_voxels_constprop { ap_ovld {  { initial_processed_voxels_constprop_i in_data 0 32 }  { initial_processed_voxels_constprop_o out_data 1 32 }  { initial_processed_voxels_constprop_o_ap_vld out_vld 1 1 } } }
}
