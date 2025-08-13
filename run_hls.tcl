# create and conigure project
open_project ocnn_fpga_project -reset
set_top complete_octree_pipeline

# add source files
add_files complete_pipeline.cpp -cflags "-I."
add_files streaming_bitmap_constructor.cpp -cflags "-I."
add_files dynamic_access.cpp -cflags "-I."
add_files morton_reorder_buffer.cpp -cflags "-I."
add_files systolic_array.cpp -cflags "-I."
add_files -tb hls_testbench.cpp -cflags "-I."

# create solution
open_solution "solution1" -flow_target vivado
set_part {xcu250-figd2104-2L-e}

# configure synthesis
config_compile -pipeline_loops 64
config_interface -m_axi_latency 300
config_interface -m_axi_alignment_byte_size 64
config_interface -m_axi_max_read_burst_length 256
config_interface -m_axi_max_write_burst_length 256

# set clock period 300MHz
config_schedule -effort medium
create_clock -period 3.33 -name default

# run synthesis
csynth_design

exit