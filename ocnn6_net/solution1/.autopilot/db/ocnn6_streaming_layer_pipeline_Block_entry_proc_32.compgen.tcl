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
    id 3793 \
    name layer_weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_layer_weights \
    op interface \
    ports { layer_weights { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3794 \
    name p_out \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out \
    op interface \
    ports { p_out_din { O 64 vector } p_out_full_n { I 1 bit } p_out_write { O 1 bit } p_out_num_data_valid { I 11 vector } p_out_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3795 \
    name p_out1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out1 \
    op interface \
    ports { p_out1_din { O 64 vector } p_out1_full_n { I 1 bit } p_out1_write { O 1 bit } p_out1_num_data_valid { I 11 vector } p_out1_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3796 \
    name p_out2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out2 \
    op interface \
    ports { p_out2_din { O 64 vector } p_out2_full_n { I 1 bit } p_out2_write { O 1 bit } p_out2_num_data_valid { I 11 vector } p_out2_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3797 \
    name p_out3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out3 \
    op interface \
    ports { p_out3_din { O 64 vector } p_out3_full_n { I 1 bit } p_out3_write { O 1 bit } p_out3_num_data_valid { I 11 vector } p_out3_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3798 \
    name p_out4 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out4 \
    op interface \
    ports { p_out4_din { O 64 vector } p_out4_full_n { I 1 bit } p_out4_write { O 1 bit } p_out4_num_data_valid { I 11 vector } p_out4_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3799 \
    name p_out5 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out5 \
    op interface \
    ports { p_out5_din { O 64 vector } p_out5_full_n { I 1 bit } p_out5_write { O 1 bit } p_out5_num_data_valid { I 11 vector } p_out5_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3800 \
    name p_out6 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out6 \
    op interface \
    ports { p_out6_din { O 64 vector } p_out6_full_n { I 1 bit } p_out6_write { O 1 bit } p_out6_num_data_valid { I 11 vector } p_out6_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3801 \
    name p_out7 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out7 \
    op interface \
    ports { p_out7_din { O 64 vector } p_out7_full_n { I 1 bit } p_out7_write { O 1 bit } p_out7_num_data_valid { I 11 vector } p_out7_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3802 \
    name p_out8 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out8 \
    op interface \
    ports { p_out8_din { O 64 vector } p_out8_full_n { I 1 bit } p_out8_write { O 1 bit } p_out8_num_data_valid { I 11 vector } p_out8_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3803 \
    name p_out9 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out9 \
    op interface \
    ports { p_out9_din { O 64 vector } p_out9_full_n { I 1 bit } p_out9_write { O 1 bit } p_out9_num_data_valid { I 11 vector } p_out9_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3804 \
    name p_out10 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out10 \
    op interface \
    ports { p_out10_din { O 64 vector } p_out10_full_n { I 1 bit } p_out10_write { O 1 bit } p_out10_num_data_valid { I 11 vector } p_out10_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3805 \
    name p_out11 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out11 \
    op interface \
    ports { p_out11_din { O 64 vector } p_out11_full_n { I 1 bit } p_out11_write { O 1 bit } p_out11_num_data_valid { I 11 vector } p_out11_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3806 \
    name p_out12 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out12 \
    op interface \
    ports { p_out12_din { O 64 vector } p_out12_full_n { I 1 bit } p_out12_write { O 1 bit } p_out12_num_data_valid { I 11 vector } p_out12_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3807 \
    name p_out13 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out13 \
    op interface \
    ports { p_out13_din { O 64 vector } p_out13_full_n { I 1 bit } p_out13_write { O 1 bit } p_out13_num_data_valid { I 11 vector } p_out13_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3808 \
    name p_out14 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out14 \
    op interface \
    ports { p_out14_din { O 64 vector } p_out14_full_n { I 1 bit } p_out14_write { O 1 bit } p_out14_num_data_valid { I 11 vector } p_out14_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3809 \
    name p_out15 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out15 \
    op interface \
    ports { p_out15_din { O 64 vector } p_out15_full_n { I 1 bit } p_out15_write { O 1 bit } p_out15_num_data_valid { I 11 vector } p_out15_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3810 \
    name p_out16 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out16 \
    op interface \
    ports { p_out16_din { O 64 vector } p_out16_full_n { I 1 bit } p_out16_write { O 1 bit } p_out16_num_data_valid { I 11 vector } p_out16_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3811 \
    name p_out17 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out17 \
    op interface \
    ports { p_out17_din { O 64 vector } p_out17_full_n { I 1 bit } p_out17_write { O 1 bit } p_out17_num_data_valid { I 11 vector } p_out17_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3812 \
    name p_out18 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out18 \
    op interface \
    ports { p_out18_din { O 64 vector } p_out18_full_n { I 1 bit } p_out18_write { O 1 bit } p_out18_num_data_valid { I 11 vector } p_out18_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3813 \
    name p_out19 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out19 \
    op interface \
    ports { p_out19_din { O 64 vector } p_out19_full_n { I 1 bit } p_out19_write { O 1 bit } p_out19_num_data_valid { I 11 vector } p_out19_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3814 \
    name p_out20 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out20 \
    op interface \
    ports { p_out20_din { O 64 vector } p_out20_full_n { I 1 bit } p_out20_write { O 1 bit } p_out20_num_data_valid { I 11 vector } p_out20_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3815 \
    name p_out21 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out21 \
    op interface \
    ports { p_out21_din { O 64 vector } p_out21_full_n { I 1 bit } p_out21_write { O 1 bit } p_out21_num_data_valid { I 11 vector } p_out21_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3816 \
    name p_out22 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out22 \
    op interface \
    ports { p_out22_din { O 64 vector } p_out22_full_n { I 1 bit } p_out22_write { O 1 bit } p_out22_num_data_valid { I 11 vector } p_out22_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3817 \
    name p_out23 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out23 \
    op interface \
    ports { p_out23_din { O 64 vector } p_out23_full_n { I 1 bit } p_out23_write { O 1 bit } p_out23_num_data_valid { I 11 vector } p_out23_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3818 \
    name p_out24 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out24 \
    op interface \
    ports { p_out24_din { O 64 vector } p_out24_full_n { I 1 bit } p_out24_write { O 1 bit } p_out24_num_data_valid { I 11 vector } p_out24_fifo_cap { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3819 \
    name p_out25 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out25 \
    op interface \
    ports { p_out25_din { O 64 vector } p_out25_full_n { I 1 bit } p_out25_write { O 1 bit } p_out25_num_data_valid { I 11 vector } p_out25_fifo_cap { I 11 vector } } \
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


