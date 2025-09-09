set moduleName Block_entry_proc_24
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
set C_modelName {Block_entry_proc.24}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ pruned_voxel_count_0_loc int 32 regular {fifo 0}  }
	{ wide_trip_count_out int 32 regular {fifo 1}  }
	{ p_out int 34 regular {fifo 1}  }
	{ pruned_voxel_count_0_reload_loc_c1 int 32 regular {fifo 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "pruned_voxel_count_0_loc", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "wide_trip_count_out", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out", "interface" : "fifo", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pruned_voxel_count_0_reload_loc_c1", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ pruned_voxel_count_0_loc_dout sc_in sc_lv 32 signal 0 } 
	{ pruned_voxel_count_0_loc_empty_n sc_in sc_logic 1 signal 0 } 
	{ pruned_voxel_count_0_loc_read sc_out sc_logic 1 signal 0 } 
	{ pruned_voxel_count_0_loc_num_data_valid sc_in sc_lv 11 signal 0 } 
	{ pruned_voxel_count_0_loc_fifo_cap sc_in sc_lv 11 signal 0 } 
	{ wide_trip_count_out_din sc_out sc_lv 32 signal 1 } 
	{ wide_trip_count_out_full_n sc_in sc_logic 1 signal 1 } 
	{ wide_trip_count_out_write sc_out sc_logic 1 signal 1 } 
	{ wide_trip_count_out_num_data_valid sc_in sc_lv 11 signal 1 } 
	{ wide_trip_count_out_fifo_cap sc_in sc_lv 11 signal 1 } 
	{ p_out_din sc_out sc_lv 34 signal 2 } 
	{ p_out_full_n sc_in sc_logic 1 signal 2 } 
	{ p_out_write sc_out sc_logic 1 signal 2 } 
	{ p_out_num_data_valid sc_in sc_lv 11 signal 2 } 
	{ p_out_fifo_cap sc_in sc_lv 11 signal 2 } 
	{ pruned_voxel_count_0_reload_loc_c1_din sc_out sc_lv 32 signal 3 } 
	{ pruned_voxel_count_0_reload_loc_c1_full_n sc_in sc_logic 1 signal 3 } 
	{ pruned_voxel_count_0_reload_loc_c1_write sc_out sc_logic 1 signal 3 } 
	{ pruned_voxel_count_0_reload_loc_c1_num_data_valid sc_in sc_lv 11 signal 3 } 
	{ pruned_voxel_count_0_reload_loc_c1_fifo_cap sc_in sc_lv 11 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "pruned_voxel_count_0_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_loc", "role": "dout" }} , 
 	{ "name": "pruned_voxel_count_0_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_loc", "role": "empty_n" }} , 
 	{ "name": "pruned_voxel_count_0_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_loc", "role": "read" }} , 
 	{ "name": "pruned_voxel_count_0_loc_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_loc", "role": "num_data_valid" }} , 
 	{ "name": "pruned_voxel_count_0_loc_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_loc", "role": "fifo_cap" }} , 
 	{ "name": "wide_trip_count_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wide_trip_count_out", "role": "din" }} , 
 	{ "name": "wide_trip_count_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "wide_trip_count_out", "role": "full_n" }} , 
 	{ "name": "wide_trip_count_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "wide_trip_count_out", "role": "write" }} , 
 	{ "name": "wide_trip_count_out_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "wide_trip_count_out", "role": "num_data_valid" }} , 
 	{ "name": "wide_trip_count_out_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "wide_trip_count_out", "role": "fifo_cap" }} , 
 	{ "name": "p_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out", "role": "din" }} , 
 	{ "name": "p_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out", "role": "full_n" }} , 
 	{ "name": "p_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out", "role": "write" }} , 
 	{ "name": "p_out_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out", "role": "num_data_valid" }} , 
 	{ "name": "p_out_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out", "role": "fifo_cap" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c1", "role": "din" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c1", "role": "full_n" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c1", "role": "write" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c1", "role": "num_data_valid" }} , 
 	{ "name": "pruned_voxel_count_0_reload_loc_c1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "pruned_voxel_count_0_reload_loc_c1", "role": "fifo_cap" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "Block_entry_proc_24",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pruned_voxel_count_0_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "pruned_voxel_count_0_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "wide_trip_count_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "wide_trip_count_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pruned_voxel_count_0_reload_loc_c1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "pruned_voxel_count_0_reload_loc_c1_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	Block_entry_proc_24 {
		pruned_voxel_count_0_loc {Type I LastRead 0 FirstWrite -1}
		wide_trip_count_out {Type O LastRead -1 FirstWrite 1}
		p_out {Type O LastRead -1 FirstWrite 1}
		pruned_voxel_count_0_reload_loc_c1 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	pruned_voxel_count_0_loc { ap_fifo {  { pruned_voxel_count_0_loc_dout fifo_data_in 0 32 }  { pruned_voxel_count_0_loc_empty_n fifo_status 0 1 }  { pruned_voxel_count_0_loc_read fifo_port_we 1 1 }  { pruned_voxel_count_0_loc_num_data_valid fifo_status_num_data_valid 0 11 }  { pruned_voxel_count_0_loc_fifo_cap fifo_update 0 11 } } }
	wide_trip_count_out { ap_fifo {  { wide_trip_count_out_din fifo_data_in 1 32 }  { wide_trip_count_out_full_n fifo_status 0 1 }  { wide_trip_count_out_write fifo_port_we 1 1 }  { wide_trip_count_out_num_data_valid fifo_status_num_data_valid 0 11 }  { wide_trip_count_out_fifo_cap fifo_update 0 11 } } }
	p_out { ap_fifo {  { p_out_din fifo_data_in 1 34 }  { p_out_full_n fifo_status 0 1 }  { p_out_write fifo_port_we 1 1 }  { p_out_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out_fifo_cap fifo_update 0 11 } } }
	pruned_voxel_count_0_reload_loc_c1 { ap_fifo {  { pruned_voxel_count_0_reload_loc_c1_din fifo_data_in 1 32 }  { pruned_voxel_count_0_reload_loc_c1_full_n fifo_status 0 1 }  { pruned_voxel_count_0_reload_loc_c1_write fifo_port_we 1 1 }  { pruned_voxel_count_0_reload_loc_c1_num_data_valid fifo_status_num_data_valid 0 11 }  { pruned_voxel_count_0_reload_loc_c1_fifo_cap fifo_update 0 11 } } }
}
