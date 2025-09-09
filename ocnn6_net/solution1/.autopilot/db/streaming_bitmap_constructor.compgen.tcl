# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_bitset_512ns_512ns_32s_1ns_512_1_1 BINDTYPE {op} TYPE {bitset} IMPL {auto}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_bitset_64ns_64ns_32ns_1ns_64_1_1 BINDTYPE {op} TYPE {bitset} IMPL {auto}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor_streaming_bitmap_constructor_stream_stream_streabkb BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor_streaming_bitmap_constructor_stream_stream_streadEe BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ocnn6_net_8_layer_pipeline_streaming_bitmap_constructor_l2_temp_buffer_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 54 \
    name input_voxel_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_voxel_stream \
    op interface \
    ports { input_voxel_stream_dout { I 1085 vector } input_voxel_stream_empty_n { I 1 bit } input_voxel_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name feature_data_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_feature_data_stream \
    op interface \
    ports { feature_data_stream_din { O 1085 vector } feature_data_stream_full_n { I 1 bit } feature_data_stream_write { O 1 bit } feature_data_stream_num_data_valid { I 11 vector } feature_data_stream_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name write_addr_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_write_addr_stream \
    op interface \
    ports { write_addr_stream_din { O 60 vector } write_addr_stream_full_n { I 1 bit } write_addr_stream_write { O 1 bit } write_addr_stream_num_data_valid { I 11 vector } write_addr_stream_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name p_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read \
    op interface \
    ports { p_read { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name L2_bitmap \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_L2_bitmap \
    op interface \
    ports { L2_bitmap { O 512 vector } L2_bitmap_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name L2_bitmap_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_L2_bitmap_read \
    op interface \
    ports { L2_bitmap_read { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name p_read1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read1 \
    op interface \
    ports { p_read1 { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name p_read2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read2 \
    op interface \
    ports { p_read2 { I 512 vector } } \
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

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 1 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
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
    id -4 \
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


