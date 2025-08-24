set moduleName layer_convolution_with_persistent_accelerator_Outline_READ_NEIGHBOR_FEATURES
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
set C_modelName {layer_convolution_with_persistent_accelerator_Outline_READ_NEIGHBOR_FEATURES}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict neighbor_features { MEM_WIDTH 32 MEM_SIZE 4096 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ config_input_channels_val int 11 regular  }
	{ gmem_write int 32 regular {axi_master 0}  }
	{ p_cast_cast int 62 regular  }
	{ neighbor_features float 32 regular {array 1024 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "config_input_channels_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "gmem_write", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "pruned_feature_dram_write","offset": { "type": "dynamic","port_name": "pruned_feature_dram_write","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "p_cast_cast", "interface" : "wire", "bitwidth" : 62, "direction" : "READONLY"} , 
 	{ "Name" : "neighbor_features", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 58
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ config_input_channels_val sc_in sc_lv 11 signal 0 } 
	{ m_axi_gmem_write_0_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_write_0_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_write_0_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_write_0_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_write_0_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_write_0_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_write_0_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_write_0_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_write_0_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_write_0_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_write_0_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_write_0_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_write_0_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_write_0_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_write_0_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_write_0_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_write_0_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_write_0_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_write_0_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_write_0_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_write_0_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_write_0_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_write_0_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_write_0_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_write_0_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_write_0_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_write_0_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_gmem_write_0_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_write_0_RFIFONUM sc_in sc_lv 13 signal 1 } 
	{ m_axi_gmem_write_0_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_write_0_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_write_0_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_write_0_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_write_0_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_write_0_BUSER sc_in sc_lv 1 signal 1 } 
	{ p_cast_cast sc_in sc_lv 62 signal 2 } 
	{ neighbor_features_address0 sc_out sc_lv 10 signal 3 } 
	{ neighbor_features_ce0 sc_out sc_logic 1 signal 3 } 
	{ neighbor_features_we0 sc_out sc_logic 1 signal 3 } 
	{ neighbor_features_d0 sc_out sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "config_input_channels_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "config_input_channels_val", "role": "default" }} , 
 	{ "name": "m_axi_gmem_write_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem_write_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem_write_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem_write_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem_write_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem_write_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem_write_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem_write_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem_write_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem_write_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem_write_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem_write_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem_write_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem_write_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem_write_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem_write_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem_write_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem_write_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem_write_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem_write_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem_write_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem_write_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem_write_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem_write_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem_write_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem_write_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem_write_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem_write_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem_write_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem_write_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem_write_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem_write_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem_write_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem_write_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem_write_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem_write_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem_write_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem_write_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem_write_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_write_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem_write_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem_write_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem_write_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem_write_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem_write_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem_write_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_write", "role": "0_BUSER" }} , 
 	{ "name": "p_cast_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":62, "type": "signal", "bundle":{"name": "p_cast_cast", "role": "default" }} , 
 	{ "name": "neighbor_features_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "neighbor_features", "role": "address0" }} , 
 	{ "name": "neighbor_features_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "neighbor_features", "role": "ce0" }} , 
 	{ "name": "neighbor_features_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "neighbor_features", "role": "we0" }} , 
 	{ "name": "neighbor_features_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "neighbor_features", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "layer_convolution_with_persistent_accelerator_Outline_READ_NEIGHBOR_FEATURES",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "3073",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "config_input_channels_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem_write", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_write_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "p_cast_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "neighbor_features", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]}]}


set ArgLastReadFirstWriteLatency {
	layer_convolution_with_persistent_accelerator_Outline_READ_NEIGHBOR_FEATURES {
		config_input_channels_val {Type I LastRead 0 FirstWrite -1}
		gmem_write {Type I LastRead 2 FirstWrite -1}
		p_cast_cast {Type I LastRead 0 FirstWrite -1}
		neighbor_features {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "10", "Max" : "3073"}
	, {"Name" : "Interval", "Min" : "10", "Max" : "3073"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	config_input_channels_val { ap_none {  { config_input_channels_val in_data 0 11 } } }
	 { m_axi {  { m_axi_gmem_write_0_AWVALID VALID 1 1 }  { m_axi_gmem_write_0_AWREADY READY 0 1 }  { m_axi_gmem_write_0_AWADDR ADDR 1 64 }  { m_axi_gmem_write_0_AWID ID 1 1 }  { m_axi_gmem_write_0_AWLEN SIZE 1 32 }  { m_axi_gmem_write_0_AWSIZE BURST 1 3 }  { m_axi_gmem_write_0_AWBURST LOCK 1 2 }  { m_axi_gmem_write_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_write_0_AWCACHE PROT 1 4 }  { m_axi_gmem_write_0_AWPROT QOS 1 3 }  { m_axi_gmem_write_0_AWQOS REGION 1 4 }  { m_axi_gmem_write_0_AWREGION USER 1 4 }  { m_axi_gmem_write_0_AWUSER DATA 1 1 }  { m_axi_gmem_write_0_WVALID VALID 1 1 }  { m_axi_gmem_write_0_WREADY READY 0 1 }  { m_axi_gmem_write_0_WDATA FIFONUM 1 32 }  { m_axi_gmem_write_0_WSTRB STRB 1 4 }  { m_axi_gmem_write_0_WLAST LAST 1 1 }  { m_axi_gmem_write_0_WID ID 1 1 }  { m_axi_gmem_write_0_WUSER DATA 1 1 }  { m_axi_gmem_write_0_ARVALID VALID 1 1 }  { m_axi_gmem_write_0_ARREADY READY 0 1 }  { m_axi_gmem_write_0_ARADDR ADDR 1 64 }  { m_axi_gmem_write_0_ARID ID 1 1 }  { m_axi_gmem_write_0_ARLEN SIZE 1 32 }  { m_axi_gmem_write_0_ARSIZE BURST 1 3 }  { m_axi_gmem_write_0_ARBURST LOCK 1 2 }  { m_axi_gmem_write_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_write_0_ARCACHE PROT 1 4 }  { m_axi_gmem_write_0_ARPROT QOS 1 3 }  { m_axi_gmem_write_0_ARQOS REGION 1 4 }  { m_axi_gmem_write_0_ARREGION USER 1 4 }  { m_axi_gmem_write_0_ARUSER DATA 1 1 }  { m_axi_gmem_write_0_RVALID VALID 0 1 }  { m_axi_gmem_write_0_RREADY READY 1 1 }  { m_axi_gmem_write_0_RDATA FIFONUM 0 32 }  { m_axi_gmem_write_0_RLAST LAST 0 1 }  { m_axi_gmem_write_0_RID ID 0 1 }  { m_axi_gmem_write_0_RFIFONUM LEN 0 13 }  { m_axi_gmem_write_0_RUSER DATA 0 1 }  { m_axi_gmem_write_0_RRESP RESP 0 2 }  { m_axi_gmem_write_0_BVALID VALID 0 1 }  { m_axi_gmem_write_0_BREADY READY 1 1 }  { m_axi_gmem_write_0_BRESP RESP 0 2 }  { m_axi_gmem_write_0_BID ID 0 1 }  { m_axi_gmem_write_0_BUSER DATA 0 1 } } }
	p_cast_cast { ap_none {  { p_cast_cast in_data 0 62 } } }
	neighbor_features { ap_memory {  { neighbor_features_address0 mem_address 1 10 }  { neighbor_features_ce0 mem_ce 1 1 }  { neighbor_features_we0 mem_we 1 1 }  { neighbor_features_d0 mem_din 1 32 } } }
}
