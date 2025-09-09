set moduleName Loop_VITIS_LOOP_209_5_proc
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
set C_modelName {Loop_VITIS_LOOP_209_5_proc}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ pruned_voxel_count_0_reload_loc int 32 regular {fifo 0}  }
	{ current_morton_list int 9 regular {fifo 1 volatile }  }
	{ pruned_voxel_count_0_reload_loc_c int 32 regular {fifo 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "pruned_voxel_count_0_reload_loc", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "current_morton_list", "interface" : "fifo", "bitwidth" : 9, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pruned_voxel_count_0_reload_loc_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ pruned_voxel_count_0_reload_loc_dout sc_in sc_lv 32 signal 0 } 
	{ pruned_voxel_count_0_reload_loc_empty_n sc_in sc_logic 1 signal 0 } 
	{ pruned_voxel_count_0_reload_loc_read sc_out sc_logic 1 signal 0 } 
	{ pruned_voxel_count_0_reload_loc_num_data_valid sc_in sc_lv 11 signal 0 } 
	{ pruned_voxel_count_0_reload_loc_fifo_cap sc_in sc_lv 11 signal 0 } 
	{ current_morton_list_din sc_out sc_lv 9 signal 1 } 
	{ current_morton_list_full_n sc_in sc_logic 1 signal 1 } 
	{ current_morton_list_write sc_out sc_logic 1 signal 1 } 
	{ current_morton_list_num_data_valid sc_in sc_lv 11 signal 1 } 
	{ current_morton_list_fifo_cap sc_in sc_lv 11 signal 1 } 
	{ pruned_voxel_count_0_reload_loc_c_din sc_out sc_lv 32 signal 2 } 
	{ pruned_voxel_count_0_reload_loc_c_full_n sc_in sc_logic 1 signal 2 } 
	{ pruned_voxel_count_0_reload_loc_c_write sc_out sc_logic 1 signal 2 } 
	{ pruned_voxel_count_0_reload_loc_c_num_data_valid sc_in sc_lv 11 signal 2 } 
	{ pruned_voxel_count_0_reload_loc_c_fifo_cap sc_in sc_lv 11 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc", "role": "dout" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc", "role": "empty_n" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc", "role": "read" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc", "role": "num_data_valid" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc", "role": "fifo_cap" }} , 
 	{ "name": "current_morton_list_din", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "current_morton_list", "role": "din" }} , 
 	{ "name": "current_morton_list_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "current_morton_list", "role": "full_n" }} , 
 	{ "name": "current_morton_list_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "current_morton_list", "role": "write" }} , 
 	{ "name": "current_morton_list_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "current_morton_list", "role": "num_data_valid" }} , 
 	{ "name": "current_morton_list_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "current_morton_list", "role": "fifo_cap" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c", "role": "din" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c", "role": "full_n" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c", "role": "write" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c", "role": "num_data_valid" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c", "role": "fifo_cap" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "Loop_VITIS_LOOP_209_5_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "514",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pruned_voxel_count_0_reload_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "pruned_voxel_count_0_reload_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_morton_list", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "current_morton_list_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pruned_voxel_count_0_reload_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "pruned_voxel_count_0_reload_loc_c_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_209_5", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state4"]}}]}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_209_5_proc {
		pruned_voxel_count_0_reload_loc {Type I LastRead 0 FirstWrite -1}
		current_morton_list {Type O LastRead -1 FirstWrite 2}
		pruned_voxel_count_0_reload_loc_c {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "514"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "514"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	pruned_voxel_count_0_reload_loc { ap_fifo {  { pruned_voxel_count_0_reload_loc_dout fifo_data_in 0 32 }  { pruned_voxel_count_0_reload_loc_empty_n fifo_status 0 1 }  { pruned_voxel_count_0_reload_loc_read fifo_port_we 1 1 }  { pruned_voxel_count_0_reload_loc_num_data_valid fifo_status_num_data_valid 0 11 }  { pruned_voxel_count_0_reload_loc_fifo_cap fifo_update 0 11 } } }
	current_morton_list { ap_fifo {  { current_morton_list_din fifo_data_in 1 9 }  { current_morton_list_full_n fifo_status 0 1 }  { current_morton_list_write fifo_port_we 1 1 }  { current_morton_list_num_data_valid fifo_status_num_data_valid 0 11 }  { current_morton_list_fifo_cap fifo_update 0 11 } } }
	pruned_voxel_count_0_reload_loc_c { ap_fifo {  { pruned_voxel_count_0_reload_loc_c_din fifo_data_in 1 32 }  { pruned_voxel_count_0_reload_loc_c_full_n fifo_status 0 1 }  { pruned_voxel_count_0_reload_loc_c_write fifo_port_we 1 1 }  { pruned_voxel_count_0_reload_loc_c_num_data_valid fifo_status_num_data_valid 0 11 }  { pruned_voxel_count_0_reload_loc_c_fifo_cap fifo_update 0 11 } } }
}
