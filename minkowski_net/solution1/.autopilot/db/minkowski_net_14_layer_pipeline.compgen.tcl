# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_MINKOWSKI_LAYERS_input_channels_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_MINKOWSKI_LAYERS_output_channels_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_MINKOWSKI_LAYERS_output_spatial_dim_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_fifo_w1085_d1024_A BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {feature_data_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_fifo_w60_d1024_A BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {write_addr_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_gmem_output_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_gmem_read_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_gmem_write_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
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
pruned_feature_dram_read { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
pruned_feature_dram_write { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
bitmap_info { 
	dir O
	width 160
	depth 1
	mode ap_vld
	offset 52
	offset_end 75
}
total_processed_voxels { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 100
	offset_end 107
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
			id 139 \
			corename minkowski_net_14_layer_pipeline_control_axilite \
			name minkowski_net_14_layer_pipeline_control_s_axi \
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
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
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
    id 141 \
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
    id 142 \
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
    id 143 \
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
    id 144 \
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


