# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x6 BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {final_output_full_cubic_c_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w64_d1024_A_x6 BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {pruned_feature_dram_read_c_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A_x0 BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {feature_data_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w60_d1024_A BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {write_addr_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {pruned_voxel_count_0_loc_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {wide_trip_count_loc_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w34_d1024_A BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {p_loc_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {pruned_voxel_count_0_reload_loc_c1_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w9_d1024_A BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {current_morton_list_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w32_d1024_A BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {pruned_voxel_count_0_reload_loc_c_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A_x0 BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {layer_pipeline_streams_8_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_start_for_Loop_VITIS_LOOP_131_1_proc_U0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {start_for_Loop_VITIS_LOOP_131_1_proc_U0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_start_for_ocnn6_final_layer_output_reconstruction_streaming_U0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {start_for_ocnn6_final_layer_output_reconstruction_streaming_U0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_start_for_Block_entry_proc_24_U0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {start_for_Block_entry_proc_24_U0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_start_for_Loop_VITIS_LOOP_209_5_proc_U0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {start_for_Loop_VITIS_LOOP_209_5_proc_U0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_output_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_weights1_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_weights2_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_weights3_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_weights4_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_weights5_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_weights6_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_weights7_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_weights8_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_bias1_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_bias2_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_bias3_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_bias4_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_bias5_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_bias6_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_bias7_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_bias8_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_gmem_read_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
final_output_full_cubic { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
conv1_weights { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
conv2_weights { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
conv3_weights { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 52
	offset_end 63
}
conv4_weights { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 64
	offset_end 75
}
conv5_weights { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 76
	offset_end 87
}
conv6_weights { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 88
	offset_end 99
}
fc1_weights { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 100
	offset_end 111
}
fc2_weights { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 112
	offset_end 123
}
conv1_bias { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 124
	offset_end 135
}
conv2_bias { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 136
	offset_end 147
}
conv3_bias { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 148
	offset_end 159
}
conv4_bias { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 160
	offset_end 171
}
conv5_bias { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 172
	offset_end 183
}
conv6_bias { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 184
	offset_end 195
}
fc1_bias { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 196
	offset_end 207
}
fc2_bias { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 208
	offset_end 219
}
pruned_feature_dram_read { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 220
	offset_end 231
}
pruned_feature_dram_write { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 232
	offset_end 243
}
bitmap_info { 
	dir O
	width 160
	depth 1
	mode ap_vld
	offset 244
	offset_end 267
}
total_processed_voxels { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 292
	offset_end 299
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 4800 \
			corename ocnn6_net_8_layer_pipeline_control_axilite \
			name ocnn6_net_8_layer_pipeline_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4801 \
    name input_voxel_stream \
    type fifo \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_input_voxel_stream \
    op interface \
    ports { input_voxel_stream_dout { I 1085 vector } input_voxel_stream_empty_n { I 1 bit } input_voxel_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4802 \
    name L3_bitmap \
    type other \
    dir IO \
    reset_level 0 \
    sync_rst true \
    corename dc_L3_bitmap \
    op interface \
    ports { L3_bitmap_i { I 512 vector } L3_bitmap_o { O 512 vector } L3_bitmap_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4803 \
    name L2_bitmap \
    type other \
    dir IO \
    reset_level 0 \
    sync_rst true \
    corename dc_L2_bitmap \
    op interface \
    ports { L2_bitmap_i { I 512 vector } L2_bitmap_o { O 512 vector } L2_bitmap_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4804 \
    name L1_bitmap \
    type other \
    dir IO \
    reset_level 0 \
    sync_rst true \
    corename dc_L1_bitmap \
    op interface \
    ports { L1_bitmap_i { I 512 vector } L1_bitmap_o { O 512 vector } L1_bitmap_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4805 \
    name L0_bitmap \
    type other \
    dir IO \
    reset_level 0 \
    sync_rst true \
    corename dc_L0_bitmap \
    op interface \
    ports { L0_bitmap_i { I 512 vector } L0_bitmap_o { O 512 vector } L0_bitmap_o_ap_vld { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


