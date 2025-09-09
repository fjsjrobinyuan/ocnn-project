set moduleName ocnn6_final_layer_output_reconstruction_streaming
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
set C_modelName {ocnn6_final_layer_output_reconstruction_streaming}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ layer_pipeline_streams_8 int 1085 regular {fifo 0 volatile }  }
	{ gmem_output int 32 regular {axi_master 1}  }
	{ full_cubic_output int 64 regular {fifo 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "layer_pipeline_streams_8", "interface" : "fifo", "bitwidth" : 1085, "direction" : "READONLY"} , 
 	{ "Name" : "gmem_output", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "final_output_full_cubic","offset": { "type": "dynamic","port_name": "final_output_full_cubic","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "full_cubic_output", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 63
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ layer_pipeline_streams_8_dout sc_in sc_lv 1085 signal 0 } 
	{ layer_pipeline_streams_8_empty_n sc_in sc_logic 1 signal 0 } 
	{ layer_pipeline_streams_8_read sc_out sc_logic 1 signal 0 } 
	{ layer_pipeline_streams_8_num_data_valid sc_in sc_lv 11 signal 0 } 
	{ layer_pipeline_streams_8_fifo_cap sc_in sc_lv 11 signal 0 } 
	{ m_axi_gmem_output_0_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_output_0_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_output_0_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_output_0_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_output_0_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_output_0_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_output_0_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_output_0_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_output_0_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_output_0_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_output_0_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_output_0_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_output_0_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_output_0_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_output_0_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_output_0_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_output_0_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_output_0_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_output_0_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_output_0_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_output_0_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_output_0_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_output_0_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_output_0_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_output_0_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_output_0_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_output_0_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_gmem_output_0_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_output_0_RFIFONUM sc_in sc_lv 9 signal 1 } 
	{ m_axi_gmem_output_0_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_output_0_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_output_0_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_output_0_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_output_0_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_output_0_BUSER sc_in sc_lv 1 signal 1 } 
	{ full_cubic_output_dout sc_in sc_lv 64 signal 2 } 
	{ full_cubic_output_empty_n sc_in sc_logic 1 signal 2 } 
	{ full_cubic_output_read sc_out sc_logic 1 signal 2 } 
	{ full_cubic_output_num_data_valid sc_in sc_lv 11 signal 2 } 
	{ full_cubic_output_fifo_cap sc_in sc_lv 11 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "layer_pipeline_streams_8_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1085, "type": "signal", "bundle":{"name": "layer_pipeline_streams_8", "role": "dout" }} , 
 	{ "name": "layer_pipeline_streams_8_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer_pipeline_streams_8", "role": "empty_n" }} , 
 	{ "name": "layer_pipeline_streams_8_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer_pipeline_streams_8", "role": "read" }} , 
 	{ "name": "layer_pipeline_streams_8_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "layer_pipeline_streams_8", "role": "num_data_valid" }} , 
 	{ "name": "layer_pipeline_streams_8_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "layer_pipeline_streams_8", "role": "fifo_cap" }} , 
 	{ "name": "m_axi_gmem_output_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem_output_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem_output_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem_output_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem_output_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem_output_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem_output_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem_output_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem_output_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem_output_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem_output_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem_output_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem_output_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem_output_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem_output_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem_output_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem_output_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem_output_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem_output_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem_output_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem_output_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem_output_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem_output_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem_output_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem_output_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem_output_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem_output_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem_output_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem_output_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem_output_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem_output_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem_output_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem_output_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem_output_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem_output_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem_output_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem_output_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem_output_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem_output_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_output_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem_output_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem_output_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem_output_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem_output_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem_output_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem_output_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_output", "role": "0_BUSER" }} , 
 	{ "name": "full_cubic_output_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "full_cubic_output", "role": "dout" }} , 
 	{ "name": "full_cubic_output_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "full_cubic_output", "role": "empty_n" }} , 
 	{ "name": "full_cubic_output_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "full_cubic_output", "role": "read" }} , 
 	{ "name": "full_cubic_output_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "full_cubic_output", "role": "num_data_valid" }} , 
 	{ "name": "full_cubic_output_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "full_cubic_output", "role": "fifo_cap" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ocnn6_final_layer_output_reconstruction_streaming",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10485769", "EstimateLatencyMax" : "10805777",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "layer_pipeline_streams_8", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "layer_pipeline_streams_8_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem_output", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem_output_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_output_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_output_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "full_cubic_output", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "full_cubic_output_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "INIT_FULL_OUTPUT", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state2"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state5"]}},
			{"Name" : "RECONSTRUCT_FROM_STREAM", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_pp1_stage0", "FirstStateIter" : "ap_enable_reg_pp1_iter0", "FirstStateBlock" : "ap_block_pp1_stage0_subdone", "LastState" : "ap_ST_fsm_pp1_stage8", "LastStateIter" : "ap_enable_reg_pp1_iter1", "LastStateBlock" : "ap_block_pp1_stage8_subdone", "PreState" : ["ap_ST_fsm_state9"], "QuitState" : "ap_ST_fsm_pp1_stage8", "QuitStateIter" : "ap_enable_reg_pp1_iter1", "QuitStateBlock" : "ap_block_pp1_stage8_subdone", "PostState" : ["ap_ST_fsm_state51"]}}]}]}


set ArgLastReadFirstWriteLatency {
	ocnn6_final_layer_output_reconstruction_streaming {
		layer_pipeline_streams_8 {Type I LastRead 9 FirstWrite -1}
		gmem_output {Type O LastRead 44 FirstWrite 3}
		full_cubic_output {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "10485769", "Max" : "10805777"}
	, {"Name" : "Interval", "Min" : "10485769", "Max" : "10805777"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
]}

set Spec2ImplPortList { 
	layer_pipeline_streams_8 { ap_fifo {  { layer_pipeline_streams_8_dout fifo_data_in 0 1085 }  { layer_pipeline_streams_8_empty_n fifo_status 0 1 }  { layer_pipeline_streams_8_read fifo_port_we 1 1 }  { layer_pipeline_streams_8_num_data_valid fifo_status_num_data_valid 0 11 }  { layer_pipeline_streams_8_fifo_cap fifo_update 0 11 } } }
	 { m_axi {  { m_axi_gmem_output_0_AWVALID VALID 1 1 }  { m_axi_gmem_output_0_AWREADY READY 0 1 }  { m_axi_gmem_output_0_AWADDR ADDR 1 64 }  { m_axi_gmem_output_0_AWID ID 1 1 }  { m_axi_gmem_output_0_AWLEN SIZE 1 32 }  { m_axi_gmem_output_0_AWSIZE BURST 1 3 }  { m_axi_gmem_output_0_AWBURST LOCK 1 2 }  { m_axi_gmem_output_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_output_0_AWCACHE PROT 1 4 }  { m_axi_gmem_output_0_AWPROT QOS 1 3 }  { m_axi_gmem_output_0_AWQOS REGION 1 4 }  { m_axi_gmem_output_0_AWREGION USER 1 4 }  { m_axi_gmem_output_0_AWUSER DATA 1 1 }  { m_axi_gmem_output_0_WVALID VALID 1 1 }  { m_axi_gmem_output_0_WREADY READY 0 1 }  { m_axi_gmem_output_0_WDATA FIFONUM 1 32 }  { m_axi_gmem_output_0_WSTRB STRB 1 4 }  { m_axi_gmem_output_0_WLAST LAST 1 1 }  { m_axi_gmem_output_0_WID ID 1 1 }  { m_axi_gmem_output_0_WUSER DATA 1 1 }  { m_axi_gmem_output_0_ARVALID VALID 1 1 }  { m_axi_gmem_output_0_ARREADY READY 0 1 }  { m_axi_gmem_output_0_ARADDR ADDR 1 64 }  { m_axi_gmem_output_0_ARID ID 1 1 }  { m_axi_gmem_output_0_ARLEN SIZE 1 32 }  { m_axi_gmem_output_0_ARSIZE BURST 1 3 }  { m_axi_gmem_output_0_ARBURST LOCK 1 2 }  { m_axi_gmem_output_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_output_0_ARCACHE PROT 1 4 }  { m_axi_gmem_output_0_ARPROT QOS 1 3 }  { m_axi_gmem_output_0_ARQOS REGION 1 4 }  { m_axi_gmem_output_0_ARREGION USER 1 4 }  { m_axi_gmem_output_0_ARUSER DATA 1 1 }  { m_axi_gmem_output_0_RVALID VALID 0 1 }  { m_axi_gmem_output_0_RREADY READY 1 1 }  { m_axi_gmem_output_0_RDATA FIFONUM 0 32 }  { m_axi_gmem_output_0_RLAST LAST 0 1 }  { m_axi_gmem_output_0_RID ID 0 1 }  { m_axi_gmem_output_0_RFIFONUM LEN 0 9 }  { m_axi_gmem_output_0_RUSER DATA 0 1 }  { m_axi_gmem_output_0_RRESP RESP 0 2 }  { m_axi_gmem_output_0_BVALID VALID 0 1 }  { m_axi_gmem_output_0_BREADY READY 1 1 }  { m_axi_gmem_output_0_BRESP RESP 0 2 }  { m_axi_gmem_output_0_BID ID 0 1 }  { m_axi_gmem_output_0_BUSER DATA 0 1 } } }
	full_cubic_output { ap_fifo {  { full_cubic_output_dout fifo_data_in 0 64 }  { full_cubic_output_empty_n fifo_status 0 1 }  { full_cubic_output_read fifo_port_we 1 1 }  { full_cubic_output_num_data_valid fifo_status_num_data_valid 0 11 }  { full_cubic_output_fifo_cap fifo_update 0 11 } } }
}
