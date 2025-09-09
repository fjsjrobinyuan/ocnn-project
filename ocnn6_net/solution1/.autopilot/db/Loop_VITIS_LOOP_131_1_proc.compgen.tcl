# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name pruned_feature_dram_read \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pruned_feature_dram_read \
    op interface \
    ports { pruned_feature_dram_read_dout { I 64 vector } pruned_feature_dram_read_empty_n { I 1 bit } pruned_feature_dram_read_read { O 1 bit } pruned_feature_dram_read_num_data_valid { I 11 vector } pruned_feature_dram_read_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name feature_data_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_feature_data_stream \
    op interface \
    ports { feature_data_stream_dout { I 1085 vector } feature_data_stream_empty_n { I 1 bit } feature_data_stream_read { O 1 bit } feature_data_stream_num_data_valid { I 11 vector } feature_data_stream_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name write_addr_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_write_addr_stream \
    op interface \
    ports { write_addr_stream_dout { I 60 vector } write_addr_stream_empty_n { I 1 bit } write_addr_stream_read { O 1 bit } write_addr_stream_num_data_valid { I 11 vector } write_addr_stream_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
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
    id 74 \
    name pruned_voxel_count_0_out \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pruned_voxel_count_0_out \
    op interface \
    ports { pruned_voxel_count_0_out_din { O 32 vector } pruned_voxel_count_0_out_full_n { I 1 bit } pruned_voxel_count_0_out_write { O 1 bit } pruned_voxel_count_0_out_num_data_valid { I 11 vector } pruned_voxel_count_0_out_fifo_cap { I 11 vector } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
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


