# This script segment is generated automatically by AutoPilot

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


