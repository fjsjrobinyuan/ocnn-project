# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 49 \
    name neighbor_features \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename neighbor_features \
    op interface \
    ports { neighbor_features_address0 { O 10 vector } neighbor_features_ce0 { O 1 bit } neighbor_features_we0 { O 1 bit } neighbor_features_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'neighbor_features'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
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
    id 47 \
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
    id 48 \
    name p_cast_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_cast_cast \
    op interface \
    ports { p_cast_cast { I 62 vector } } \
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


