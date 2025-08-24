set moduleName layer_convolution_with_persistent_accelerator_Outline_INIT_OUTPUT_BIAS
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
set C_modelName {layer_convolution_with_persistent_accelerator_Outline_INIT_OUTPUT_BIAS}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict layer_biases_12 { MEM_WIDTH 32 MEM_SIZE 4096 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict output_features { MEM_WIDTH 32 MEM_SIZE 4096 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ config_output_channels_val int 11 regular  }
	{ layer_biases_12 int 32 regular {bram 1024 { 1 3 } 1 1 }  }
	{ output_features int 32 regular {array 1024 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "config_output_channels_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "layer_biases_12", "interface" : "bram", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "output_features", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ config_output_channels_val sc_in sc_lv 11 signal 0 } 
	{ layer_biases_12_Addr_A sc_out sc_lv 32 signal 1 } 
	{ layer_biases_12_EN_A sc_out sc_logic 1 signal 1 } 
	{ layer_biases_12_WEN_A sc_out sc_lv 4 signal 1 } 
	{ layer_biases_12_Din_A sc_out sc_lv 32 signal 1 } 
	{ layer_biases_12_Dout_A sc_in sc_lv 32 signal 1 } 
	{ output_features_address0 sc_out sc_lv 10 signal 2 } 
	{ output_features_ce0 sc_out sc_logic 1 signal 2 } 
	{ output_features_we0 sc_out sc_logic 1 signal 2 } 
	{ output_features_d0 sc_out sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "config_output_channels_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "config_output_channels_val", "role": "default" }} , 
 	{ "name": "layer_biases_12_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "Addr_A" }} , 
 	{ "name": "layer_biases_12_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "EN_A" }} , 
 	{ "name": "layer_biases_12_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "WEN_A" }} , 
 	{ "name": "layer_biases_12_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "Din_A" }} , 
 	{ "name": "layer_biases_12_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "Dout_A" }} , 
 	{ "name": "output_features_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "output_features", "role": "address0" }} , 
 	{ "name": "output_features_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_features", "role": "ce0" }} , 
 	{ "name": "output_features_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_features", "role": "we0" }} , 
 	{ "name": "output_features_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_features", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "layer_convolution_with_persistent_accelerator_Outline_INIT_OUTPUT_BIAS",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "33", "EstimateLatencyMax" : "2049",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "config_output_channels_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "layer_biases_12", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "output_features", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "INIT_OUTPUT_BIAS", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]}]}


set ArgLastReadFirstWriteLatency {
	layer_convolution_with_persistent_accelerator_Outline_INIT_OUTPUT_BIAS {
		config_output_channels_val {Type I LastRead 0 FirstWrite -1}
		layer_biases_12 {Type I LastRead 1 FirstWrite -1}
		output_features {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "33", "Max" : "2049"}
	, {"Name" : "Interval", "Min" : "33", "Max" : "2049"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	config_output_channels_val { ap_none {  { config_output_channels_val in_data 0 11 } } }
	layer_biases_12 { bram {  { layer_biases_12_Addr_A MemPortADDR2 1 32 }  { layer_biases_12_EN_A MemPortCE2 1 1 }  { layer_biases_12_WEN_A MemPortWE2 1 4 }  { layer_biases_12_Din_A MemPortDIN2 1 32 }  { layer_biases_12_Dout_A MemPortDOUT2 0 32 } } }
	output_features { ap_memory {  { output_features_address0 mem_address 1 10 }  { output_features_ce0 mem_ce 1 1 }  { output_features_we0 mem_we 1 1 }  { output_features_d0 mem_din 1 32 } } }
}
