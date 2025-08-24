# This script segment is generated automatically by AutoPilot

set name minkowski_net_14_layer_pipeline_fadd_32ns_32ns_32_4_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 3 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_fmul_32ns_32ns_32_3_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 2 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_fcmp_32ns_32ns_1_2_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fcmp} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_mul_11ns_42s_42_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_urem_60s_32ns_42_64_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto_seq} LATENCY 63 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_urem_59s_32ns_42_63_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto_seq} LATENCY 62 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_urem_58s_32ns_42_62_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto_seq} LATENCY 61 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_urem_4ns_32ns_13_8_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto_seq} LATENCY 7 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_urem_3ns_32ns_12_7_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto_seq} LATENCY 6 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_urem_1ns_32ns_1_5_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto_seq} LATENCY 4 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_mul_11ns_13s_13_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_mul_11ns_12s_12_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name minkowski_net_14_layer_pipeline_mul_11ns_11ns_22_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_layer_convolution_with_persistent_accelerator_output_features_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler minkowski_net_14_layer_pipeline_layer_convolution_with_persistent_accelerator_neighbor_features_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name config_input_channels_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_config_input_channels_val \
    op interface \
    ports { config_input_channels_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name config_output_channels_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_config_output_channels_val \
    op interface \
    ports { config_output_channels_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name config_output_spatial_dim_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_config_output_spatial_dim_val \
    op interface \
    ports { config_output_spatial_dim_val { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name bitmap_info_0_4_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bitmap_info_0_4_0_0_0_val \
    op interface \
    ports { bitmap_info_0_4_0_0_0_val { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name gmem_write \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_write \
    op interface \
    ports { m_axi_gmem_write_0_AWVALID { O 1 bit } m_axi_gmem_write_0_AWREADY { I 1 bit } m_axi_gmem_write_0_AWADDR { O 64 vector } m_axi_gmem_write_0_AWID { O 1 vector } m_axi_gmem_write_0_AWLEN { O 32 vector } m_axi_gmem_write_0_AWSIZE { O 3 vector } m_axi_gmem_write_0_AWBURST { O 2 vector } m_axi_gmem_write_0_AWLOCK { O 2 vector } m_axi_gmem_write_0_AWCACHE { O 4 vector } m_axi_gmem_write_0_AWPROT { O 3 vector } m_axi_gmem_write_0_AWQOS { O 4 vector } m_axi_gmem_write_0_AWREGION { O 4 vector } m_axi_gmem_write_0_AWUSER { O 1 vector } m_axi_gmem_write_0_WVALID { O 1 bit } m_axi_gmem_write_0_WREADY { I 1 bit } m_axi_gmem_write_0_WDATA { O 32 vector } m_axi_gmem_write_0_WSTRB { O 4 vector } m_axi_gmem_write_0_WLAST { O 1 bit } m_axi_gmem_write_0_WID { O 1 vector } m_axi_gmem_write_0_WUSER { O 1 vector } m_axi_gmem_write_0_ARVALID { O 1 bit } m_axi_gmem_write_0_ARREADY { I 1 bit } m_axi_gmem_write_0_ARADDR { O 64 vector } m_axi_gmem_write_0_ARID { O 1 vector } m_axi_gmem_write_0_ARLEN { O 32 vector } m_axi_gmem_write_0_ARSIZE { O 3 vector } m_axi_gmem_write_0_ARBURST { O 2 vector } m_axi_gmem_write_0_ARLOCK { O 2 vector } m_axi_gmem_write_0_ARCACHE { O 4 vector } m_axi_gmem_write_0_ARPROT { O 3 vector } m_axi_gmem_write_0_ARQOS { O 4 vector } m_axi_gmem_write_0_ARREGION { O 4 vector } m_axi_gmem_write_0_ARUSER { O 1 vector } m_axi_gmem_write_0_RVALID { I 1 bit } m_axi_gmem_write_0_RREADY { O 1 bit } m_axi_gmem_write_0_RDATA { I 32 vector } m_axi_gmem_write_0_RLAST { I 1 bit } m_axi_gmem_write_0_RID { I 1 vector } m_axi_gmem_write_0_RFIFONUM { I 13 vector } m_axi_gmem_write_0_RUSER { I 1 vector } m_axi_gmem_write_0_RRESP { I 2 vector } m_axi_gmem_write_0_BVALID { I 1 bit } m_axi_gmem_write_0_BREADY { O 1 bit } m_axi_gmem_write_0_BRESP { I 2 vector } m_axi_gmem_write_0_BID { I 1 vector } m_axi_gmem_write_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name pruned_dram_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pruned_dram_read \
    op interface \
    ports { pruned_dram_read { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name gmem_read \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_read \
    op interface \
    ports { m_axi_gmem_read_0_AWVALID { O 1 bit } m_axi_gmem_read_0_AWREADY { I 1 bit } m_axi_gmem_read_0_AWADDR { O 64 vector } m_axi_gmem_read_0_AWID { O 1 vector } m_axi_gmem_read_0_AWLEN { O 32 vector } m_axi_gmem_read_0_AWSIZE { O 3 vector } m_axi_gmem_read_0_AWBURST { O 2 vector } m_axi_gmem_read_0_AWLOCK { O 2 vector } m_axi_gmem_read_0_AWCACHE { O 4 vector } m_axi_gmem_read_0_AWPROT { O 3 vector } m_axi_gmem_read_0_AWQOS { O 4 vector } m_axi_gmem_read_0_AWREGION { O 4 vector } m_axi_gmem_read_0_AWUSER { O 1 vector } m_axi_gmem_read_0_WVALID { O 1 bit } m_axi_gmem_read_0_WREADY { I 1 bit } m_axi_gmem_read_0_WDATA { O 32 vector } m_axi_gmem_read_0_WSTRB { O 4 vector } m_axi_gmem_read_0_WLAST { O 1 bit } m_axi_gmem_read_0_WID { O 1 vector } m_axi_gmem_read_0_WUSER { O 1 vector } m_axi_gmem_read_0_ARVALID { O 1 bit } m_axi_gmem_read_0_ARREADY { I 1 bit } m_axi_gmem_read_0_ARADDR { O 64 vector } m_axi_gmem_read_0_ARID { O 1 vector } m_axi_gmem_read_0_ARLEN { O 32 vector } m_axi_gmem_read_0_ARSIZE { O 3 vector } m_axi_gmem_read_0_ARBURST { O 2 vector } m_axi_gmem_read_0_ARLOCK { O 2 vector } m_axi_gmem_read_0_ARCACHE { O 4 vector } m_axi_gmem_read_0_ARPROT { O 3 vector } m_axi_gmem_read_0_ARQOS { O 4 vector } m_axi_gmem_read_0_ARREGION { O 4 vector } m_axi_gmem_read_0_ARUSER { O 1 vector } m_axi_gmem_read_0_RVALID { I 1 bit } m_axi_gmem_read_0_RREADY { O 1 bit } m_axi_gmem_read_0_RDATA { I 32 vector } m_axi_gmem_read_0_RLAST { I 1 bit } m_axi_gmem_read_0_RID { I 1 vector } m_axi_gmem_read_0_RFIFONUM { I 13 vector } m_axi_gmem_read_0_RUSER { I 1 vector } m_axi_gmem_read_0_RRESP { I 2 vector } m_axi_gmem_read_0_BVALID { I 1 bit } m_axi_gmem_read_0_BREADY { O 1 bit } m_axi_gmem_read_0_BRESP { I 2 vector } m_axi_gmem_read_0_BID { I 1 vector } m_axi_gmem_read_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name pruned_dram_write \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pruned_dram_write \
    op interface \
    ports { pruned_dram_write { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name num_pruned_voxels \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_num_pruned_voxels \
    op interface \
    ports { num_pruned_voxels { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
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
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
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


