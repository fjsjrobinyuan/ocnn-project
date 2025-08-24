set moduleName layer_convolution_with_persistent_accelerator
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
set C_modelName {layer_convolution_with_persistent_accelerator}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict layer_weights_12 { MEM_WIDTH 32 MEM_SIZE 113246208 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict layer_biases_12 { MEM_WIDTH 32 MEM_SIZE 4096 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ config_input_channels_val int 11 regular  }
	{ config_output_channels_val int 11 regular  }
	{ config_output_spatial_dim_val int 7 regular  }
	{ layer_weights_12 int 32 regular {bram 28311552 { 1 3 } 1 1 }  }
	{ layer_biases_12 int 32 regular {bram 1024 { 1 3 } 1 1 }  }
	{ bitmap_info_0_4_0_0_0_val int 32 regular  }
	{ gmem_write int 32 regular {axi_master 0}  }
	{ pruned_dram_read int 64 regular  }
	{ gmem_read int 32 regular {axi_master 1}  }
	{ pruned_dram_write int 64 regular  }
	{ num_pruned_voxels int 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "config_input_channels_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "config_output_channels_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "config_output_spatial_dim_val", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "layer_weights_12", "interface" : "bram", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "layer_biases_12", "interface" : "bram", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bitmap_info_0_4_0_0_0_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gmem_write", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "pruned_feature_dram_write","offset": { "type": "dynamic","port_name": "pruned_feature_dram_write","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "pruned_dram_read", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem_read", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "pruned_feature_dram_read","offset": { "type": "dynamic","port_name": "pruned_feature_dram_read","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "pruned_dram_write", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "num_pruned_voxels", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 115
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ config_input_channels_val sc_in sc_lv 11 signal 0 } 
	{ config_output_channels_val sc_in sc_lv 11 signal 1 } 
	{ config_output_spatial_dim_val sc_in sc_lv 7 signal 2 } 
	{ layer_weights_12_Addr_A sc_out sc_lv 32 signal 3 } 
	{ layer_weights_12_EN_A sc_out sc_logic 1 signal 3 } 
	{ layer_weights_12_WEN_A sc_out sc_lv 4 signal 3 } 
	{ layer_weights_12_Din_A sc_out sc_lv 32 signal 3 } 
	{ layer_weights_12_Dout_A sc_in sc_lv 32 signal 3 } 
	{ layer_biases_12_Addr_A sc_out sc_lv 32 signal 4 } 
	{ layer_biases_12_EN_A sc_out sc_logic 1 signal 4 } 
	{ layer_biases_12_WEN_A sc_out sc_lv 4 signal 4 } 
	{ layer_biases_12_Din_A sc_out sc_lv 32 signal 4 } 
	{ layer_biases_12_Dout_A sc_in sc_lv 32 signal 4 } 
	{ bitmap_info_0_4_0_0_0_val sc_in sc_lv 32 signal 5 } 
	{ m_axi_gmem_write_0_AWVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_AWREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_AWADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem_write_0_AWID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_write_0_AWLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem_write_0_AWSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_write_0_AWBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_write_0_AWLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_write_0_AWCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_write_0_AWPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_write_0_AWQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_write_0_AWREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_write_0_AWUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_write_0_WVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_WREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_WDATA sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem_write_0_WSTRB sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_write_0_WLAST sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_WID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_write_0_WUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_write_0_ARVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_ARREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_ARADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem_write_0_ARID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_write_0_ARLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem_write_0_ARSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_write_0_ARBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_write_0_ARLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_write_0_ARCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_write_0_ARPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_write_0_ARQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_write_0_ARREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_write_0_ARUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_write_0_RVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_RREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_RDATA sc_in sc_lv 32 signal 6 } 
	{ m_axi_gmem_write_0_RLAST sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_RID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem_write_0_RFIFONUM sc_in sc_lv 13 signal 6 } 
	{ m_axi_gmem_write_0_RUSER sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem_write_0_RRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem_write_0_BVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_BREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_write_0_BRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem_write_0_BID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem_write_0_BUSER sc_in sc_lv 1 signal 6 } 
	{ pruned_dram_read sc_in sc_lv 64 signal 7 } 
	{ m_axi_gmem_read_0_AWVALID sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_AWREADY sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_AWADDR sc_out sc_lv 64 signal 8 } 
	{ m_axi_gmem_read_0_AWID sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_read_0_AWLEN sc_out sc_lv 32 signal 8 } 
	{ m_axi_gmem_read_0_AWSIZE sc_out sc_lv 3 signal 8 } 
	{ m_axi_gmem_read_0_AWBURST sc_out sc_lv 2 signal 8 } 
	{ m_axi_gmem_read_0_AWLOCK sc_out sc_lv 2 signal 8 } 
	{ m_axi_gmem_read_0_AWCACHE sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_read_0_AWPROT sc_out sc_lv 3 signal 8 } 
	{ m_axi_gmem_read_0_AWQOS sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_read_0_AWREGION sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_read_0_AWUSER sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_read_0_WVALID sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_WREADY sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_WDATA sc_out sc_lv 32 signal 8 } 
	{ m_axi_gmem_read_0_WSTRB sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_read_0_WLAST sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_WID sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_read_0_WUSER sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_read_0_ARVALID sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_ARREADY sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_ARADDR sc_out sc_lv 64 signal 8 } 
	{ m_axi_gmem_read_0_ARID sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_read_0_ARLEN sc_out sc_lv 32 signal 8 } 
	{ m_axi_gmem_read_0_ARSIZE sc_out sc_lv 3 signal 8 } 
	{ m_axi_gmem_read_0_ARBURST sc_out sc_lv 2 signal 8 } 
	{ m_axi_gmem_read_0_ARLOCK sc_out sc_lv 2 signal 8 } 
	{ m_axi_gmem_read_0_ARCACHE sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_read_0_ARPROT sc_out sc_lv 3 signal 8 } 
	{ m_axi_gmem_read_0_ARQOS sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_read_0_ARREGION sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_read_0_ARUSER sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_read_0_RVALID sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_RREADY sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_RDATA sc_in sc_lv 32 signal 8 } 
	{ m_axi_gmem_read_0_RLAST sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_RID sc_in sc_lv 1 signal 8 } 
	{ m_axi_gmem_read_0_RFIFONUM sc_in sc_lv 13 signal 8 } 
	{ m_axi_gmem_read_0_RUSER sc_in sc_lv 1 signal 8 } 
	{ m_axi_gmem_read_0_RRESP sc_in sc_lv 2 signal 8 } 
	{ m_axi_gmem_read_0_BVALID sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_BREADY sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_read_0_BRESP sc_in sc_lv 2 signal 8 } 
	{ m_axi_gmem_read_0_BID sc_in sc_lv 1 signal 8 } 
	{ m_axi_gmem_read_0_BUSER sc_in sc_lv 1 signal 8 } 
	{ pruned_dram_write sc_in sc_lv 64 signal 9 } 
	{ num_pruned_voxels sc_in sc_lv 32 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "config_input_channels_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "config_input_channels_val", "role": "default" }} , 
 	{ "name": "config_output_channels_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "config_output_channels_val", "role": "default" }} , 
 	{ "name": "config_output_spatial_dim_val", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "config_output_spatial_dim_val", "role": "default" }} , 
 	{ "name": "layer_weights_12_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "layer_weights_12", "role": "Addr_A" }} , 
 	{ "name": "layer_weights_12_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer_weights_12", "role": "EN_A" }} , 
 	{ "name": "layer_weights_12_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "layer_weights_12", "role": "WEN_A" }} , 
 	{ "name": "layer_weights_12_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "layer_weights_12", "role": "Din_A" }} , 
 	{ "name": "layer_weights_12_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "layer_weights_12", "role": "Dout_A" }} , 
 	{ "name": "layer_biases_12_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "Addr_A" }} , 
 	{ "name": "layer_biases_12_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "EN_A" }} , 
 	{ "name": "layer_biases_12_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "WEN_A" }} , 
 	{ "name": "layer_biases_12_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "Din_A" }} , 
 	{ "name": "layer_biases_12_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "layer_biases_12", "role": "Dout_A" }} , 
 	{ "name": "bitmap_info_0_4_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bitmap_info_0_4_0_0_0_val", "role": "default" }} , 
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
 	{ "name": "pruned_dram_read", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "pruned_dram_read", "role": "default" }} , 
 	{ "name": "m_axi_gmem_read_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem_read_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem_read_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem_read_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem_read_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem_read_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem_read_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem_read_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem_read_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem_read_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem_read_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem_read_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem_read_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem_read_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem_read_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem_read_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem_read_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem_read_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem_read_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem_read_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem_read_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem_read_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem_read_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem_read_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem_read_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem_read_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem_read_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem_read_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem_read_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem_read_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem_read_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem_read_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem_read_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem_read_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem_read_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem_read_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem_read_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem_read_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem_read_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_read_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem_read_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem_read_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem_read_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem_read_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem_read_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem_read_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_read", "role": "0_BUSER" }} , 
 	{ "name": "pruned_dram_write", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "pruned_dram_write", "role": "default" }} , 
 	{ "name": "num_pruned_voxels", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "num_pruned_voxels", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"],
		"CDFG" : "layer_convolution_with_persistent_accelerator",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4674066", "EstimateLatencyMax" : "8502419100066",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "config_input_channels_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "config_output_channels_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "config_output_spatial_dim_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "layer_weights_12", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "layer_biases_12", "Type" : "Bram", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_layer_convolution_with_persistent_accelerator_Outline_INIT_OUTPUT_BIAS_fu_3295", "Port" : "layer_biases_12", "Inst_start_state" : "67", "Inst_end_state" : "68"}]},
			{"Name" : "bitmap_info_0_4_0_0_0_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem_write", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_write_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_write_blk_n_R", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_layer_convolution_with_persistent_accelerator_Outline_READ_NEIGHBOR_FEATURES_fu_3303", "Port" : "gmem_write", "Inst_start_state" : "77", "Inst_end_state" : "78"}]},
			{"Name" : "pruned_dram_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem_read", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem_read_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_read_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_read_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "pruned_dram_write", "Type" : "None", "Direction" : "I"},
			{"Name" : "num_pruned_voxels", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state78"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state89"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state97", "LastState" : ["ap_ST_fsm_state99"], "QuitState" : ["ap_ST_fsm_state97"], "PreState" : ["ap_ST_fsm_state96"], "PostState" : ["ap_ST_fsm_pp1_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp1_stage0", "FirstStateIter" : "ap_enable_reg_pp1_iter0", "FirstStateBlock" : "ap_block_pp1_stage0_subdone", "LastState" : "ap_ST_fsm_pp1_stage0", "LastStateIter" : "ap_enable_reg_pp1_iter3", "LastStateBlock" : "ap_block_pp1_stage0_subdone", "PreState" : ["ap_ST_fsm_state97"], "QuitState" : "ap_ST_fsm_pp1_stage0", "QuitStateIter" : "ap_enable_reg_pp1_iter3", "QuitStateBlock" : "ap_block_pp1_stage0_subdone", "PostState" : ["ap_ST_fsm_state110"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state118", "LastState" : ["ap_ST_fsm_state120"], "QuitState" : ["ap_ST_fsm_state118"], "PreState" : ["ap_ST_fsm_state117"], "PostState" : ["ap_ST_fsm_pp2_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp2_stage0", "FirstStateIter" : "ap_enable_reg_pp2_iter0", "FirstStateBlock" : "ap_block_pp2_stage0_subdone", "LastState" : "ap_ST_fsm_pp2_stage0", "LastStateIter" : "ap_enable_reg_pp2_iter3", "LastStateBlock" : "ap_block_pp2_stage0_subdone", "PreState" : ["ap_ST_fsm_state118"], "QuitState" : "ap_ST_fsm_pp2_stage0", "QuitStateIter" : "ap_enable_reg_pp2_iter3", "QuitStateBlock" : "ap_block_pp2_stage0_subdone", "PostState" : ["ap_ST_fsm_state131"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state139", "LastState" : ["ap_ST_fsm_state141"], "QuitState" : ["ap_ST_fsm_state139"], "PreState" : ["ap_ST_fsm_state138"], "PostState" : ["ap_ST_fsm_pp3_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp3_stage0", "FirstStateIter" : "ap_enable_reg_pp3_iter0", "FirstStateBlock" : "ap_block_pp3_stage0_subdone", "LastState" : "ap_ST_fsm_pp3_stage0", "LastStateIter" : "ap_enable_reg_pp3_iter3", "LastStateBlock" : "ap_block_pp3_stage0_subdone", "PreState" : ["ap_ST_fsm_state139"], "QuitState" : "ap_ST_fsm_pp3_stage0", "QuitStateIter" : "ap_enable_reg_pp3_iter3", "QuitStateBlock" : "ap_block_pp3_stage0_subdone", "PostState" : ["ap_ST_fsm_state152"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state160", "LastState" : ["ap_ST_fsm_state162"], "QuitState" : ["ap_ST_fsm_state160"], "PreState" : ["ap_ST_fsm_state159"], "PostState" : ["ap_ST_fsm_pp4_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp4_stage0", "FirstStateIter" : "ap_enable_reg_pp4_iter0", "FirstStateBlock" : "ap_block_pp4_stage0_subdone", "LastState" : "ap_ST_fsm_pp4_stage0", "LastStateIter" : "ap_enable_reg_pp4_iter3", "LastStateBlock" : "ap_block_pp4_stage0_subdone", "PreState" : ["ap_ST_fsm_state160"], "QuitState" : "ap_ST_fsm_pp4_stage0", "QuitStateIter" : "ap_enable_reg_pp4_iter3", "QuitStateBlock" : "ap_block_pp4_stage0_subdone", "PostState" : ["ap_ST_fsm_state173"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state181", "LastState" : ["ap_ST_fsm_state183"], "QuitState" : ["ap_ST_fsm_state181"], "PreState" : ["ap_ST_fsm_state180"], "PostState" : ["ap_ST_fsm_pp5_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp5_stage0", "FirstStateIter" : "ap_enable_reg_pp5_iter0", "FirstStateBlock" : "ap_block_pp5_stage0_subdone", "LastState" : "ap_ST_fsm_pp5_stage0", "LastStateIter" : "ap_enable_reg_pp5_iter3", "LastStateBlock" : "ap_block_pp5_stage0_subdone", "PreState" : ["ap_ST_fsm_state181"], "QuitState" : "ap_ST_fsm_pp5_stage0", "QuitStateIter" : "ap_enable_reg_pp5_iter3", "QuitStateBlock" : "ap_block_pp5_stage0_subdone", "PostState" : ["ap_ST_fsm_state194"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state202", "LastState" : ["ap_ST_fsm_state204"], "QuitState" : ["ap_ST_fsm_state202"], "PreState" : ["ap_ST_fsm_state201"], "PostState" : ["ap_ST_fsm_pp6_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp6_stage0", "FirstStateIter" : "ap_enable_reg_pp6_iter0", "FirstStateBlock" : "ap_block_pp6_stage0_subdone", "LastState" : "ap_ST_fsm_pp6_stage0", "LastStateIter" : "ap_enable_reg_pp6_iter3", "LastStateBlock" : "ap_block_pp6_stage0_subdone", "PreState" : ["ap_ST_fsm_state202"], "QuitState" : "ap_ST_fsm_pp6_stage0", "QuitStateIter" : "ap_enable_reg_pp6_iter3", "QuitStateBlock" : "ap_block_pp6_stage0_subdone", "PostState" : ["ap_ST_fsm_state215"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state223", "LastState" : ["ap_ST_fsm_state225"], "QuitState" : ["ap_ST_fsm_state223"], "PreState" : ["ap_ST_fsm_state222"], "PostState" : ["ap_ST_fsm_pp7_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp7_stage0", "FirstStateIter" : "ap_enable_reg_pp7_iter0", "FirstStateBlock" : "ap_block_pp7_stage0_subdone", "LastState" : "ap_ST_fsm_pp7_stage0", "LastStateIter" : "ap_enable_reg_pp7_iter3", "LastStateBlock" : "ap_block_pp7_stage0_subdone", "PreState" : ["ap_ST_fsm_state223"], "QuitState" : "ap_ST_fsm_pp7_stage0", "QuitStateIter" : "ap_enable_reg_pp7_iter3", "QuitStateBlock" : "ap_block_pp7_stage0_subdone", "PostState" : ["ap_ST_fsm_state236"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state244", "LastState" : ["ap_ST_fsm_state246"], "QuitState" : ["ap_ST_fsm_state244"], "PreState" : ["ap_ST_fsm_state243"], "PostState" : ["ap_ST_fsm_pp8_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp8_stage0", "FirstStateIter" : "ap_enable_reg_pp8_iter0", "FirstStateBlock" : "ap_block_pp8_stage0_subdone", "LastState" : "ap_ST_fsm_pp8_stage0", "LastStateIter" : "ap_enable_reg_pp8_iter3", "LastStateBlock" : "ap_block_pp8_stage0_subdone", "PreState" : ["ap_ST_fsm_state244"], "QuitState" : "ap_ST_fsm_pp8_stage0", "QuitStateIter" : "ap_enable_reg_pp8_iter3", "QuitStateBlock" : "ap_block_pp8_stage0_subdone", "PostState" : ["ap_ST_fsm_state257"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state265", "LastState" : ["ap_ST_fsm_state267"], "QuitState" : ["ap_ST_fsm_state265"], "PreState" : ["ap_ST_fsm_state264"], "PostState" : ["ap_ST_fsm_pp9_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp9_stage0", "FirstStateIter" : "ap_enable_reg_pp9_iter0", "FirstStateBlock" : "ap_block_pp9_stage0_subdone", "LastState" : "ap_ST_fsm_pp9_stage0", "LastStateIter" : "ap_enable_reg_pp9_iter3", "LastStateBlock" : "ap_block_pp9_stage0_subdone", "PreState" : ["ap_ST_fsm_state265"], "QuitState" : "ap_ST_fsm_pp9_stage0", "QuitStateIter" : "ap_enable_reg_pp9_iter3", "QuitStateBlock" : "ap_block_pp9_stage0_subdone", "PostState" : ["ap_ST_fsm_state278"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state286", "LastState" : ["ap_ST_fsm_state288"], "QuitState" : ["ap_ST_fsm_state286"], "PreState" : ["ap_ST_fsm_state285"], "PostState" : ["ap_ST_fsm_pp10_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp10_stage0", "FirstStateIter" : "ap_enable_reg_pp10_iter0", "FirstStateBlock" : "ap_block_pp10_stage0_subdone", "LastState" : "ap_ST_fsm_pp10_stage0", "LastStateIter" : "ap_enable_reg_pp10_iter3", "LastStateBlock" : "ap_block_pp10_stage0_subdone", "PreState" : ["ap_ST_fsm_state286"], "QuitState" : "ap_ST_fsm_pp10_stage0", "QuitStateIter" : "ap_enable_reg_pp10_iter3", "QuitStateBlock" : "ap_block_pp10_stage0_subdone", "PostState" : ["ap_ST_fsm_state299"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state307", "LastState" : ["ap_ST_fsm_state309"], "QuitState" : ["ap_ST_fsm_state307"], "PreState" : ["ap_ST_fsm_state306"], "PostState" : ["ap_ST_fsm_pp11_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp11_stage0", "FirstStateIter" : "ap_enable_reg_pp11_iter0", "FirstStateBlock" : "ap_block_pp11_stage0_subdone", "LastState" : "ap_ST_fsm_pp11_stage0", "LastStateIter" : "ap_enable_reg_pp11_iter3", "LastStateBlock" : "ap_block_pp11_stage0_subdone", "PreState" : ["ap_ST_fsm_state307"], "QuitState" : "ap_ST_fsm_pp11_stage0", "QuitStateIter" : "ap_enable_reg_pp11_iter3", "QuitStateBlock" : "ap_block_pp11_stage0_subdone", "PostState" : ["ap_ST_fsm_state320"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state328", "LastState" : ["ap_ST_fsm_state330"], "QuitState" : ["ap_ST_fsm_state328"], "PreState" : ["ap_ST_fsm_state327"], "PostState" : ["ap_ST_fsm_pp12_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp12_stage0", "FirstStateIter" : "ap_enable_reg_pp12_iter0", "FirstStateBlock" : "ap_block_pp12_stage0_subdone", "LastState" : "ap_ST_fsm_pp12_stage0", "LastStateIter" : "ap_enable_reg_pp12_iter3", "LastStateBlock" : "ap_block_pp12_stage0_subdone", "PreState" : ["ap_ST_fsm_state328"], "QuitState" : "ap_ST_fsm_pp12_stage0", "QuitStateIter" : "ap_enable_reg_pp12_iter3", "QuitStateBlock" : "ap_block_pp12_stage0_subdone", "PostState" : ["ap_ST_fsm_state341"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state349", "LastState" : ["ap_ST_fsm_state351"], "QuitState" : ["ap_ST_fsm_state349"], "PreState" : ["ap_ST_fsm_state348"], "PostState" : ["ap_ST_fsm_pp13_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp13_stage0", "FirstStateIter" : "ap_enable_reg_pp13_iter0", "FirstStateBlock" : "ap_block_pp13_stage0_subdone", "LastState" : "ap_ST_fsm_pp13_stage0", "LastStateIter" : "ap_enable_reg_pp13_iter3", "LastStateBlock" : "ap_block_pp13_stage0_subdone", "PreState" : ["ap_ST_fsm_state349"], "QuitState" : "ap_ST_fsm_pp13_stage0", "QuitStateIter" : "ap_enable_reg_pp13_iter3", "QuitStateBlock" : "ap_block_pp13_stage0_subdone", "PostState" : ["ap_ST_fsm_state362"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state370", "LastState" : ["ap_ST_fsm_state372"], "QuitState" : ["ap_ST_fsm_state370"], "PreState" : ["ap_ST_fsm_state369"], "PostState" : ["ap_ST_fsm_pp14_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp14_stage0", "FirstStateIter" : "ap_enable_reg_pp14_iter0", "FirstStateBlock" : "ap_block_pp14_stage0_subdone", "LastState" : "ap_ST_fsm_pp14_stage0", "LastStateIter" : "ap_enable_reg_pp14_iter3", "LastStateBlock" : "ap_block_pp14_stage0_subdone", "PreState" : ["ap_ST_fsm_state370"], "QuitState" : "ap_ST_fsm_pp14_stage0", "QuitStateIter" : "ap_enable_reg_pp14_iter3", "QuitStateBlock" : "ap_block_pp14_stage0_subdone", "PostState" : ["ap_ST_fsm_state383"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state391", "LastState" : ["ap_ST_fsm_state393"], "QuitState" : ["ap_ST_fsm_state391"], "PreState" : ["ap_ST_fsm_state390"], "PostState" : ["ap_ST_fsm_pp15_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp15_stage0", "FirstStateIter" : "ap_enable_reg_pp15_iter0", "FirstStateBlock" : "ap_block_pp15_stage0_subdone", "LastState" : "ap_ST_fsm_pp15_stage0", "LastStateIter" : "ap_enable_reg_pp15_iter3", "LastStateBlock" : "ap_block_pp15_stage0_subdone", "PreState" : ["ap_ST_fsm_state391"], "QuitState" : "ap_ST_fsm_pp15_stage0", "QuitStateIter" : "ap_enable_reg_pp15_iter3", "QuitStateBlock" : "ap_block_pp15_stage0_subdone", "PostState" : ["ap_ST_fsm_state404"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state412", "LastState" : ["ap_ST_fsm_state414"], "QuitState" : ["ap_ST_fsm_state412"], "PreState" : ["ap_ST_fsm_state411"], "PostState" : ["ap_ST_fsm_pp16_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp16_stage0", "FirstStateIter" : "ap_enable_reg_pp16_iter0", "FirstStateBlock" : "ap_block_pp16_stage0_subdone", "LastState" : "ap_ST_fsm_pp16_stage0", "LastStateIter" : "ap_enable_reg_pp16_iter3", "LastStateBlock" : "ap_block_pp16_stage0_subdone", "PreState" : ["ap_ST_fsm_state412"], "QuitState" : "ap_ST_fsm_pp16_stage0", "QuitStateIter" : "ap_enable_reg_pp16_iter3", "QuitStateBlock" : "ap_block_pp16_stage0_subdone", "PostState" : ["ap_ST_fsm_state425"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state433", "LastState" : ["ap_ST_fsm_state435"], "QuitState" : ["ap_ST_fsm_state433"], "PreState" : ["ap_ST_fsm_state432"], "PostState" : ["ap_ST_fsm_pp17_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp17_stage0", "FirstStateIter" : "ap_enable_reg_pp17_iter0", "FirstStateBlock" : "ap_block_pp17_stage0_subdone", "LastState" : "ap_ST_fsm_pp17_stage0", "LastStateIter" : "ap_enable_reg_pp17_iter3", "LastStateBlock" : "ap_block_pp17_stage0_subdone", "PreState" : ["ap_ST_fsm_state433"], "QuitState" : "ap_ST_fsm_pp17_stage0", "QuitStateIter" : "ap_enable_reg_pp17_iter3", "QuitStateBlock" : "ap_block_pp17_stage0_subdone", "PostState" : ["ap_ST_fsm_state446"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state454", "LastState" : ["ap_ST_fsm_state456"], "QuitState" : ["ap_ST_fsm_state454"], "PreState" : ["ap_ST_fsm_state453"], "PostState" : ["ap_ST_fsm_pp18_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp18_stage0", "FirstStateIter" : "ap_enable_reg_pp18_iter0", "FirstStateBlock" : "ap_block_pp18_stage0_subdone", "LastState" : "ap_ST_fsm_pp18_stage0", "LastStateIter" : "ap_enable_reg_pp18_iter3", "LastStateBlock" : "ap_block_pp18_stage0_subdone", "PreState" : ["ap_ST_fsm_state454"], "QuitState" : "ap_ST_fsm_pp18_stage0", "QuitStateIter" : "ap_enable_reg_pp18_iter3", "QuitStateBlock" : "ap_block_pp18_stage0_subdone", "PostState" : ["ap_ST_fsm_state467"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state475", "LastState" : ["ap_ST_fsm_state477"], "QuitState" : ["ap_ST_fsm_state475"], "PreState" : ["ap_ST_fsm_state474"], "PostState" : ["ap_ST_fsm_pp19_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp19_stage0", "FirstStateIter" : "ap_enable_reg_pp19_iter0", "FirstStateBlock" : "ap_block_pp19_stage0_subdone", "LastState" : "ap_ST_fsm_pp19_stage0", "LastStateIter" : "ap_enable_reg_pp19_iter3", "LastStateBlock" : "ap_block_pp19_stage0_subdone", "PreState" : ["ap_ST_fsm_state475"], "QuitState" : "ap_ST_fsm_pp19_stage0", "QuitStateIter" : "ap_enable_reg_pp19_iter3", "QuitStateBlock" : "ap_block_pp19_stage0_subdone", "PostState" : ["ap_ST_fsm_state488"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state496", "LastState" : ["ap_ST_fsm_state498"], "QuitState" : ["ap_ST_fsm_state496"], "PreState" : ["ap_ST_fsm_state495"], "PostState" : ["ap_ST_fsm_pp20_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp20_stage0", "FirstStateIter" : "ap_enable_reg_pp20_iter0", "FirstStateBlock" : "ap_block_pp20_stage0_subdone", "LastState" : "ap_ST_fsm_pp20_stage0", "LastStateIter" : "ap_enable_reg_pp20_iter3", "LastStateBlock" : "ap_block_pp20_stage0_subdone", "PreState" : ["ap_ST_fsm_state496"], "QuitState" : "ap_ST_fsm_pp20_stage0", "QuitStateIter" : "ap_enable_reg_pp20_iter3", "QuitStateBlock" : "ap_block_pp20_stage0_subdone", "PostState" : ["ap_ST_fsm_state509"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state517", "LastState" : ["ap_ST_fsm_state519"], "QuitState" : ["ap_ST_fsm_state517"], "PreState" : ["ap_ST_fsm_state516"], "PostState" : ["ap_ST_fsm_pp21_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp21_stage0", "FirstStateIter" : "ap_enable_reg_pp21_iter0", "FirstStateBlock" : "ap_block_pp21_stage0_subdone", "LastState" : "ap_ST_fsm_pp21_stage0", "LastStateIter" : "ap_enable_reg_pp21_iter3", "LastStateBlock" : "ap_block_pp21_stage0_subdone", "PreState" : ["ap_ST_fsm_state517"], "QuitState" : "ap_ST_fsm_pp21_stage0", "QuitStateIter" : "ap_enable_reg_pp21_iter3", "QuitStateBlock" : "ap_block_pp21_stage0_subdone", "PostState" : ["ap_ST_fsm_state530"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state538", "LastState" : ["ap_ST_fsm_state540"], "QuitState" : ["ap_ST_fsm_state538"], "PreState" : ["ap_ST_fsm_state537"], "PostState" : ["ap_ST_fsm_pp22_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp22_stage0", "FirstStateIter" : "ap_enable_reg_pp22_iter0", "FirstStateBlock" : "ap_block_pp22_stage0_subdone", "LastState" : "ap_ST_fsm_pp22_stage0", "LastStateIter" : "ap_enable_reg_pp22_iter3", "LastStateBlock" : "ap_block_pp22_stage0_subdone", "PreState" : ["ap_ST_fsm_state538"], "QuitState" : "ap_ST_fsm_pp22_stage0", "QuitStateIter" : "ap_enable_reg_pp22_iter3", "QuitStateBlock" : "ap_block_pp22_stage0_subdone", "PostState" : ["ap_ST_fsm_state551"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state559", "LastState" : ["ap_ST_fsm_state561"], "QuitState" : ["ap_ST_fsm_state559"], "PreState" : ["ap_ST_fsm_state558"], "PostState" : ["ap_ST_fsm_pp23_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp23_stage0", "FirstStateIter" : "ap_enable_reg_pp23_iter0", "FirstStateBlock" : "ap_block_pp23_stage0_subdone", "LastState" : "ap_ST_fsm_pp23_stage0", "LastStateIter" : "ap_enable_reg_pp23_iter3", "LastStateBlock" : "ap_block_pp23_stage0_subdone", "PreState" : ["ap_ST_fsm_state559"], "QuitState" : "ap_ST_fsm_pp23_stage0", "QuitStateIter" : "ap_enable_reg_pp23_iter3", "QuitStateBlock" : "ap_block_pp23_stage0_subdone", "PostState" : ["ap_ST_fsm_state572"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state580", "LastState" : ["ap_ST_fsm_state582"], "QuitState" : ["ap_ST_fsm_state580"], "PreState" : ["ap_ST_fsm_state579"], "PostState" : ["ap_ST_fsm_pp24_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp24_stage0", "FirstStateIter" : "ap_enable_reg_pp24_iter0", "FirstStateBlock" : "ap_block_pp24_stage0_subdone", "LastState" : "ap_ST_fsm_pp24_stage0", "LastStateIter" : "ap_enable_reg_pp24_iter3", "LastStateBlock" : "ap_block_pp24_stage0_subdone", "PreState" : ["ap_ST_fsm_state580"], "QuitState" : "ap_ST_fsm_pp24_stage0", "QuitStateIter" : "ap_enable_reg_pp24_iter3", "QuitStateBlock" : "ap_block_pp24_stage0_subdone", "PostState" : ["ap_ST_fsm_state593"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state601", "LastState" : ["ap_ST_fsm_state603"], "QuitState" : ["ap_ST_fsm_state601"], "PreState" : ["ap_ST_fsm_state600"], "PostState" : ["ap_ST_fsm_pp25_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp25_stage0", "FirstStateIter" : "ap_enable_reg_pp25_iter0", "FirstStateBlock" : "ap_block_pp25_stage0_subdone", "LastState" : "ap_ST_fsm_pp25_stage0", "LastStateIter" : "ap_enable_reg_pp25_iter3", "LastStateBlock" : "ap_block_pp25_stage0_subdone", "PreState" : ["ap_ST_fsm_state601"], "QuitState" : "ap_ST_fsm_pp25_stage0", "QuitStateIter" : "ap_enable_reg_pp25_iter3", "QuitStateBlock" : "ap_block_pp25_stage0_subdone", "PostState" : ["ap_ST_fsm_state614"]}},
			{"Name" : "READ_NEIGHBOR_FEATURES", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state622", "LastState" : ["ap_ST_fsm_state624"], "QuitState" : ["ap_ST_fsm_state622"], "PreState" : ["ap_ST_fsm_state621"], "PostState" : ["ap_ST_fsm_pp26_stage0"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "CONV_ACCUMULATE_VITIS_LOOP_288_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp26_stage0", "FirstStateIter" : "ap_enable_reg_pp26_iter0", "FirstStateBlock" : "ap_block_pp26_stage0_subdone", "LastState" : "ap_ST_fsm_pp26_stage0", "LastStateIter" : "ap_enable_reg_pp26_iter3", "LastStateBlock" : "ap_block_pp26_stage0_subdone", "PreState" : ["ap_ST_fsm_state622"], "QuitState" : "ap_ST_fsm_pp26_stage0", "QuitStateIter" : "ap_enable_reg_pp26_iter3", "QuitStateBlock" : "ap_block_pp26_stage0_subdone", "PostState" : ["ap_ST_fsm_state635"]}},
			{"Name" : "RELU_ACTIVATION", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state636", "LastState" : ["ap_ST_fsm_state638"], "QuitState" : ["ap_ST_fsm_state636"], "PreState" : ["ap_ST_fsm_state635"], "PostState" : ["ap_ST_fsm_state639"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "WRITE_OUTPUT_CROSS_ROW", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp28_stage0", "FirstStateIter" : "ap_enable_reg_pp28_iter0", "FirstStateBlock" : "ap_block_pp28_stage0_subdone", "LastState" : "ap_ST_fsm_pp28_stage0", "LastStateIter" : "ap_enable_reg_pp28_iter2", "LastStateBlock" : "ap_block_pp28_stage0_subdone", "PreState" : ["ap_ST_fsm_state639"], "QuitState" : "ap_ST_fsm_pp28_stage0", "QuitStateIter" : "ap_enable_reg_pp28_iter2", "QuitStateBlock" : "ap_block_pp28_stage0_subdone", "PostState" : ["ap_ST_fsm_state651"]}},
			{"Name" : "WRITE_OUTPUT_DIRECT", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_pp27_stage0", "FirstStateIter" : "ap_enable_reg_pp27_iter0", "FirstStateBlock" : "ap_block_pp27_stage0_subdone", "LastState" : "ap_ST_fsm_pp27_stage0", "LastStateIter" : "ap_enable_reg_pp27_iter2", "LastStateBlock" : "ap_block_pp27_stage0_subdone", "PreState" : ["ap_ST_fsm_state639"], "QuitState" : "ap_ST_fsm_pp27_stage0", "QuitStateIter" : "ap_enable_reg_pp27_iter2", "QuitStateBlock" : "ap_block_pp27_stage0_subdone", "PostState" : ["ap_ST_fsm_state643"]}},
			{"Name" : "PROCESS_PRUNED_VOXELS", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "461", "FirstState" : "ap_ST_fsm_state67", "LastState" : ["ap_ST_fsm_state647"], "QuitState" : ["ap_ST_fsm_state67"], "PreState" : ["ap_ST_fsm_state66"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_features_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.neighbor_features_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_convolution_with_persistent_accelerator_Outline_INIT_OUTPUT_BIAS_fu_3295", "Parent" : "0",
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
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_convolution_with_persistent_accelerator_Outline_READ_NEIGHBOR_FEATURES_fu_3303", "Parent" : "0",
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
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_4_no_dsp_1_U50", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U51", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U52", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U53", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U54", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U55", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U56", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U57", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U58", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U59", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U60", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U61", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U62", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U63", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U64", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U65", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U66", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U67", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U68", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U69", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U70", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_42s_42_1_1_U71", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_60s_32ns_42_64_seq_1_U72", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_60s_32ns_42_64_seq_1_U73", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_60s_32ns_42_64_seq_1_U74", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_60s_32ns_42_64_seq_1_U75", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_60s_32ns_42_64_seq_1_U76", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_60s_32ns_42_64_seq_1_U77", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_60s_32ns_42_64_seq_1_U78", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_60s_32ns_42_64_seq_1_U79", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_60s_32ns_42_64_seq_1_U80", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_59s_32ns_42_63_seq_1_U81", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_59s_32ns_42_63_seq_1_U82", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_59s_32ns_42_63_seq_1_U83", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_59s_32ns_42_63_seq_1_U84", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_59s_32ns_42_63_seq_1_U85", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_59s_32ns_42_63_seq_1_U86", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_58s_32ns_42_62_seq_1_U87", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_58s_32ns_42_62_seq_1_U88", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_58s_32ns_42_62_seq_1_U89", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_58s_32ns_42_62_seq_1_U90", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_4ns_32ns_13_8_seq_1_U91", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_3ns_32ns_12_7_seq_1_U92", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_4ns_32ns_13_8_seq_1_U93", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_1ns_32ns_1_5_seq_1_U94", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_4ns_32ns_13_8_seq_1_U95", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_3ns_32ns_12_7_seq_1_U96", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_4ns_32ns_13_8_seq_1_U97", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_13s_13_1_1_U98", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_12s_12_1_1_U99", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_13s_13_1_1_U100", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_13s_13_1_1_U101", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_12s_12_1_1_U102", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_13s_13_1_1_U103", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_11ns_22_1_1_U104", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	layer_convolution_with_persistent_accelerator {
		config_input_channels_val {Type I LastRead 64 FirstWrite -1}
		config_output_channels_val {Type I LastRead 65 FirstWrite -1}
		config_output_spatial_dim_val {Type I LastRead 65 FirstWrite -1}
		layer_weights_12 {Type I LastRead 338 FirstWrite -1}
		layer_biases_12 {Type I LastRead 1 FirstWrite -1}
		bitmap_info_0_4_0_0_0_val {Type I LastRead 0 FirstWrite -1}
		gmem_write {Type I LastRead 338 FirstWrite -1}
		pruned_dram_read {Type I LastRead 65 FirstWrite -1}
		gmem_read {Type O LastRead 347 FirstWrite 344}
		pruned_dram_write {Type I LastRead 65 FirstWrite -1}
		num_pruned_voxels {Type I LastRead 65 FirstWrite -1}}
	layer_convolution_with_persistent_accelerator_Outline_INIT_OUTPUT_BIAS {
		config_output_channels_val {Type I LastRead 0 FirstWrite -1}
		layer_biases_12 {Type I LastRead 1 FirstWrite -1}
		output_features {Type O LastRead -1 FirstWrite 2}}
	layer_convolution_with_persistent_accelerator_Outline_READ_NEIGHBOR_FEATURES {
		config_input_channels_val {Type I LastRead 0 FirstWrite -1}
		gmem_write {Type I LastRead 2 FirstWrite -1}
		p_cast_cast {Type I LastRead 0 FirstWrite -1}
		neighbor_features {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4674066", "Max" : "8502419100066"}
	, {"Name" : "Interval", "Min" : "4674066", "Max" : "8502419100066"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
	{"Pipeline" : "3", "EnableSignal" : "ap_enable_pp3"}
	{"Pipeline" : "4", "EnableSignal" : "ap_enable_pp4"}
	{"Pipeline" : "5", "EnableSignal" : "ap_enable_pp5"}
	{"Pipeline" : "6", "EnableSignal" : "ap_enable_pp6"}
	{"Pipeline" : "7", "EnableSignal" : "ap_enable_pp7"}
	{"Pipeline" : "8", "EnableSignal" : "ap_enable_pp8"}
	{"Pipeline" : "9", "EnableSignal" : "ap_enable_pp9"}
	{"Pipeline" : "10", "EnableSignal" : "ap_enable_pp10"}
	{"Pipeline" : "11", "EnableSignal" : "ap_enable_pp11"}
	{"Pipeline" : "12", "EnableSignal" : "ap_enable_pp12"}
	{"Pipeline" : "13", "EnableSignal" : "ap_enable_pp13"}
	{"Pipeline" : "14", "EnableSignal" : "ap_enable_pp14"}
	{"Pipeline" : "15", "EnableSignal" : "ap_enable_pp15"}
	{"Pipeline" : "16", "EnableSignal" : "ap_enable_pp16"}
	{"Pipeline" : "17", "EnableSignal" : "ap_enable_pp17"}
	{"Pipeline" : "18", "EnableSignal" : "ap_enable_pp18"}
	{"Pipeline" : "19", "EnableSignal" : "ap_enable_pp19"}
	{"Pipeline" : "20", "EnableSignal" : "ap_enable_pp20"}
	{"Pipeline" : "21", "EnableSignal" : "ap_enable_pp21"}
	{"Pipeline" : "22", "EnableSignal" : "ap_enable_pp22"}
	{"Pipeline" : "23", "EnableSignal" : "ap_enable_pp23"}
	{"Pipeline" : "24", "EnableSignal" : "ap_enable_pp24"}
	{"Pipeline" : "25", "EnableSignal" : "ap_enable_pp25"}
	{"Pipeline" : "26", "EnableSignal" : "ap_enable_pp26"}
	{"Pipeline" : "27", "EnableSignal" : "ap_enable_pp27"}
	{"Pipeline" : "28", "EnableSignal" : "ap_enable_pp28"}
]}

set Spec2ImplPortList { 
	config_input_channels_val { ap_none {  { config_input_channels_val in_data 0 11 } } }
	config_output_channels_val { ap_none {  { config_output_channels_val in_data 0 11 } } }
	config_output_spatial_dim_val { ap_none {  { config_output_spatial_dim_val in_data 0 7 } } }
	layer_weights_12 { bram {  { layer_weights_12_Addr_A MemPortADDR2 1 32 }  { layer_weights_12_EN_A MemPortCE2 1 1 }  { layer_weights_12_WEN_A MemPortWE2 1 4 }  { layer_weights_12_Din_A MemPortDIN2 1 32 }  { layer_weights_12_Dout_A MemPortDOUT2 0 32 } } }
	layer_biases_12 { bram {  { layer_biases_12_Addr_A MemPortADDR2 1 32 }  { layer_biases_12_EN_A MemPortCE2 1 1 }  { layer_biases_12_WEN_A MemPortWE2 1 4 }  { layer_biases_12_Din_A MemPortDIN2 1 32 }  { layer_biases_12_Dout_A MemPortDOUT2 0 32 } } }
	bitmap_info_0_4_0_0_0_val { ap_none {  { bitmap_info_0_4_0_0_0_val in_data 0 32 } } }
	 { m_axi {  { m_axi_gmem_write_0_AWVALID VALID 1 1 }  { m_axi_gmem_write_0_AWREADY READY 0 1 }  { m_axi_gmem_write_0_AWADDR ADDR 1 64 }  { m_axi_gmem_write_0_AWID ID 1 1 }  { m_axi_gmem_write_0_AWLEN SIZE 1 32 }  { m_axi_gmem_write_0_AWSIZE BURST 1 3 }  { m_axi_gmem_write_0_AWBURST LOCK 1 2 }  { m_axi_gmem_write_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_write_0_AWCACHE PROT 1 4 }  { m_axi_gmem_write_0_AWPROT QOS 1 3 }  { m_axi_gmem_write_0_AWQOS REGION 1 4 }  { m_axi_gmem_write_0_AWREGION USER 1 4 }  { m_axi_gmem_write_0_AWUSER DATA 1 1 }  { m_axi_gmem_write_0_WVALID VALID 1 1 }  { m_axi_gmem_write_0_WREADY READY 0 1 }  { m_axi_gmem_write_0_WDATA FIFONUM 1 32 }  { m_axi_gmem_write_0_WSTRB STRB 1 4 }  { m_axi_gmem_write_0_WLAST LAST 1 1 }  { m_axi_gmem_write_0_WID ID 1 1 }  { m_axi_gmem_write_0_WUSER DATA 1 1 }  { m_axi_gmem_write_0_ARVALID VALID 1 1 }  { m_axi_gmem_write_0_ARREADY READY 0 1 }  { m_axi_gmem_write_0_ARADDR ADDR 1 64 }  { m_axi_gmem_write_0_ARID ID 1 1 }  { m_axi_gmem_write_0_ARLEN SIZE 1 32 }  { m_axi_gmem_write_0_ARSIZE BURST 1 3 }  { m_axi_gmem_write_0_ARBURST LOCK 1 2 }  { m_axi_gmem_write_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_write_0_ARCACHE PROT 1 4 }  { m_axi_gmem_write_0_ARPROT QOS 1 3 }  { m_axi_gmem_write_0_ARQOS REGION 1 4 }  { m_axi_gmem_write_0_ARREGION USER 1 4 }  { m_axi_gmem_write_0_ARUSER DATA 1 1 }  { m_axi_gmem_write_0_RVALID VALID 0 1 }  { m_axi_gmem_write_0_RREADY READY 1 1 }  { m_axi_gmem_write_0_RDATA FIFONUM 0 32 }  { m_axi_gmem_write_0_RLAST LAST 0 1 }  { m_axi_gmem_write_0_RID ID 0 1 }  { m_axi_gmem_write_0_RFIFONUM LEN 0 13 }  { m_axi_gmem_write_0_RUSER DATA 0 1 }  { m_axi_gmem_write_0_RRESP RESP 0 2 }  { m_axi_gmem_write_0_BVALID VALID 0 1 }  { m_axi_gmem_write_0_BREADY READY 1 1 }  { m_axi_gmem_write_0_BRESP RESP 0 2 }  { m_axi_gmem_write_0_BID ID 0 1 }  { m_axi_gmem_write_0_BUSER DATA 0 1 } } }
	pruned_dram_read { ap_none {  { pruned_dram_read in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem_read_0_AWVALID VALID 1 1 }  { m_axi_gmem_read_0_AWREADY READY 0 1 }  { m_axi_gmem_read_0_AWADDR ADDR 1 64 }  { m_axi_gmem_read_0_AWID ID 1 1 }  { m_axi_gmem_read_0_AWLEN SIZE 1 32 }  { m_axi_gmem_read_0_AWSIZE BURST 1 3 }  { m_axi_gmem_read_0_AWBURST LOCK 1 2 }  { m_axi_gmem_read_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_read_0_AWCACHE PROT 1 4 }  { m_axi_gmem_read_0_AWPROT QOS 1 3 }  { m_axi_gmem_read_0_AWQOS REGION 1 4 }  { m_axi_gmem_read_0_AWREGION USER 1 4 }  { m_axi_gmem_read_0_AWUSER DATA 1 1 }  { m_axi_gmem_read_0_WVALID VALID 1 1 }  { m_axi_gmem_read_0_WREADY READY 0 1 }  { m_axi_gmem_read_0_WDATA FIFONUM 1 32 }  { m_axi_gmem_read_0_WSTRB STRB 1 4 }  { m_axi_gmem_read_0_WLAST LAST 1 1 }  { m_axi_gmem_read_0_WID ID 1 1 }  { m_axi_gmem_read_0_WUSER DATA 1 1 }  { m_axi_gmem_read_0_ARVALID VALID 1 1 }  { m_axi_gmem_read_0_ARREADY READY 0 1 }  { m_axi_gmem_read_0_ARADDR ADDR 1 64 }  { m_axi_gmem_read_0_ARID ID 1 1 }  { m_axi_gmem_read_0_ARLEN SIZE 1 32 }  { m_axi_gmem_read_0_ARSIZE BURST 1 3 }  { m_axi_gmem_read_0_ARBURST LOCK 1 2 }  { m_axi_gmem_read_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_read_0_ARCACHE PROT 1 4 }  { m_axi_gmem_read_0_ARPROT QOS 1 3 }  { m_axi_gmem_read_0_ARQOS REGION 1 4 }  { m_axi_gmem_read_0_ARREGION USER 1 4 }  { m_axi_gmem_read_0_ARUSER DATA 1 1 }  { m_axi_gmem_read_0_RVALID VALID 0 1 }  { m_axi_gmem_read_0_RREADY READY 1 1 }  { m_axi_gmem_read_0_RDATA FIFONUM 0 32 }  { m_axi_gmem_read_0_RLAST LAST 0 1 }  { m_axi_gmem_read_0_RID ID 0 1 }  { m_axi_gmem_read_0_RFIFONUM LEN 0 13 }  { m_axi_gmem_read_0_RUSER DATA 0 1 }  { m_axi_gmem_read_0_RRESP RESP 0 2 }  { m_axi_gmem_read_0_BVALID VALID 0 1 }  { m_axi_gmem_read_0_BREADY READY 1 1 }  { m_axi_gmem_read_0_BRESP RESP 0 2 }  { m_axi_gmem_read_0_BID ID 0 1 }  { m_axi_gmem_read_0_BUSER DATA 0 1 } } }
	pruned_dram_write { ap_none {  { pruned_dram_write in_data 0 64 } } }
	num_pruned_voxels { ap_none {  { num_pruned_voxels in_data 0 32 } } }
}
