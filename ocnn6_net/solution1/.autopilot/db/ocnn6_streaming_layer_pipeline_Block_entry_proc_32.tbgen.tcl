set moduleName ocnn6_streaming_layer_pipeline_Block_entry_proc_32
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 52
set C_modelName {ocnn6_streaming_layer_pipeline_Block_entry_proc.32}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ layer_weights int 64 regular  }
	{ p_out int 64 regular {fifo 1}  }
	{ p_out1 int 64 regular {fifo 1}  }
	{ p_out2 int 64 regular {fifo 1}  }
	{ p_out3 int 64 regular {fifo 1}  }
	{ p_out4 int 64 regular {fifo 1}  }
	{ p_out5 int 64 regular {fifo 1}  }
	{ p_out6 int 64 regular {fifo 1}  }
	{ p_out7 int 64 regular {fifo 1}  }
	{ p_out8 int 64 regular {fifo 1}  }
	{ p_out9 int 64 regular {fifo 1}  }
	{ p_out10 int 64 regular {fifo 1}  }
	{ p_out11 int 64 regular {fifo 1}  }
	{ p_out12 int 64 regular {fifo 1}  }
	{ p_out13 int 64 regular {fifo 1}  }
	{ p_out14 int 64 regular {fifo 1}  }
	{ p_out15 int 64 regular {fifo 1}  }
	{ p_out16 int 64 regular {fifo 1}  }
	{ p_out17 int 64 regular {fifo 1}  }
	{ p_out18 int 64 regular {fifo 1}  }
	{ p_out19 int 64 regular {fifo 1}  }
	{ p_out20 int 64 regular {fifo 1}  }
	{ p_out21 int 64 regular {fifo 1}  }
	{ p_out22 int 64 regular {fifo 1}  }
	{ p_out23 int 64 regular {fifo 1}  }
	{ p_out24 int 64 regular {fifo 1}  }
	{ p_out25 int 64 regular {fifo 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "layer_weights", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out1", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out2", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out3", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out4", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out5", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out6", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out7", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out8", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out9", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out10", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out11", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out12", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out13", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out14", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out15", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out16", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out17", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out18", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out19", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out20", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out21", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out22", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out23", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out24", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out25", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 138
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ layer_weights sc_in sc_lv 64 signal 0 } 
	{ p_out_din sc_out sc_lv 64 signal 1 } 
	{ p_out_full_n sc_in sc_logic 1 signal 1 } 
	{ p_out_write sc_out sc_logic 1 signal 1 } 
	{ p_out_num_data_valid sc_in sc_lv 11 signal 1 } 
	{ p_out_fifo_cap sc_in sc_lv 11 signal 1 } 
	{ p_out1_din sc_out sc_lv 64 signal 2 } 
	{ p_out1_full_n sc_in sc_logic 1 signal 2 } 
	{ p_out1_write sc_out sc_logic 1 signal 2 } 
	{ p_out1_num_data_valid sc_in sc_lv 11 signal 2 } 
	{ p_out1_fifo_cap sc_in sc_lv 11 signal 2 } 
	{ p_out2_din sc_out sc_lv 64 signal 3 } 
	{ p_out2_full_n sc_in sc_logic 1 signal 3 } 
	{ p_out2_write sc_out sc_logic 1 signal 3 } 
	{ p_out2_num_data_valid sc_in sc_lv 11 signal 3 } 
	{ p_out2_fifo_cap sc_in sc_lv 11 signal 3 } 
	{ p_out3_din sc_out sc_lv 64 signal 4 } 
	{ p_out3_full_n sc_in sc_logic 1 signal 4 } 
	{ p_out3_write sc_out sc_logic 1 signal 4 } 
	{ p_out3_num_data_valid sc_in sc_lv 11 signal 4 } 
	{ p_out3_fifo_cap sc_in sc_lv 11 signal 4 } 
	{ p_out4_din sc_out sc_lv 64 signal 5 } 
	{ p_out4_full_n sc_in sc_logic 1 signal 5 } 
	{ p_out4_write sc_out sc_logic 1 signal 5 } 
	{ p_out4_num_data_valid sc_in sc_lv 11 signal 5 } 
	{ p_out4_fifo_cap sc_in sc_lv 11 signal 5 } 
	{ p_out5_din sc_out sc_lv 64 signal 6 } 
	{ p_out5_full_n sc_in sc_logic 1 signal 6 } 
	{ p_out5_write sc_out sc_logic 1 signal 6 } 
	{ p_out5_num_data_valid sc_in sc_lv 11 signal 6 } 
	{ p_out5_fifo_cap sc_in sc_lv 11 signal 6 } 
	{ p_out6_din sc_out sc_lv 64 signal 7 } 
	{ p_out6_full_n sc_in sc_logic 1 signal 7 } 
	{ p_out6_write sc_out sc_logic 1 signal 7 } 
	{ p_out6_num_data_valid sc_in sc_lv 11 signal 7 } 
	{ p_out6_fifo_cap sc_in sc_lv 11 signal 7 } 
	{ p_out7_din sc_out sc_lv 64 signal 8 } 
	{ p_out7_full_n sc_in sc_logic 1 signal 8 } 
	{ p_out7_write sc_out sc_logic 1 signal 8 } 
	{ p_out7_num_data_valid sc_in sc_lv 11 signal 8 } 
	{ p_out7_fifo_cap sc_in sc_lv 11 signal 8 } 
	{ p_out8_din sc_out sc_lv 64 signal 9 } 
	{ p_out8_full_n sc_in sc_logic 1 signal 9 } 
	{ p_out8_write sc_out sc_logic 1 signal 9 } 
	{ p_out8_num_data_valid sc_in sc_lv 11 signal 9 } 
	{ p_out8_fifo_cap sc_in sc_lv 11 signal 9 } 
	{ p_out9_din sc_out sc_lv 64 signal 10 } 
	{ p_out9_full_n sc_in sc_logic 1 signal 10 } 
	{ p_out9_write sc_out sc_logic 1 signal 10 } 
	{ p_out9_num_data_valid sc_in sc_lv 11 signal 10 } 
	{ p_out9_fifo_cap sc_in sc_lv 11 signal 10 } 
	{ p_out10_din sc_out sc_lv 64 signal 11 } 
	{ p_out10_full_n sc_in sc_logic 1 signal 11 } 
	{ p_out10_write sc_out sc_logic 1 signal 11 } 
	{ p_out10_num_data_valid sc_in sc_lv 11 signal 11 } 
	{ p_out10_fifo_cap sc_in sc_lv 11 signal 11 } 
	{ p_out11_din sc_out sc_lv 64 signal 12 } 
	{ p_out11_full_n sc_in sc_logic 1 signal 12 } 
	{ p_out11_write sc_out sc_logic 1 signal 12 } 
	{ p_out11_num_data_valid sc_in sc_lv 11 signal 12 } 
	{ p_out11_fifo_cap sc_in sc_lv 11 signal 12 } 
	{ p_out12_din sc_out sc_lv 64 signal 13 } 
	{ p_out12_full_n sc_in sc_logic 1 signal 13 } 
	{ p_out12_write sc_out sc_logic 1 signal 13 } 
	{ p_out12_num_data_valid sc_in sc_lv 11 signal 13 } 
	{ p_out12_fifo_cap sc_in sc_lv 11 signal 13 } 
	{ p_out13_din sc_out sc_lv 64 signal 14 } 
	{ p_out13_full_n sc_in sc_logic 1 signal 14 } 
	{ p_out13_write sc_out sc_logic 1 signal 14 } 
	{ p_out13_num_data_valid sc_in sc_lv 11 signal 14 } 
	{ p_out13_fifo_cap sc_in sc_lv 11 signal 14 } 
	{ p_out14_din sc_out sc_lv 64 signal 15 } 
	{ p_out14_full_n sc_in sc_logic 1 signal 15 } 
	{ p_out14_write sc_out sc_logic 1 signal 15 } 
	{ p_out14_num_data_valid sc_in sc_lv 11 signal 15 } 
	{ p_out14_fifo_cap sc_in sc_lv 11 signal 15 } 
	{ p_out15_din sc_out sc_lv 64 signal 16 } 
	{ p_out15_full_n sc_in sc_logic 1 signal 16 } 
	{ p_out15_write sc_out sc_logic 1 signal 16 } 
	{ p_out15_num_data_valid sc_in sc_lv 11 signal 16 } 
	{ p_out15_fifo_cap sc_in sc_lv 11 signal 16 } 
	{ p_out16_din sc_out sc_lv 64 signal 17 } 
	{ p_out16_full_n sc_in sc_logic 1 signal 17 } 
	{ p_out16_write sc_out sc_logic 1 signal 17 } 
	{ p_out16_num_data_valid sc_in sc_lv 11 signal 17 } 
	{ p_out16_fifo_cap sc_in sc_lv 11 signal 17 } 
	{ p_out17_din sc_out sc_lv 64 signal 18 } 
	{ p_out17_full_n sc_in sc_logic 1 signal 18 } 
	{ p_out17_write sc_out sc_logic 1 signal 18 } 
	{ p_out17_num_data_valid sc_in sc_lv 11 signal 18 } 
	{ p_out17_fifo_cap sc_in sc_lv 11 signal 18 } 
	{ p_out18_din sc_out sc_lv 64 signal 19 } 
	{ p_out18_full_n sc_in sc_logic 1 signal 19 } 
	{ p_out18_write sc_out sc_logic 1 signal 19 } 
	{ p_out18_num_data_valid sc_in sc_lv 11 signal 19 } 
	{ p_out18_fifo_cap sc_in sc_lv 11 signal 19 } 
	{ p_out19_din sc_out sc_lv 64 signal 20 } 
	{ p_out19_full_n sc_in sc_logic 1 signal 20 } 
	{ p_out19_write sc_out sc_logic 1 signal 20 } 
	{ p_out19_num_data_valid sc_in sc_lv 11 signal 20 } 
	{ p_out19_fifo_cap sc_in sc_lv 11 signal 20 } 
	{ p_out20_din sc_out sc_lv 64 signal 21 } 
	{ p_out20_full_n sc_in sc_logic 1 signal 21 } 
	{ p_out20_write sc_out sc_logic 1 signal 21 } 
	{ p_out20_num_data_valid sc_in sc_lv 11 signal 21 } 
	{ p_out20_fifo_cap sc_in sc_lv 11 signal 21 } 
	{ p_out21_din sc_out sc_lv 64 signal 22 } 
	{ p_out21_full_n sc_in sc_logic 1 signal 22 } 
	{ p_out21_write sc_out sc_logic 1 signal 22 } 
	{ p_out21_num_data_valid sc_in sc_lv 11 signal 22 } 
	{ p_out21_fifo_cap sc_in sc_lv 11 signal 22 } 
	{ p_out22_din sc_out sc_lv 64 signal 23 } 
	{ p_out22_full_n sc_in sc_logic 1 signal 23 } 
	{ p_out22_write sc_out sc_logic 1 signal 23 } 
	{ p_out22_num_data_valid sc_in sc_lv 11 signal 23 } 
	{ p_out22_fifo_cap sc_in sc_lv 11 signal 23 } 
	{ p_out23_din sc_out sc_lv 64 signal 24 } 
	{ p_out23_full_n sc_in sc_logic 1 signal 24 } 
	{ p_out23_write sc_out sc_logic 1 signal 24 } 
	{ p_out23_num_data_valid sc_in sc_lv 11 signal 24 } 
	{ p_out23_fifo_cap sc_in sc_lv 11 signal 24 } 
	{ p_out24_din sc_out sc_lv 64 signal 25 } 
	{ p_out24_full_n sc_in sc_logic 1 signal 25 } 
	{ p_out24_write sc_out sc_logic 1 signal 25 } 
	{ p_out24_num_data_valid sc_in sc_lv 11 signal 25 } 
	{ p_out24_fifo_cap sc_in sc_lv 11 signal 25 } 
	{ p_out25_din sc_out sc_lv 64 signal 26 } 
	{ p_out25_full_n sc_in sc_logic 1 signal 26 } 
	{ p_out25_write sc_out sc_logic 1 signal 26 } 
	{ p_out25_num_data_valid sc_in sc_lv 11 signal 26 } 
	{ p_out25_fifo_cap sc_in sc_lv 11 signal 26 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "layer_weights", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "layer_weights", "role": "default" }} , 
 	{ "name": "p_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out", "role": "din" }} , 
 	{ "name": "p_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out", "role": "full_n" }} , 
 	{ "name": "p_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out", "role": "write" }} , 
 	{ "name": "p_out_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out", "role": "num_data_valid" }} , 
 	{ "name": "p_out_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out", "role": "fifo_cap" }} , 
 	{ "name": "p_out1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out1", "role": "din" }} , 
 	{ "name": "p_out1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out1", "role": "full_n" }} , 
 	{ "name": "p_out1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out1", "role": "write" }} , 
 	{ "name": "p_out1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out1", "role": "num_data_valid" }} , 
 	{ "name": "p_out1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out1", "role": "fifo_cap" }} , 
 	{ "name": "p_out2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out2", "role": "din" }} , 
 	{ "name": "p_out2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out2", "role": "full_n" }} , 
 	{ "name": "p_out2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out2", "role": "write" }} , 
 	{ "name": "p_out2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out2", "role": "num_data_valid" }} , 
 	{ "name": "p_out2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out2", "role": "fifo_cap" }} , 
 	{ "name": "p_out3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out3", "role": "din" }} , 
 	{ "name": "p_out3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out3", "role": "full_n" }} , 
 	{ "name": "p_out3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out3", "role": "write" }} , 
 	{ "name": "p_out3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out3", "role": "num_data_valid" }} , 
 	{ "name": "p_out3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out3", "role": "fifo_cap" }} , 
 	{ "name": "p_out4_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out4", "role": "din" }} , 
 	{ "name": "p_out4_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out4", "role": "full_n" }} , 
 	{ "name": "p_out4_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out4", "role": "write" }} , 
 	{ "name": "p_out4_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out4", "role": "num_data_valid" }} , 
 	{ "name": "p_out4_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out4", "role": "fifo_cap" }} , 
 	{ "name": "p_out5_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out5", "role": "din" }} , 
 	{ "name": "p_out5_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out5", "role": "full_n" }} , 
 	{ "name": "p_out5_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out5", "role": "write" }} , 
 	{ "name": "p_out5_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out5", "role": "num_data_valid" }} , 
 	{ "name": "p_out5_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out5", "role": "fifo_cap" }} , 
 	{ "name": "p_out6_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out6", "role": "din" }} , 
 	{ "name": "p_out6_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out6", "role": "full_n" }} , 
 	{ "name": "p_out6_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out6", "role": "write" }} , 
 	{ "name": "p_out6_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out6", "role": "num_data_valid" }} , 
 	{ "name": "p_out6_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out6", "role": "fifo_cap" }} , 
 	{ "name": "p_out7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out7", "role": "din" }} , 
 	{ "name": "p_out7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out7", "role": "full_n" }} , 
 	{ "name": "p_out7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out7", "role": "write" }} , 
 	{ "name": "p_out7_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out7", "role": "num_data_valid" }} , 
 	{ "name": "p_out7_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out7", "role": "fifo_cap" }} , 
 	{ "name": "p_out8_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out8", "role": "din" }} , 
 	{ "name": "p_out8_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out8", "role": "full_n" }} , 
 	{ "name": "p_out8_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out8", "role": "write" }} , 
 	{ "name": "p_out8_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out8", "role": "num_data_valid" }} , 
 	{ "name": "p_out8_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out8", "role": "fifo_cap" }} , 
 	{ "name": "p_out9_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out9", "role": "din" }} , 
 	{ "name": "p_out9_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out9", "role": "full_n" }} , 
 	{ "name": "p_out9_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out9", "role": "write" }} , 
 	{ "name": "p_out9_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out9", "role": "num_data_valid" }} , 
 	{ "name": "p_out9_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out9", "role": "fifo_cap" }} , 
 	{ "name": "p_out10_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out10", "role": "din" }} , 
 	{ "name": "p_out10_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out10", "role": "full_n" }} , 
 	{ "name": "p_out10_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out10", "role": "write" }} , 
 	{ "name": "p_out10_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out10", "role": "num_data_valid" }} , 
 	{ "name": "p_out10_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out10", "role": "fifo_cap" }} , 
 	{ "name": "p_out11_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out11", "role": "din" }} , 
 	{ "name": "p_out11_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out11", "role": "full_n" }} , 
 	{ "name": "p_out11_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out11", "role": "write" }} , 
 	{ "name": "p_out11_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out11", "role": "num_data_valid" }} , 
 	{ "name": "p_out11_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out11", "role": "fifo_cap" }} , 
 	{ "name": "p_out12_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out12", "role": "din" }} , 
 	{ "name": "p_out12_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out12", "role": "full_n" }} , 
 	{ "name": "p_out12_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out12", "role": "write" }} , 
 	{ "name": "p_out12_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out12", "role": "num_data_valid" }} , 
 	{ "name": "p_out12_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out12", "role": "fifo_cap" }} , 
 	{ "name": "p_out13_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out13", "role": "din" }} , 
 	{ "name": "p_out13_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out13", "role": "full_n" }} , 
 	{ "name": "p_out13_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out13", "role": "write" }} , 
 	{ "name": "p_out13_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out13", "role": "num_data_valid" }} , 
 	{ "name": "p_out13_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out13", "role": "fifo_cap" }} , 
 	{ "name": "p_out14_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out14", "role": "din" }} , 
 	{ "name": "p_out14_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out14", "role": "full_n" }} , 
 	{ "name": "p_out14_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out14", "role": "write" }} , 
 	{ "name": "p_out14_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out14", "role": "num_data_valid" }} , 
 	{ "name": "p_out14_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out14", "role": "fifo_cap" }} , 
 	{ "name": "p_out15_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out15", "role": "din" }} , 
 	{ "name": "p_out15_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out15", "role": "full_n" }} , 
 	{ "name": "p_out15_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out15", "role": "write" }} , 
 	{ "name": "p_out15_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out15", "role": "num_data_valid" }} , 
 	{ "name": "p_out15_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out15", "role": "fifo_cap" }} , 
 	{ "name": "p_out16_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out16", "role": "din" }} , 
 	{ "name": "p_out16_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out16", "role": "full_n" }} , 
 	{ "name": "p_out16_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out16", "role": "write" }} , 
 	{ "name": "p_out16_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out16", "role": "num_data_valid" }} , 
 	{ "name": "p_out16_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out16", "role": "fifo_cap" }} , 
 	{ "name": "p_out17_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out17", "role": "din" }} , 
 	{ "name": "p_out17_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out17", "role": "full_n" }} , 
 	{ "name": "p_out17_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out17", "role": "write" }} , 
 	{ "name": "p_out17_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out17", "role": "num_data_valid" }} , 
 	{ "name": "p_out17_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out17", "role": "fifo_cap" }} , 
 	{ "name": "p_out18_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out18", "role": "din" }} , 
 	{ "name": "p_out18_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out18", "role": "full_n" }} , 
 	{ "name": "p_out18_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out18", "role": "write" }} , 
 	{ "name": "p_out18_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out18", "role": "num_data_valid" }} , 
 	{ "name": "p_out18_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out18", "role": "fifo_cap" }} , 
 	{ "name": "p_out19_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out19", "role": "din" }} , 
 	{ "name": "p_out19_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out19", "role": "full_n" }} , 
 	{ "name": "p_out19_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out19", "role": "write" }} , 
 	{ "name": "p_out19_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out19", "role": "num_data_valid" }} , 
 	{ "name": "p_out19_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out19", "role": "fifo_cap" }} , 
 	{ "name": "p_out20_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out20", "role": "din" }} , 
 	{ "name": "p_out20_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out20", "role": "full_n" }} , 
 	{ "name": "p_out20_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out20", "role": "write" }} , 
 	{ "name": "p_out20_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out20", "role": "num_data_valid" }} , 
 	{ "name": "p_out20_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out20", "role": "fifo_cap" }} , 
 	{ "name": "p_out21_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out21", "role": "din" }} , 
 	{ "name": "p_out21_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out21", "role": "full_n" }} , 
 	{ "name": "p_out21_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out21", "role": "write" }} , 
 	{ "name": "p_out21_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out21", "role": "num_data_valid" }} , 
 	{ "name": "p_out21_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out21", "role": "fifo_cap" }} , 
 	{ "name": "p_out22_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out22", "role": "din" }} , 
 	{ "name": "p_out22_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out22", "role": "full_n" }} , 
 	{ "name": "p_out22_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out22", "role": "write" }} , 
 	{ "name": "p_out22_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out22", "role": "num_data_valid" }} , 
 	{ "name": "p_out22_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out22", "role": "fifo_cap" }} , 
 	{ "name": "p_out23_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out23", "role": "din" }} , 
 	{ "name": "p_out23_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out23", "role": "full_n" }} , 
 	{ "name": "p_out23_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out23", "role": "write" }} , 
 	{ "name": "p_out23_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out23", "role": "num_data_valid" }} , 
 	{ "name": "p_out23_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out23", "role": "fifo_cap" }} , 
 	{ "name": "p_out24_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out24", "role": "din" }} , 
 	{ "name": "p_out24_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out24", "role": "full_n" }} , 
 	{ "name": "p_out24_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out24", "role": "write" }} , 
 	{ "name": "p_out24_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out24", "role": "num_data_valid" }} , 
 	{ "name": "p_out24_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out24", "role": "fifo_cap" }} , 
 	{ "name": "p_out25_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out25", "role": "din" }} , 
 	{ "name": "p_out25_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out25", "role": "full_n" }} , 
 	{ "name": "p_out25_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out25", "role": "write" }} , 
 	{ "name": "p_out25_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out25", "role": "num_data_valid" }} , 
 	{ "name": "p_out25_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_out25", "role": "fifo_cap" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ocnn6_streaming_layer_pipeline_Block_entry_proc_32",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "layer_weights", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out8", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out8_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out9", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out9_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out10", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out10_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out11", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out11_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out12", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out12_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out13", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out13_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out14", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out14_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out15", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out15_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out17", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out17_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out19_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out20_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out21", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out21_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out22", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out22_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out23", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out23_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out24", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out24_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_out25", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "p_out25_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	ocnn6_streaming_layer_pipeline_Block_entry_proc_32 {
		layer_weights {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 0}
		p_out1 {Type O LastRead -1 FirstWrite 0}
		p_out2 {Type O LastRead -1 FirstWrite 0}
		p_out3 {Type O LastRead -1 FirstWrite 0}
		p_out4 {Type O LastRead -1 FirstWrite 0}
		p_out5 {Type O LastRead -1 FirstWrite 0}
		p_out6 {Type O LastRead -1 FirstWrite 0}
		p_out7 {Type O LastRead -1 FirstWrite 0}
		p_out8 {Type O LastRead -1 FirstWrite 0}
		p_out9 {Type O LastRead -1 FirstWrite 0}
		p_out10 {Type O LastRead -1 FirstWrite 0}
		p_out11 {Type O LastRead -1 FirstWrite 0}
		p_out12 {Type O LastRead -1 FirstWrite 0}
		p_out13 {Type O LastRead -1 FirstWrite 0}
		p_out14 {Type O LastRead -1 FirstWrite 0}
		p_out15 {Type O LastRead -1 FirstWrite 0}
		p_out16 {Type O LastRead -1 FirstWrite 0}
		p_out17 {Type O LastRead -1 FirstWrite 0}
		p_out18 {Type O LastRead -1 FirstWrite 0}
		p_out19 {Type O LastRead -1 FirstWrite 0}
		p_out20 {Type O LastRead -1 FirstWrite 0}
		p_out21 {Type O LastRead -1 FirstWrite 0}
		p_out22 {Type O LastRead -1 FirstWrite 0}
		p_out23 {Type O LastRead -1 FirstWrite 0}
		p_out24 {Type O LastRead -1 FirstWrite 0}
		p_out25 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	layer_weights { ap_none {  { layer_weights in_data 0 64 } } }
	p_out { ap_fifo {  { p_out_din fifo_data_in 1 64 }  { p_out_full_n fifo_status 0 1 }  { p_out_write fifo_port_we 1 1 }  { p_out_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out_fifo_cap fifo_update 0 11 } } }
	p_out1 { ap_fifo {  { p_out1_din fifo_data_in 1 64 }  { p_out1_full_n fifo_status 0 1 }  { p_out1_write fifo_port_we 1 1 }  { p_out1_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out1_fifo_cap fifo_update 0 11 } } }
	p_out2 { ap_fifo {  { p_out2_din fifo_data_in 1 64 }  { p_out2_full_n fifo_status 0 1 }  { p_out2_write fifo_port_we 1 1 }  { p_out2_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out2_fifo_cap fifo_update 0 11 } } }
	p_out3 { ap_fifo {  { p_out3_din fifo_data_in 1 64 }  { p_out3_full_n fifo_status 0 1 }  { p_out3_write fifo_port_we 1 1 }  { p_out3_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out3_fifo_cap fifo_update 0 11 } } }
	p_out4 { ap_fifo {  { p_out4_din fifo_data_in 1 64 }  { p_out4_full_n fifo_status 0 1 }  { p_out4_write fifo_port_we 1 1 }  { p_out4_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out4_fifo_cap fifo_update 0 11 } } }
	p_out5 { ap_fifo {  { p_out5_din fifo_data_in 1 64 }  { p_out5_full_n fifo_status 0 1 }  { p_out5_write fifo_port_we 1 1 }  { p_out5_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out5_fifo_cap fifo_update 0 11 } } }
	p_out6 { ap_fifo {  { p_out6_din fifo_data_in 1 64 }  { p_out6_full_n fifo_status 0 1 }  { p_out6_write fifo_port_we 1 1 }  { p_out6_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out6_fifo_cap fifo_update 0 11 } } }
	p_out7 { ap_fifo {  { p_out7_din fifo_data_in 1 64 }  { p_out7_full_n fifo_status 0 1 }  { p_out7_write fifo_port_we 1 1 }  { p_out7_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out7_fifo_cap fifo_update 0 11 } } }
	p_out8 { ap_fifo {  { p_out8_din fifo_data_in 1 64 }  { p_out8_full_n fifo_status 0 1 }  { p_out8_write fifo_port_we 1 1 }  { p_out8_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out8_fifo_cap fifo_update 0 11 } } }
	p_out9 { ap_fifo {  { p_out9_din fifo_data_in 1 64 }  { p_out9_full_n fifo_status 0 1 }  { p_out9_write fifo_port_we 1 1 }  { p_out9_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out9_fifo_cap fifo_update 0 11 } } }
	p_out10 { ap_fifo {  { p_out10_din fifo_data_in 1 64 }  { p_out10_full_n fifo_status 0 1 }  { p_out10_write fifo_port_we 1 1 }  { p_out10_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out10_fifo_cap fifo_update 0 11 } } }
	p_out11 { ap_fifo {  { p_out11_din fifo_data_in 1 64 }  { p_out11_full_n fifo_status 0 1 }  { p_out11_write fifo_port_we 1 1 }  { p_out11_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out11_fifo_cap fifo_update 0 11 } } }
	p_out12 { ap_fifo {  { p_out12_din fifo_data_in 1 64 }  { p_out12_full_n fifo_status 0 1 }  { p_out12_write fifo_port_we 1 1 }  { p_out12_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out12_fifo_cap fifo_update 0 11 } } }
	p_out13 { ap_fifo {  { p_out13_din fifo_data_in 1 64 }  { p_out13_full_n fifo_status 0 1 }  { p_out13_write fifo_port_we 1 1 }  { p_out13_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out13_fifo_cap fifo_update 0 11 } } }
	p_out14 { ap_fifo {  { p_out14_din fifo_data_in 1 64 }  { p_out14_full_n fifo_status 0 1 }  { p_out14_write fifo_port_we 1 1 }  { p_out14_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out14_fifo_cap fifo_update 0 11 } } }
	p_out15 { ap_fifo {  { p_out15_din fifo_data_in 1 64 }  { p_out15_full_n fifo_status 0 1 }  { p_out15_write fifo_port_we 1 1 }  { p_out15_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out15_fifo_cap fifo_update 0 11 } } }
	p_out16 { ap_fifo {  { p_out16_din fifo_data_in 1 64 }  { p_out16_full_n fifo_status 0 1 }  { p_out16_write fifo_port_we 1 1 }  { p_out16_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out16_fifo_cap fifo_update 0 11 } } }
	p_out17 { ap_fifo {  { p_out17_din fifo_data_in 1 64 }  { p_out17_full_n fifo_status 0 1 }  { p_out17_write fifo_port_we 1 1 }  { p_out17_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out17_fifo_cap fifo_update 0 11 } } }
	p_out18 { ap_fifo {  { p_out18_din fifo_data_in 1 64 }  { p_out18_full_n fifo_status 0 1 }  { p_out18_write fifo_port_we 1 1 }  { p_out18_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out18_fifo_cap fifo_update 0 11 } } }
	p_out19 { ap_fifo {  { p_out19_din fifo_data_in 1 64 }  { p_out19_full_n fifo_status 0 1 }  { p_out19_write fifo_port_we 1 1 }  { p_out19_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out19_fifo_cap fifo_update 0 11 } } }
	p_out20 { ap_fifo {  { p_out20_din fifo_data_in 1 64 }  { p_out20_full_n fifo_status 0 1 }  { p_out20_write fifo_port_we 1 1 }  { p_out20_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out20_fifo_cap fifo_update 0 11 } } }
	p_out21 { ap_fifo {  { p_out21_din fifo_data_in 1 64 }  { p_out21_full_n fifo_status 0 1 }  { p_out21_write fifo_port_we 1 1 }  { p_out21_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out21_fifo_cap fifo_update 0 11 } } }
	p_out22 { ap_fifo {  { p_out22_din fifo_data_in 1 64 }  { p_out22_full_n fifo_status 0 1 }  { p_out22_write fifo_port_we 1 1 }  { p_out22_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out22_fifo_cap fifo_update 0 11 } } }
	p_out23 { ap_fifo {  { p_out23_din fifo_data_in 1 64 }  { p_out23_full_n fifo_status 0 1 }  { p_out23_write fifo_port_we 1 1 }  { p_out23_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out23_fifo_cap fifo_update 0 11 } } }
	p_out24 { ap_fifo {  { p_out24_din fifo_data_in 1 64 }  { p_out24_full_n fifo_status 0 1 }  { p_out24_write fifo_port_we 1 1 }  { p_out24_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out24_fifo_cap fifo_update 0 11 } } }
	p_out25 { ap_fifo {  { p_out25_din fifo_data_in 1 64 }  { p_out25_full_n fifo_status 0 1 }  { p_out25_write fifo_port_we 1 1 }  { p_out25_num_data_valid fifo_status_num_data_valid 0 11 }  { p_out25_fifo_cap fifo_update 0 11 } } }
}
