# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_fifo_w1085_d1024_A_x BINDTYPE {storage} TYPE {fifo} IMPL {memory} ALLOW_PRAGMA 1 INSTNAME {initial_stream_i_U}
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
    id 4743 \
    name pruned_feature_dram_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pruned_feature_dram_read \
    op interface \
    ports { pruned_feature_dram_read { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4744 \
    name gmem_read \
    type other \
    dir I \
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
    id 4745 \
    name p_loc \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_loc \
    op interface \
    ports { p_loc_dout { I 34 vector } p_loc_empty_n { I 1 bit } p_loc_read { O 1 bit } p_loc_num_data_valid { I 11 vector } p_loc_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4746 \
    name wide_trip_count_loc \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_wide_trip_count_loc \
    op interface \
    ports { wide_trip_count_loc_dout { I 32 vector } wide_trip_count_loc_empty_n { I 1 bit } wide_trip_count_loc_read { O 1 bit } wide_trip_count_loc_num_data_valid { I 11 vector } wide_trip_count_loc_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4747 \
    name pruned_voxel_count_0_reload_loc \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pruned_voxel_count_0_reload_loc \
    op interface \
    ports { pruned_voxel_count_0_reload_loc_dout { I 32 vector } pruned_voxel_count_0_reload_loc_empty_n { I 1 bit } pruned_voxel_count_0_reload_loc_read { O 1 bit } pruned_voxel_count_0_reload_loc_num_data_valid { I 11 vector } pruned_voxel_count_0_reload_loc_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4748 \
    name current_morton_list \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_morton_list \
    op interface \
    ports { current_morton_list_dout { I 9 vector } current_morton_list_empty_n { I 1 bit } current_morton_list_read { O 1 bit } current_morton_list_num_data_valid { I 11 vector } current_morton_list_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4749 \
    name layer_pipeline_streams_8 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_layer_pipeline_streams_8 \
    op interface \
    ports { layer_pipeline_streams_8_din { O 1085 vector } layer_pipeline_streams_8_full_n { I 1 bit } layer_pipeline_streams_8_write { O 1 bit } layer_pipeline_streams_8_num_data_valid { I 11 vector } layer_pipeline_streams_8_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4750 \
    name gmem_weights1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_weights1 \
    op interface \
    ports { m_axi_gmem_weights1_0_AWVALID { O 1 bit } m_axi_gmem_weights1_0_AWREADY { I 1 bit } m_axi_gmem_weights1_0_AWADDR { O 64 vector } m_axi_gmem_weights1_0_AWID { O 1 vector } m_axi_gmem_weights1_0_AWLEN { O 32 vector } m_axi_gmem_weights1_0_AWSIZE { O 3 vector } m_axi_gmem_weights1_0_AWBURST { O 2 vector } m_axi_gmem_weights1_0_AWLOCK { O 2 vector } m_axi_gmem_weights1_0_AWCACHE { O 4 vector } m_axi_gmem_weights1_0_AWPROT { O 3 vector } m_axi_gmem_weights1_0_AWQOS { O 4 vector } m_axi_gmem_weights1_0_AWREGION { O 4 vector } m_axi_gmem_weights1_0_AWUSER { O 1 vector } m_axi_gmem_weights1_0_WVALID { O 1 bit } m_axi_gmem_weights1_0_WREADY { I 1 bit } m_axi_gmem_weights1_0_WDATA { O 32 vector } m_axi_gmem_weights1_0_WSTRB { O 4 vector } m_axi_gmem_weights1_0_WLAST { O 1 bit } m_axi_gmem_weights1_0_WID { O 1 vector } m_axi_gmem_weights1_0_WUSER { O 1 vector } m_axi_gmem_weights1_0_ARVALID { O 1 bit } m_axi_gmem_weights1_0_ARREADY { I 1 bit } m_axi_gmem_weights1_0_ARADDR { O 64 vector } m_axi_gmem_weights1_0_ARID { O 1 vector } m_axi_gmem_weights1_0_ARLEN { O 32 vector } m_axi_gmem_weights1_0_ARSIZE { O 3 vector } m_axi_gmem_weights1_0_ARBURST { O 2 vector } m_axi_gmem_weights1_0_ARLOCK { O 2 vector } m_axi_gmem_weights1_0_ARCACHE { O 4 vector } m_axi_gmem_weights1_0_ARPROT { O 3 vector } m_axi_gmem_weights1_0_ARQOS { O 4 vector } m_axi_gmem_weights1_0_ARREGION { O 4 vector } m_axi_gmem_weights1_0_ARUSER { O 1 vector } m_axi_gmem_weights1_0_RVALID { I 1 bit } m_axi_gmem_weights1_0_RREADY { O 1 bit } m_axi_gmem_weights1_0_RDATA { I 32 vector } m_axi_gmem_weights1_0_RLAST { I 1 bit } m_axi_gmem_weights1_0_RID { I 1 vector } m_axi_gmem_weights1_0_RFIFONUM { I 13 vector } m_axi_gmem_weights1_0_RUSER { I 1 vector } m_axi_gmem_weights1_0_RRESP { I 2 vector } m_axi_gmem_weights1_0_BVALID { I 1 bit } m_axi_gmem_weights1_0_BREADY { O 1 bit } m_axi_gmem_weights1_0_BRESP { I 2 vector } m_axi_gmem_weights1_0_BID { I 1 vector } m_axi_gmem_weights1_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4751 \
    name conv1_weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv1_weights \
    op interface \
    ports { conv1_weights { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4752 \
    name gmem_weights2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_weights2 \
    op interface \
    ports { m_axi_gmem_weights2_0_AWVALID { O 1 bit } m_axi_gmem_weights2_0_AWREADY { I 1 bit } m_axi_gmem_weights2_0_AWADDR { O 64 vector } m_axi_gmem_weights2_0_AWID { O 1 vector } m_axi_gmem_weights2_0_AWLEN { O 32 vector } m_axi_gmem_weights2_0_AWSIZE { O 3 vector } m_axi_gmem_weights2_0_AWBURST { O 2 vector } m_axi_gmem_weights2_0_AWLOCK { O 2 vector } m_axi_gmem_weights2_0_AWCACHE { O 4 vector } m_axi_gmem_weights2_0_AWPROT { O 3 vector } m_axi_gmem_weights2_0_AWQOS { O 4 vector } m_axi_gmem_weights2_0_AWREGION { O 4 vector } m_axi_gmem_weights2_0_AWUSER { O 1 vector } m_axi_gmem_weights2_0_WVALID { O 1 bit } m_axi_gmem_weights2_0_WREADY { I 1 bit } m_axi_gmem_weights2_0_WDATA { O 32 vector } m_axi_gmem_weights2_0_WSTRB { O 4 vector } m_axi_gmem_weights2_0_WLAST { O 1 bit } m_axi_gmem_weights2_0_WID { O 1 vector } m_axi_gmem_weights2_0_WUSER { O 1 vector } m_axi_gmem_weights2_0_ARVALID { O 1 bit } m_axi_gmem_weights2_0_ARREADY { I 1 bit } m_axi_gmem_weights2_0_ARADDR { O 64 vector } m_axi_gmem_weights2_0_ARID { O 1 vector } m_axi_gmem_weights2_0_ARLEN { O 32 vector } m_axi_gmem_weights2_0_ARSIZE { O 3 vector } m_axi_gmem_weights2_0_ARBURST { O 2 vector } m_axi_gmem_weights2_0_ARLOCK { O 2 vector } m_axi_gmem_weights2_0_ARCACHE { O 4 vector } m_axi_gmem_weights2_0_ARPROT { O 3 vector } m_axi_gmem_weights2_0_ARQOS { O 4 vector } m_axi_gmem_weights2_0_ARREGION { O 4 vector } m_axi_gmem_weights2_0_ARUSER { O 1 vector } m_axi_gmem_weights2_0_RVALID { I 1 bit } m_axi_gmem_weights2_0_RREADY { O 1 bit } m_axi_gmem_weights2_0_RDATA { I 32 vector } m_axi_gmem_weights2_0_RLAST { I 1 bit } m_axi_gmem_weights2_0_RID { I 1 vector } m_axi_gmem_weights2_0_RFIFONUM { I 13 vector } m_axi_gmem_weights2_0_RUSER { I 1 vector } m_axi_gmem_weights2_0_RRESP { I 2 vector } m_axi_gmem_weights2_0_BVALID { I 1 bit } m_axi_gmem_weights2_0_BREADY { O 1 bit } m_axi_gmem_weights2_0_BRESP { I 2 vector } m_axi_gmem_weights2_0_BID { I 1 vector } m_axi_gmem_weights2_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4753 \
    name conv2_weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv2_weights \
    op interface \
    ports { conv2_weights { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4754 \
    name gmem_weights3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_weights3 \
    op interface \
    ports { m_axi_gmem_weights3_0_AWVALID { O 1 bit } m_axi_gmem_weights3_0_AWREADY { I 1 bit } m_axi_gmem_weights3_0_AWADDR { O 64 vector } m_axi_gmem_weights3_0_AWID { O 1 vector } m_axi_gmem_weights3_0_AWLEN { O 32 vector } m_axi_gmem_weights3_0_AWSIZE { O 3 vector } m_axi_gmem_weights3_0_AWBURST { O 2 vector } m_axi_gmem_weights3_0_AWLOCK { O 2 vector } m_axi_gmem_weights3_0_AWCACHE { O 4 vector } m_axi_gmem_weights3_0_AWPROT { O 3 vector } m_axi_gmem_weights3_0_AWQOS { O 4 vector } m_axi_gmem_weights3_0_AWREGION { O 4 vector } m_axi_gmem_weights3_0_AWUSER { O 1 vector } m_axi_gmem_weights3_0_WVALID { O 1 bit } m_axi_gmem_weights3_0_WREADY { I 1 bit } m_axi_gmem_weights3_0_WDATA { O 32 vector } m_axi_gmem_weights3_0_WSTRB { O 4 vector } m_axi_gmem_weights3_0_WLAST { O 1 bit } m_axi_gmem_weights3_0_WID { O 1 vector } m_axi_gmem_weights3_0_WUSER { O 1 vector } m_axi_gmem_weights3_0_ARVALID { O 1 bit } m_axi_gmem_weights3_0_ARREADY { I 1 bit } m_axi_gmem_weights3_0_ARADDR { O 64 vector } m_axi_gmem_weights3_0_ARID { O 1 vector } m_axi_gmem_weights3_0_ARLEN { O 32 vector } m_axi_gmem_weights3_0_ARSIZE { O 3 vector } m_axi_gmem_weights3_0_ARBURST { O 2 vector } m_axi_gmem_weights3_0_ARLOCK { O 2 vector } m_axi_gmem_weights3_0_ARCACHE { O 4 vector } m_axi_gmem_weights3_0_ARPROT { O 3 vector } m_axi_gmem_weights3_0_ARQOS { O 4 vector } m_axi_gmem_weights3_0_ARREGION { O 4 vector } m_axi_gmem_weights3_0_ARUSER { O 1 vector } m_axi_gmem_weights3_0_RVALID { I 1 bit } m_axi_gmem_weights3_0_RREADY { O 1 bit } m_axi_gmem_weights3_0_RDATA { I 32 vector } m_axi_gmem_weights3_0_RLAST { I 1 bit } m_axi_gmem_weights3_0_RID { I 1 vector } m_axi_gmem_weights3_0_RFIFONUM { I 13 vector } m_axi_gmem_weights3_0_RUSER { I 1 vector } m_axi_gmem_weights3_0_RRESP { I 2 vector } m_axi_gmem_weights3_0_BVALID { I 1 bit } m_axi_gmem_weights3_0_BREADY { O 1 bit } m_axi_gmem_weights3_0_BRESP { I 2 vector } m_axi_gmem_weights3_0_BID { I 1 vector } m_axi_gmem_weights3_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4755 \
    name conv3_weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_weights \
    op interface \
    ports { conv3_weights { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4756 \
    name gmem_weights4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_weights4 \
    op interface \
    ports { m_axi_gmem_weights4_0_AWVALID { O 1 bit } m_axi_gmem_weights4_0_AWREADY { I 1 bit } m_axi_gmem_weights4_0_AWADDR { O 64 vector } m_axi_gmem_weights4_0_AWID { O 1 vector } m_axi_gmem_weights4_0_AWLEN { O 32 vector } m_axi_gmem_weights4_0_AWSIZE { O 3 vector } m_axi_gmem_weights4_0_AWBURST { O 2 vector } m_axi_gmem_weights4_0_AWLOCK { O 2 vector } m_axi_gmem_weights4_0_AWCACHE { O 4 vector } m_axi_gmem_weights4_0_AWPROT { O 3 vector } m_axi_gmem_weights4_0_AWQOS { O 4 vector } m_axi_gmem_weights4_0_AWREGION { O 4 vector } m_axi_gmem_weights4_0_AWUSER { O 1 vector } m_axi_gmem_weights4_0_WVALID { O 1 bit } m_axi_gmem_weights4_0_WREADY { I 1 bit } m_axi_gmem_weights4_0_WDATA { O 32 vector } m_axi_gmem_weights4_0_WSTRB { O 4 vector } m_axi_gmem_weights4_0_WLAST { O 1 bit } m_axi_gmem_weights4_0_WID { O 1 vector } m_axi_gmem_weights4_0_WUSER { O 1 vector } m_axi_gmem_weights4_0_ARVALID { O 1 bit } m_axi_gmem_weights4_0_ARREADY { I 1 bit } m_axi_gmem_weights4_0_ARADDR { O 64 vector } m_axi_gmem_weights4_0_ARID { O 1 vector } m_axi_gmem_weights4_0_ARLEN { O 32 vector } m_axi_gmem_weights4_0_ARSIZE { O 3 vector } m_axi_gmem_weights4_0_ARBURST { O 2 vector } m_axi_gmem_weights4_0_ARLOCK { O 2 vector } m_axi_gmem_weights4_0_ARCACHE { O 4 vector } m_axi_gmem_weights4_0_ARPROT { O 3 vector } m_axi_gmem_weights4_0_ARQOS { O 4 vector } m_axi_gmem_weights4_0_ARREGION { O 4 vector } m_axi_gmem_weights4_0_ARUSER { O 1 vector } m_axi_gmem_weights4_0_RVALID { I 1 bit } m_axi_gmem_weights4_0_RREADY { O 1 bit } m_axi_gmem_weights4_0_RDATA { I 32 vector } m_axi_gmem_weights4_0_RLAST { I 1 bit } m_axi_gmem_weights4_0_RID { I 1 vector } m_axi_gmem_weights4_0_RFIFONUM { I 13 vector } m_axi_gmem_weights4_0_RUSER { I 1 vector } m_axi_gmem_weights4_0_RRESP { I 2 vector } m_axi_gmem_weights4_0_BVALID { I 1 bit } m_axi_gmem_weights4_0_BREADY { O 1 bit } m_axi_gmem_weights4_0_BRESP { I 2 vector } m_axi_gmem_weights4_0_BID { I 1 vector } m_axi_gmem_weights4_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4757 \
    name conv4_weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv4_weights \
    op interface \
    ports { conv4_weights { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4758 \
    name gmem_weights5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_weights5 \
    op interface \
    ports { m_axi_gmem_weights5_0_AWVALID { O 1 bit } m_axi_gmem_weights5_0_AWREADY { I 1 bit } m_axi_gmem_weights5_0_AWADDR { O 64 vector } m_axi_gmem_weights5_0_AWID { O 1 vector } m_axi_gmem_weights5_0_AWLEN { O 32 vector } m_axi_gmem_weights5_0_AWSIZE { O 3 vector } m_axi_gmem_weights5_0_AWBURST { O 2 vector } m_axi_gmem_weights5_0_AWLOCK { O 2 vector } m_axi_gmem_weights5_0_AWCACHE { O 4 vector } m_axi_gmem_weights5_0_AWPROT { O 3 vector } m_axi_gmem_weights5_0_AWQOS { O 4 vector } m_axi_gmem_weights5_0_AWREGION { O 4 vector } m_axi_gmem_weights5_0_AWUSER { O 1 vector } m_axi_gmem_weights5_0_WVALID { O 1 bit } m_axi_gmem_weights5_0_WREADY { I 1 bit } m_axi_gmem_weights5_0_WDATA { O 32 vector } m_axi_gmem_weights5_0_WSTRB { O 4 vector } m_axi_gmem_weights5_0_WLAST { O 1 bit } m_axi_gmem_weights5_0_WID { O 1 vector } m_axi_gmem_weights5_0_WUSER { O 1 vector } m_axi_gmem_weights5_0_ARVALID { O 1 bit } m_axi_gmem_weights5_0_ARREADY { I 1 bit } m_axi_gmem_weights5_0_ARADDR { O 64 vector } m_axi_gmem_weights5_0_ARID { O 1 vector } m_axi_gmem_weights5_0_ARLEN { O 32 vector } m_axi_gmem_weights5_0_ARSIZE { O 3 vector } m_axi_gmem_weights5_0_ARBURST { O 2 vector } m_axi_gmem_weights5_0_ARLOCK { O 2 vector } m_axi_gmem_weights5_0_ARCACHE { O 4 vector } m_axi_gmem_weights5_0_ARPROT { O 3 vector } m_axi_gmem_weights5_0_ARQOS { O 4 vector } m_axi_gmem_weights5_0_ARREGION { O 4 vector } m_axi_gmem_weights5_0_ARUSER { O 1 vector } m_axi_gmem_weights5_0_RVALID { I 1 bit } m_axi_gmem_weights5_0_RREADY { O 1 bit } m_axi_gmem_weights5_0_RDATA { I 32 vector } m_axi_gmem_weights5_0_RLAST { I 1 bit } m_axi_gmem_weights5_0_RID { I 1 vector } m_axi_gmem_weights5_0_RFIFONUM { I 13 vector } m_axi_gmem_weights5_0_RUSER { I 1 vector } m_axi_gmem_weights5_0_RRESP { I 2 vector } m_axi_gmem_weights5_0_BVALID { I 1 bit } m_axi_gmem_weights5_0_BREADY { O 1 bit } m_axi_gmem_weights5_0_BRESP { I 2 vector } m_axi_gmem_weights5_0_BID { I 1 vector } m_axi_gmem_weights5_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4759 \
    name conv5_weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv5_weights \
    op interface \
    ports { conv5_weights { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4760 \
    name gmem_weights6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_weights6 \
    op interface \
    ports { m_axi_gmem_weights6_0_AWVALID { O 1 bit } m_axi_gmem_weights6_0_AWREADY { I 1 bit } m_axi_gmem_weights6_0_AWADDR { O 64 vector } m_axi_gmem_weights6_0_AWID { O 1 vector } m_axi_gmem_weights6_0_AWLEN { O 32 vector } m_axi_gmem_weights6_0_AWSIZE { O 3 vector } m_axi_gmem_weights6_0_AWBURST { O 2 vector } m_axi_gmem_weights6_0_AWLOCK { O 2 vector } m_axi_gmem_weights6_0_AWCACHE { O 4 vector } m_axi_gmem_weights6_0_AWPROT { O 3 vector } m_axi_gmem_weights6_0_AWQOS { O 4 vector } m_axi_gmem_weights6_0_AWREGION { O 4 vector } m_axi_gmem_weights6_0_AWUSER { O 1 vector } m_axi_gmem_weights6_0_WVALID { O 1 bit } m_axi_gmem_weights6_0_WREADY { I 1 bit } m_axi_gmem_weights6_0_WDATA { O 32 vector } m_axi_gmem_weights6_0_WSTRB { O 4 vector } m_axi_gmem_weights6_0_WLAST { O 1 bit } m_axi_gmem_weights6_0_WID { O 1 vector } m_axi_gmem_weights6_0_WUSER { O 1 vector } m_axi_gmem_weights6_0_ARVALID { O 1 bit } m_axi_gmem_weights6_0_ARREADY { I 1 bit } m_axi_gmem_weights6_0_ARADDR { O 64 vector } m_axi_gmem_weights6_0_ARID { O 1 vector } m_axi_gmem_weights6_0_ARLEN { O 32 vector } m_axi_gmem_weights6_0_ARSIZE { O 3 vector } m_axi_gmem_weights6_0_ARBURST { O 2 vector } m_axi_gmem_weights6_0_ARLOCK { O 2 vector } m_axi_gmem_weights6_0_ARCACHE { O 4 vector } m_axi_gmem_weights6_0_ARPROT { O 3 vector } m_axi_gmem_weights6_0_ARQOS { O 4 vector } m_axi_gmem_weights6_0_ARREGION { O 4 vector } m_axi_gmem_weights6_0_ARUSER { O 1 vector } m_axi_gmem_weights6_0_RVALID { I 1 bit } m_axi_gmem_weights6_0_RREADY { O 1 bit } m_axi_gmem_weights6_0_RDATA { I 32 vector } m_axi_gmem_weights6_0_RLAST { I 1 bit } m_axi_gmem_weights6_0_RID { I 1 vector } m_axi_gmem_weights6_0_RFIFONUM { I 13 vector } m_axi_gmem_weights6_0_RUSER { I 1 vector } m_axi_gmem_weights6_0_RRESP { I 2 vector } m_axi_gmem_weights6_0_BVALID { I 1 bit } m_axi_gmem_weights6_0_BREADY { O 1 bit } m_axi_gmem_weights6_0_BRESP { I 2 vector } m_axi_gmem_weights6_0_BID { I 1 vector } m_axi_gmem_weights6_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4761 \
    name conv6_weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv6_weights \
    op interface \
    ports { conv6_weights { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4762 \
    name gmem_weights7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_weights7 \
    op interface \
    ports { m_axi_gmem_weights7_0_AWVALID { O 1 bit } m_axi_gmem_weights7_0_AWREADY { I 1 bit } m_axi_gmem_weights7_0_AWADDR { O 64 vector } m_axi_gmem_weights7_0_AWID { O 1 vector } m_axi_gmem_weights7_0_AWLEN { O 32 vector } m_axi_gmem_weights7_0_AWSIZE { O 3 vector } m_axi_gmem_weights7_0_AWBURST { O 2 vector } m_axi_gmem_weights7_0_AWLOCK { O 2 vector } m_axi_gmem_weights7_0_AWCACHE { O 4 vector } m_axi_gmem_weights7_0_AWPROT { O 3 vector } m_axi_gmem_weights7_0_AWQOS { O 4 vector } m_axi_gmem_weights7_0_AWREGION { O 4 vector } m_axi_gmem_weights7_0_AWUSER { O 1 vector } m_axi_gmem_weights7_0_WVALID { O 1 bit } m_axi_gmem_weights7_0_WREADY { I 1 bit } m_axi_gmem_weights7_0_WDATA { O 32 vector } m_axi_gmem_weights7_0_WSTRB { O 4 vector } m_axi_gmem_weights7_0_WLAST { O 1 bit } m_axi_gmem_weights7_0_WID { O 1 vector } m_axi_gmem_weights7_0_WUSER { O 1 vector } m_axi_gmem_weights7_0_ARVALID { O 1 bit } m_axi_gmem_weights7_0_ARREADY { I 1 bit } m_axi_gmem_weights7_0_ARADDR { O 64 vector } m_axi_gmem_weights7_0_ARID { O 1 vector } m_axi_gmem_weights7_0_ARLEN { O 32 vector } m_axi_gmem_weights7_0_ARSIZE { O 3 vector } m_axi_gmem_weights7_0_ARBURST { O 2 vector } m_axi_gmem_weights7_0_ARLOCK { O 2 vector } m_axi_gmem_weights7_0_ARCACHE { O 4 vector } m_axi_gmem_weights7_0_ARPROT { O 3 vector } m_axi_gmem_weights7_0_ARQOS { O 4 vector } m_axi_gmem_weights7_0_ARREGION { O 4 vector } m_axi_gmem_weights7_0_ARUSER { O 1 vector } m_axi_gmem_weights7_0_RVALID { I 1 bit } m_axi_gmem_weights7_0_RREADY { O 1 bit } m_axi_gmem_weights7_0_RDATA { I 32 vector } m_axi_gmem_weights7_0_RLAST { I 1 bit } m_axi_gmem_weights7_0_RID { I 1 vector } m_axi_gmem_weights7_0_RFIFONUM { I 13 vector } m_axi_gmem_weights7_0_RUSER { I 1 vector } m_axi_gmem_weights7_0_RRESP { I 2 vector } m_axi_gmem_weights7_0_BVALID { I 1 bit } m_axi_gmem_weights7_0_BREADY { O 1 bit } m_axi_gmem_weights7_0_BRESP { I 2 vector } m_axi_gmem_weights7_0_BID { I 1 vector } m_axi_gmem_weights7_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4763 \
    name fc1_weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fc1_weights \
    op interface \
    ports { fc1_weights { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4764 \
    name gmem_weights8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_weights8 \
    op interface \
    ports { m_axi_gmem_weights8_0_AWVALID { O 1 bit } m_axi_gmem_weights8_0_AWREADY { I 1 bit } m_axi_gmem_weights8_0_AWADDR { O 64 vector } m_axi_gmem_weights8_0_AWID { O 1 vector } m_axi_gmem_weights8_0_AWLEN { O 32 vector } m_axi_gmem_weights8_0_AWSIZE { O 3 vector } m_axi_gmem_weights8_0_AWBURST { O 2 vector } m_axi_gmem_weights8_0_AWLOCK { O 2 vector } m_axi_gmem_weights8_0_AWCACHE { O 4 vector } m_axi_gmem_weights8_0_AWPROT { O 3 vector } m_axi_gmem_weights8_0_AWQOS { O 4 vector } m_axi_gmem_weights8_0_AWREGION { O 4 vector } m_axi_gmem_weights8_0_AWUSER { O 1 vector } m_axi_gmem_weights8_0_WVALID { O 1 bit } m_axi_gmem_weights8_0_WREADY { I 1 bit } m_axi_gmem_weights8_0_WDATA { O 32 vector } m_axi_gmem_weights8_0_WSTRB { O 4 vector } m_axi_gmem_weights8_0_WLAST { O 1 bit } m_axi_gmem_weights8_0_WID { O 1 vector } m_axi_gmem_weights8_0_WUSER { O 1 vector } m_axi_gmem_weights8_0_ARVALID { O 1 bit } m_axi_gmem_weights8_0_ARREADY { I 1 bit } m_axi_gmem_weights8_0_ARADDR { O 64 vector } m_axi_gmem_weights8_0_ARID { O 1 vector } m_axi_gmem_weights8_0_ARLEN { O 32 vector } m_axi_gmem_weights8_0_ARSIZE { O 3 vector } m_axi_gmem_weights8_0_ARBURST { O 2 vector } m_axi_gmem_weights8_0_ARLOCK { O 2 vector } m_axi_gmem_weights8_0_ARCACHE { O 4 vector } m_axi_gmem_weights8_0_ARPROT { O 3 vector } m_axi_gmem_weights8_0_ARQOS { O 4 vector } m_axi_gmem_weights8_0_ARREGION { O 4 vector } m_axi_gmem_weights8_0_ARUSER { O 1 vector } m_axi_gmem_weights8_0_RVALID { I 1 bit } m_axi_gmem_weights8_0_RREADY { O 1 bit } m_axi_gmem_weights8_0_RDATA { I 32 vector } m_axi_gmem_weights8_0_RLAST { I 1 bit } m_axi_gmem_weights8_0_RID { I 1 vector } m_axi_gmem_weights8_0_RFIFONUM { I 13 vector } m_axi_gmem_weights8_0_RUSER { I 1 vector } m_axi_gmem_weights8_0_RRESP { I 2 vector } m_axi_gmem_weights8_0_BVALID { I 1 bit } m_axi_gmem_weights8_0_BREADY { O 1 bit } m_axi_gmem_weights8_0_BRESP { I 2 vector } m_axi_gmem_weights8_0_BID { I 1 vector } m_axi_gmem_weights8_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4765 \
    name fc2_weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fc2_weights \
    op interface \
    ports { fc2_weights { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4766 \
    name gmem_bias1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_bias1 \
    op interface \
    ports { m_axi_gmem_bias1_0_AWVALID { O 1 bit } m_axi_gmem_bias1_0_AWREADY { I 1 bit } m_axi_gmem_bias1_0_AWADDR { O 64 vector } m_axi_gmem_bias1_0_AWID { O 1 vector } m_axi_gmem_bias1_0_AWLEN { O 32 vector } m_axi_gmem_bias1_0_AWSIZE { O 3 vector } m_axi_gmem_bias1_0_AWBURST { O 2 vector } m_axi_gmem_bias1_0_AWLOCK { O 2 vector } m_axi_gmem_bias1_0_AWCACHE { O 4 vector } m_axi_gmem_bias1_0_AWPROT { O 3 vector } m_axi_gmem_bias1_0_AWQOS { O 4 vector } m_axi_gmem_bias1_0_AWREGION { O 4 vector } m_axi_gmem_bias1_0_AWUSER { O 1 vector } m_axi_gmem_bias1_0_WVALID { O 1 bit } m_axi_gmem_bias1_0_WREADY { I 1 bit } m_axi_gmem_bias1_0_WDATA { O 32 vector } m_axi_gmem_bias1_0_WSTRB { O 4 vector } m_axi_gmem_bias1_0_WLAST { O 1 bit } m_axi_gmem_bias1_0_WID { O 1 vector } m_axi_gmem_bias1_0_WUSER { O 1 vector } m_axi_gmem_bias1_0_ARVALID { O 1 bit } m_axi_gmem_bias1_0_ARREADY { I 1 bit } m_axi_gmem_bias1_0_ARADDR { O 64 vector } m_axi_gmem_bias1_0_ARID { O 1 vector } m_axi_gmem_bias1_0_ARLEN { O 32 vector } m_axi_gmem_bias1_0_ARSIZE { O 3 vector } m_axi_gmem_bias1_0_ARBURST { O 2 vector } m_axi_gmem_bias1_0_ARLOCK { O 2 vector } m_axi_gmem_bias1_0_ARCACHE { O 4 vector } m_axi_gmem_bias1_0_ARPROT { O 3 vector } m_axi_gmem_bias1_0_ARQOS { O 4 vector } m_axi_gmem_bias1_0_ARREGION { O 4 vector } m_axi_gmem_bias1_0_ARUSER { O 1 vector } m_axi_gmem_bias1_0_RVALID { I 1 bit } m_axi_gmem_bias1_0_RREADY { O 1 bit } m_axi_gmem_bias1_0_RDATA { I 32 vector } m_axi_gmem_bias1_0_RLAST { I 1 bit } m_axi_gmem_bias1_0_RID { I 1 vector } m_axi_gmem_bias1_0_RFIFONUM { I 9 vector } m_axi_gmem_bias1_0_RUSER { I 1 vector } m_axi_gmem_bias1_0_RRESP { I 2 vector } m_axi_gmem_bias1_0_BVALID { I 1 bit } m_axi_gmem_bias1_0_BREADY { O 1 bit } m_axi_gmem_bias1_0_BRESP { I 2 vector } m_axi_gmem_bias1_0_BID { I 1 vector } m_axi_gmem_bias1_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4767 \
    name conv1_bias \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv1_bias \
    op interface \
    ports { conv1_bias { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4768 \
    name gmem_bias2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_bias2 \
    op interface \
    ports { m_axi_gmem_bias2_0_AWVALID { O 1 bit } m_axi_gmem_bias2_0_AWREADY { I 1 bit } m_axi_gmem_bias2_0_AWADDR { O 64 vector } m_axi_gmem_bias2_0_AWID { O 1 vector } m_axi_gmem_bias2_0_AWLEN { O 32 vector } m_axi_gmem_bias2_0_AWSIZE { O 3 vector } m_axi_gmem_bias2_0_AWBURST { O 2 vector } m_axi_gmem_bias2_0_AWLOCK { O 2 vector } m_axi_gmem_bias2_0_AWCACHE { O 4 vector } m_axi_gmem_bias2_0_AWPROT { O 3 vector } m_axi_gmem_bias2_0_AWQOS { O 4 vector } m_axi_gmem_bias2_0_AWREGION { O 4 vector } m_axi_gmem_bias2_0_AWUSER { O 1 vector } m_axi_gmem_bias2_0_WVALID { O 1 bit } m_axi_gmem_bias2_0_WREADY { I 1 bit } m_axi_gmem_bias2_0_WDATA { O 32 vector } m_axi_gmem_bias2_0_WSTRB { O 4 vector } m_axi_gmem_bias2_0_WLAST { O 1 bit } m_axi_gmem_bias2_0_WID { O 1 vector } m_axi_gmem_bias2_0_WUSER { O 1 vector } m_axi_gmem_bias2_0_ARVALID { O 1 bit } m_axi_gmem_bias2_0_ARREADY { I 1 bit } m_axi_gmem_bias2_0_ARADDR { O 64 vector } m_axi_gmem_bias2_0_ARID { O 1 vector } m_axi_gmem_bias2_0_ARLEN { O 32 vector } m_axi_gmem_bias2_0_ARSIZE { O 3 vector } m_axi_gmem_bias2_0_ARBURST { O 2 vector } m_axi_gmem_bias2_0_ARLOCK { O 2 vector } m_axi_gmem_bias2_0_ARCACHE { O 4 vector } m_axi_gmem_bias2_0_ARPROT { O 3 vector } m_axi_gmem_bias2_0_ARQOS { O 4 vector } m_axi_gmem_bias2_0_ARREGION { O 4 vector } m_axi_gmem_bias2_0_ARUSER { O 1 vector } m_axi_gmem_bias2_0_RVALID { I 1 bit } m_axi_gmem_bias2_0_RREADY { O 1 bit } m_axi_gmem_bias2_0_RDATA { I 32 vector } m_axi_gmem_bias2_0_RLAST { I 1 bit } m_axi_gmem_bias2_0_RID { I 1 vector } m_axi_gmem_bias2_0_RFIFONUM { I 10 vector } m_axi_gmem_bias2_0_RUSER { I 1 vector } m_axi_gmem_bias2_0_RRESP { I 2 vector } m_axi_gmem_bias2_0_BVALID { I 1 bit } m_axi_gmem_bias2_0_BREADY { O 1 bit } m_axi_gmem_bias2_0_BRESP { I 2 vector } m_axi_gmem_bias2_0_BID { I 1 vector } m_axi_gmem_bias2_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4769 \
    name conv2_bias \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv2_bias \
    op interface \
    ports { conv2_bias { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4770 \
    name gmem_bias3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_bias3 \
    op interface \
    ports { m_axi_gmem_bias3_0_AWVALID { O 1 bit } m_axi_gmem_bias3_0_AWREADY { I 1 bit } m_axi_gmem_bias3_0_AWADDR { O 64 vector } m_axi_gmem_bias3_0_AWID { O 1 vector } m_axi_gmem_bias3_0_AWLEN { O 32 vector } m_axi_gmem_bias3_0_AWSIZE { O 3 vector } m_axi_gmem_bias3_0_AWBURST { O 2 vector } m_axi_gmem_bias3_0_AWLOCK { O 2 vector } m_axi_gmem_bias3_0_AWCACHE { O 4 vector } m_axi_gmem_bias3_0_AWPROT { O 3 vector } m_axi_gmem_bias3_0_AWQOS { O 4 vector } m_axi_gmem_bias3_0_AWREGION { O 4 vector } m_axi_gmem_bias3_0_AWUSER { O 1 vector } m_axi_gmem_bias3_0_WVALID { O 1 bit } m_axi_gmem_bias3_0_WREADY { I 1 bit } m_axi_gmem_bias3_0_WDATA { O 32 vector } m_axi_gmem_bias3_0_WSTRB { O 4 vector } m_axi_gmem_bias3_0_WLAST { O 1 bit } m_axi_gmem_bias3_0_WID { O 1 vector } m_axi_gmem_bias3_0_WUSER { O 1 vector } m_axi_gmem_bias3_0_ARVALID { O 1 bit } m_axi_gmem_bias3_0_ARREADY { I 1 bit } m_axi_gmem_bias3_0_ARADDR { O 64 vector } m_axi_gmem_bias3_0_ARID { O 1 vector } m_axi_gmem_bias3_0_ARLEN { O 32 vector } m_axi_gmem_bias3_0_ARSIZE { O 3 vector } m_axi_gmem_bias3_0_ARBURST { O 2 vector } m_axi_gmem_bias3_0_ARLOCK { O 2 vector } m_axi_gmem_bias3_0_ARCACHE { O 4 vector } m_axi_gmem_bias3_0_ARPROT { O 3 vector } m_axi_gmem_bias3_0_ARQOS { O 4 vector } m_axi_gmem_bias3_0_ARREGION { O 4 vector } m_axi_gmem_bias3_0_ARUSER { O 1 vector } m_axi_gmem_bias3_0_RVALID { I 1 bit } m_axi_gmem_bias3_0_RREADY { O 1 bit } m_axi_gmem_bias3_0_RDATA { I 32 vector } m_axi_gmem_bias3_0_RLAST { I 1 bit } m_axi_gmem_bias3_0_RID { I 1 vector } m_axi_gmem_bias3_0_RFIFONUM { I 11 vector } m_axi_gmem_bias3_0_RUSER { I 1 vector } m_axi_gmem_bias3_0_RRESP { I 2 vector } m_axi_gmem_bias3_0_BVALID { I 1 bit } m_axi_gmem_bias3_0_BREADY { O 1 bit } m_axi_gmem_bias3_0_BRESP { I 2 vector } m_axi_gmem_bias3_0_BID { I 1 vector } m_axi_gmem_bias3_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4771 \
    name conv3_bias \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_bias \
    op interface \
    ports { conv3_bias { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4772 \
    name gmem_bias4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_bias4 \
    op interface \
    ports { m_axi_gmem_bias4_0_AWVALID { O 1 bit } m_axi_gmem_bias4_0_AWREADY { I 1 bit } m_axi_gmem_bias4_0_AWADDR { O 64 vector } m_axi_gmem_bias4_0_AWID { O 1 vector } m_axi_gmem_bias4_0_AWLEN { O 32 vector } m_axi_gmem_bias4_0_AWSIZE { O 3 vector } m_axi_gmem_bias4_0_AWBURST { O 2 vector } m_axi_gmem_bias4_0_AWLOCK { O 2 vector } m_axi_gmem_bias4_0_AWCACHE { O 4 vector } m_axi_gmem_bias4_0_AWPROT { O 3 vector } m_axi_gmem_bias4_0_AWQOS { O 4 vector } m_axi_gmem_bias4_0_AWREGION { O 4 vector } m_axi_gmem_bias4_0_AWUSER { O 1 vector } m_axi_gmem_bias4_0_WVALID { O 1 bit } m_axi_gmem_bias4_0_WREADY { I 1 bit } m_axi_gmem_bias4_0_WDATA { O 32 vector } m_axi_gmem_bias4_0_WSTRB { O 4 vector } m_axi_gmem_bias4_0_WLAST { O 1 bit } m_axi_gmem_bias4_0_WID { O 1 vector } m_axi_gmem_bias4_0_WUSER { O 1 vector } m_axi_gmem_bias4_0_ARVALID { O 1 bit } m_axi_gmem_bias4_0_ARREADY { I 1 bit } m_axi_gmem_bias4_0_ARADDR { O 64 vector } m_axi_gmem_bias4_0_ARID { O 1 vector } m_axi_gmem_bias4_0_ARLEN { O 32 vector } m_axi_gmem_bias4_0_ARSIZE { O 3 vector } m_axi_gmem_bias4_0_ARBURST { O 2 vector } m_axi_gmem_bias4_0_ARLOCK { O 2 vector } m_axi_gmem_bias4_0_ARCACHE { O 4 vector } m_axi_gmem_bias4_0_ARPROT { O 3 vector } m_axi_gmem_bias4_0_ARQOS { O 4 vector } m_axi_gmem_bias4_0_ARREGION { O 4 vector } m_axi_gmem_bias4_0_ARUSER { O 1 vector } m_axi_gmem_bias4_0_RVALID { I 1 bit } m_axi_gmem_bias4_0_RREADY { O 1 bit } m_axi_gmem_bias4_0_RDATA { I 32 vector } m_axi_gmem_bias4_0_RLAST { I 1 bit } m_axi_gmem_bias4_0_RID { I 1 vector } m_axi_gmem_bias4_0_RFIFONUM { I 12 vector } m_axi_gmem_bias4_0_RUSER { I 1 vector } m_axi_gmem_bias4_0_RRESP { I 2 vector } m_axi_gmem_bias4_0_BVALID { I 1 bit } m_axi_gmem_bias4_0_BREADY { O 1 bit } m_axi_gmem_bias4_0_BRESP { I 2 vector } m_axi_gmem_bias4_0_BID { I 1 vector } m_axi_gmem_bias4_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4773 \
    name conv4_bias \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv4_bias \
    op interface \
    ports { conv4_bias { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4774 \
    name gmem_bias5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_bias5 \
    op interface \
    ports { m_axi_gmem_bias5_0_AWVALID { O 1 bit } m_axi_gmem_bias5_0_AWREADY { I 1 bit } m_axi_gmem_bias5_0_AWADDR { O 64 vector } m_axi_gmem_bias5_0_AWID { O 1 vector } m_axi_gmem_bias5_0_AWLEN { O 32 vector } m_axi_gmem_bias5_0_AWSIZE { O 3 vector } m_axi_gmem_bias5_0_AWBURST { O 2 vector } m_axi_gmem_bias5_0_AWLOCK { O 2 vector } m_axi_gmem_bias5_0_AWCACHE { O 4 vector } m_axi_gmem_bias5_0_AWPROT { O 3 vector } m_axi_gmem_bias5_0_AWQOS { O 4 vector } m_axi_gmem_bias5_0_AWREGION { O 4 vector } m_axi_gmem_bias5_0_AWUSER { O 1 vector } m_axi_gmem_bias5_0_WVALID { O 1 bit } m_axi_gmem_bias5_0_WREADY { I 1 bit } m_axi_gmem_bias5_0_WDATA { O 32 vector } m_axi_gmem_bias5_0_WSTRB { O 4 vector } m_axi_gmem_bias5_0_WLAST { O 1 bit } m_axi_gmem_bias5_0_WID { O 1 vector } m_axi_gmem_bias5_0_WUSER { O 1 vector } m_axi_gmem_bias5_0_ARVALID { O 1 bit } m_axi_gmem_bias5_0_ARREADY { I 1 bit } m_axi_gmem_bias5_0_ARADDR { O 64 vector } m_axi_gmem_bias5_0_ARID { O 1 vector } m_axi_gmem_bias5_0_ARLEN { O 32 vector } m_axi_gmem_bias5_0_ARSIZE { O 3 vector } m_axi_gmem_bias5_0_ARBURST { O 2 vector } m_axi_gmem_bias5_0_ARLOCK { O 2 vector } m_axi_gmem_bias5_0_ARCACHE { O 4 vector } m_axi_gmem_bias5_0_ARPROT { O 3 vector } m_axi_gmem_bias5_0_ARQOS { O 4 vector } m_axi_gmem_bias5_0_ARREGION { O 4 vector } m_axi_gmem_bias5_0_ARUSER { O 1 vector } m_axi_gmem_bias5_0_RVALID { I 1 bit } m_axi_gmem_bias5_0_RREADY { O 1 bit } m_axi_gmem_bias5_0_RDATA { I 32 vector } m_axi_gmem_bias5_0_RLAST { I 1 bit } m_axi_gmem_bias5_0_RID { I 1 vector } m_axi_gmem_bias5_0_RFIFONUM { I 13 vector } m_axi_gmem_bias5_0_RUSER { I 1 vector } m_axi_gmem_bias5_0_RRESP { I 2 vector } m_axi_gmem_bias5_0_BVALID { I 1 bit } m_axi_gmem_bias5_0_BREADY { O 1 bit } m_axi_gmem_bias5_0_BRESP { I 2 vector } m_axi_gmem_bias5_0_BID { I 1 vector } m_axi_gmem_bias5_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4775 \
    name conv5_bias \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv5_bias \
    op interface \
    ports { conv5_bias { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4776 \
    name gmem_bias6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_bias6 \
    op interface \
    ports { m_axi_gmem_bias6_0_AWVALID { O 1 bit } m_axi_gmem_bias6_0_AWREADY { I 1 bit } m_axi_gmem_bias6_0_AWADDR { O 64 vector } m_axi_gmem_bias6_0_AWID { O 1 vector } m_axi_gmem_bias6_0_AWLEN { O 32 vector } m_axi_gmem_bias6_0_AWSIZE { O 3 vector } m_axi_gmem_bias6_0_AWBURST { O 2 vector } m_axi_gmem_bias6_0_AWLOCK { O 2 vector } m_axi_gmem_bias6_0_AWCACHE { O 4 vector } m_axi_gmem_bias6_0_AWPROT { O 3 vector } m_axi_gmem_bias6_0_AWQOS { O 4 vector } m_axi_gmem_bias6_0_AWREGION { O 4 vector } m_axi_gmem_bias6_0_AWUSER { O 1 vector } m_axi_gmem_bias6_0_WVALID { O 1 bit } m_axi_gmem_bias6_0_WREADY { I 1 bit } m_axi_gmem_bias6_0_WDATA { O 32 vector } m_axi_gmem_bias6_0_WSTRB { O 4 vector } m_axi_gmem_bias6_0_WLAST { O 1 bit } m_axi_gmem_bias6_0_WID { O 1 vector } m_axi_gmem_bias6_0_WUSER { O 1 vector } m_axi_gmem_bias6_0_ARVALID { O 1 bit } m_axi_gmem_bias6_0_ARREADY { I 1 bit } m_axi_gmem_bias6_0_ARADDR { O 64 vector } m_axi_gmem_bias6_0_ARID { O 1 vector } m_axi_gmem_bias6_0_ARLEN { O 32 vector } m_axi_gmem_bias6_0_ARSIZE { O 3 vector } m_axi_gmem_bias6_0_ARBURST { O 2 vector } m_axi_gmem_bias6_0_ARLOCK { O 2 vector } m_axi_gmem_bias6_0_ARCACHE { O 4 vector } m_axi_gmem_bias6_0_ARPROT { O 3 vector } m_axi_gmem_bias6_0_ARQOS { O 4 vector } m_axi_gmem_bias6_0_ARREGION { O 4 vector } m_axi_gmem_bias6_0_ARUSER { O 1 vector } m_axi_gmem_bias6_0_RVALID { I 1 bit } m_axi_gmem_bias6_0_RREADY { O 1 bit } m_axi_gmem_bias6_0_RDATA { I 32 vector } m_axi_gmem_bias6_0_RLAST { I 1 bit } m_axi_gmem_bias6_0_RID { I 1 vector } m_axi_gmem_bias6_0_RFIFONUM { I 13 vector } m_axi_gmem_bias6_0_RUSER { I 1 vector } m_axi_gmem_bias6_0_RRESP { I 2 vector } m_axi_gmem_bias6_0_BVALID { I 1 bit } m_axi_gmem_bias6_0_BREADY { O 1 bit } m_axi_gmem_bias6_0_BRESP { I 2 vector } m_axi_gmem_bias6_0_BID { I 1 vector } m_axi_gmem_bias6_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4777 \
    name conv6_bias \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv6_bias \
    op interface \
    ports { conv6_bias { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4778 \
    name gmem_bias7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_bias7 \
    op interface \
    ports { m_axi_gmem_bias7_0_AWVALID { O 1 bit } m_axi_gmem_bias7_0_AWREADY { I 1 bit } m_axi_gmem_bias7_0_AWADDR { O 64 vector } m_axi_gmem_bias7_0_AWID { O 1 vector } m_axi_gmem_bias7_0_AWLEN { O 32 vector } m_axi_gmem_bias7_0_AWSIZE { O 3 vector } m_axi_gmem_bias7_0_AWBURST { O 2 vector } m_axi_gmem_bias7_0_AWLOCK { O 2 vector } m_axi_gmem_bias7_0_AWCACHE { O 4 vector } m_axi_gmem_bias7_0_AWPROT { O 3 vector } m_axi_gmem_bias7_0_AWQOS { O 4 vector } m_axi_gmem_bias7_0_AWREGION { O 4 vector } m_axi_gmem_bias7_0_AWUSER { O 1 vector } m_axi_gmem_bias7_0_WVALID { O 1 bit } m_axi_gmem_bias7_0_WREADY { I 1 bit } m_axi_gmem_bias7_0_WDATA { O 32 vector } m_axi_gmem_bias7_0_WSTRB { O 4 vector } m_axi_gmem_bias7_0_WLAST { O 1 bit } m_axi_gmem_bias7_0_WID { O 1 vector } m_axi_gmem_bias7_0_WUSER { O 1 vector } m_axi_gmem_bias7_0_ARVALID { O 1 bit } m_axi_gmem_bias7_0_ARREADY { I 1 bit } m_axi_gmem_bias7_0_ARADDR { O 64 vector } m_axi_gmem_bias7_0_ARID { O 1 vector } m_axi_gmem_bias7_0_ARLEN { O 32 vector } m_axi_gmem_bias7_0_ARSIZE { O 3 vector } m_axi_gmem_bias7_0_ARBURST { O 2 vector } m_axi_gmem_bias7_0_ARLOCK { O 2 vector } m_axi_gmem_bias7_0_ARCACHE { O 4 vector } m_axi_gmem_bias7_0_ARPROT { O 3 vector } m_axi_gmem_bias7_0_ARQOS { O 4 vector } m_axi_gmem_bias7_0_ARREGION { O 4 vector } m_axi_gmem_bias7_0_ARUSER { O 1 vector } m_axi_gmem_bias7_0_RVALID { I 1 bit } m_axi_gmem_bias7_0_RREADY { O 1 bit } m_axi_gmem_bias7_0_RDATA { I 32 vector } m_axi_gmem_bias7_0_RLAST { I 1 bit } m_axi_gmem_bias7_0_RID { I 1 vector } m_axi_gmem_bias7_0_RFIFONUM { I 12 vector } m_axi_gmem_bias7_0_RUSER { I 1 vector } m_axi_gmem_bias7_0_RRESP { I 2 vector } m_axi_gmem_bias7_0_BVALID { I 1 bit } m_axi_gmem_bias7_0_BREADY { O 1 bit } m_axi_gmem_bias7_0_BRESP { I 2 vector } m_axi_gmem_bias7_0_BID { I 1 vector } m_axi_gmem_bias7_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4779 \
    name fc1_bias \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fc1_bias \
    op interface \
    ports { fc1_bias { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4780 \
    name gmem_bias8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_bias8 \
    op interface \
    ports { m_axi_gmem_bias8_0_AWVALID { O 1 bit } m_axi_gmem_bias8_0_AWREADY { I 1 bit } m_axi_gmem_bias8_0_AWADDR { O 64 vector } m_axi_gmem_bias8_0_AWID { O 1 vector } m_axi_gmem_bias8_0_AWLEN { O 32 vector } m_axi_gmem_bias8_0_AWSIZE { O 3 vector } m_axi_gmem_bias8_0_AWBURST { O 2 vector } m_axi_gmem_bias8_0_AWLOCK { O 2 vector } m_axi_gmem_bias8_0_AWCACHE { O 4 vector } m_axi_gmem_bias8_0_AWPROT { O 3 vector } m_axi_gmem_bias8_0_AWQOS { O 4 vector } m_axi_gmem_bias8_0_AWREGION { O 4 vector } m_axi_gmem_bias8_0_AWUSER { O 1 vector } m_axi_gmem_bias8_0_WVALID { O 1 bit } m_axi_gmem_bias8_0_WREADY { I 1 bit } m_axi_gmem_bias8_0_WDATA { O 32 vector } m_axi_gmem_bias8_0_WSTRB { O 4 vector } m_axi_gmem_bias8_0_WLAST { O 1 bit } m_axi_gmem_bias8_0_WID { O 1 vector } m_axi_gmem_bias8_0_WUSER { O 1 vector } m_axi_gmem_bias8_0_ARVALID { O 1 bit } m_axi_gmem_bias8_0_ARREADY { I 1 bit } m_axi_gmem_bias8_0_ARADDR { O 64 vector } m_axi_gmem_bias8_0_ARID { O 1 vector } m_axi_gmem_bias8_0_ARLEN { O 32 vector } m_axi_gmem_bias8_0_ARSIZE { O 3 vector } m_axi_gmem_bias8_0_ARBURST { O 2 vector } m_axi_gmem_bias8_0_ARLOCK { O 2 vector } m_axi_gmem_bias8_0_ARCACHE { O 4 vector } m_axi_gmem_bias8_0_ARPROT { O 3 vector } m_axi_gmem_bias8_0_ARQOS { O 4 vector } m_axi_gmem_bias8_0_ARREGION { O 4 vector } m_axi_gmem_bias8_0_ARUSER { O 1 vector } m_axi_gmem_bias8_0_RVALID { I 1 bit } m_axi_gmem_bias8_0_RREADY { O 1 bit } m_axi_gmem_bias8_0_RDATA { I 32 vector } m_axi_gmem_bias8_0_RLAST { I 1 bit } m_axi_gmem_bias8_0_RID { I 1 vector } m_axi_gmem_bias8_0_RFIFONUM { I 10 vector } m_axi_gmem_bias8_0_RUSER { I 1 vector } m_axi_gmem_bias8_0_RRESP { I 2 vector } m_axi_gmem_bias8_0_BVALID { I 1 bit } m_axi_gmem_bias8_0_BREADY { O 1 bit } m_axi_gmem_bias8_0_BRESP { I 2 vector } m_axi_gmem_bias8_0_BID { I 1 vector } m_axi_gmem_bias8_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4781 \
    name fc2_bias \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fc2_bias \
    op interface \
    ports { fc2_bias { I 64 vector } } \
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


