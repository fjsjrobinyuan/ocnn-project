#!/usr/bin/tclsh

# Create new project
open_project multi_layer_ocnn -reset

# Add source files
add_files complete_pipeline.cpp
add_files systolic_array.cpp  
add_files dynamic_access.cpp
add_files morton_reorder_buffer.cpp
add_files streaming_bitmap_constructor.cpp
# Excluded utils/morton-encoder.cpp (has its own main function)

# Add testbench
add_files -tb hls_testbench.cpp

# Set top function
set_top multi_layer_streaming_pipeline

# Create solution
open_solution "solution1" -reset

# Set target device (adjust as needed)
# set_part {xczu9eg-ffvb1156-2-e}
set_part {xcu250-figd2104-2L-e}

# Set clock period (10ns = 100MHz)
create_clock -period 3.33

# Run C simulation
csim_design

# Run synthesis
csynth_design

# Run C/RTL co-simulation (optional - takes longer)
# cosim_design

# Export RTL (optional)
# export_design -rtl verilog

exit
