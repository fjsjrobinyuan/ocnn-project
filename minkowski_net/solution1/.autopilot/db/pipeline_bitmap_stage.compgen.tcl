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
    id 36 \
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
    id 37 \
    name feature_data_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_feature_data_stream \
    op interface \
    ports { feature_data_stream_din { O 1085 vector } feature_data_stream_full_n { I 1 bit } feature_data_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name write_addr_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_write_addr_stream \
    op interface \
    ports { write_addr_stream_din { O 60 vector } write_addr_stream_full_n { I 1 bit } write_addr_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name L3_bitmap_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_L3_bitmap_read \
    op interface \
    ports { L3_bitmap_read { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name L2_bitmap \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_L2_bitmap \
    op interface \
    ports { L2_bitmap_i { I 512 vector } L2_bitmap_o { O 512 vector } L2_bitmap_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name L1_bitmap_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_L1_bitmap_read \
    op interface \
    ports { L1_bitmap_read { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name L0_bitmap_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_L0_bitmap_read \
    op interface \
    ports { L0_bitmap_read { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name initial_processed_voxels_constprop \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_initial_processed_voxels_constprop \
    op interface \
    ports { initial_processed_voxels_constprop_i { I 32 vector } initial_processed_voxels_constprop_o { O 32 vector } initial_processed_voxels_constprop_o_ap_vld { O 1 bit } } \
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


