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


