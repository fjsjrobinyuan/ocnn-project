// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         bit 9  - interrupt (Read)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         bit 1 - enable ap_ready interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (Read/TOW)
//         bit 1 - ap_ready (Read/TOW)
//         others - reserved
// 0x010 : Data signal of final_output_full_cubic
//         bit 31~0 - final_output_full_cubic[31:0] (Read/Write)
// 0x014 : Data signal of final_output_full_cubic
//         bit 31~0 - final_output_full_cubic[63:32] (Read/Write)
// 0x018 : reserved
// 0x01c : Data signal of conv1_weights
//         bit 31~0 - conv1_weights[31:0] (Read/Write)
// 0x020 : Data signal of conv1_weights
//         bit 31~0 - conv1_weights[63:32] (Read/Write)
// 0x024 : reserved
// 0x028 : Data signal of conv2_weights
//         bit 31~0 - conv2_weights[31:0] (Read/Write)
// 0x02c : Data signal of conv2_weights
//         bit 31~0 - conv2_weights[63:32] (Read/Write)
// 0x030 : reserved
// 0x034 : Data signal of conv3_weights
//         bit 31~0 - conv3_weights[31:0] (Read/Write)
// 0x038 : Data signal of conv3_weights
//         bit 31~0 - conv3_weights[63:32] (Read/Write)
// 0x03c : reserved
// 0x040 : Data signal of conv4_weights
//         bit 31~0 - conv4_weights[31:0] (Read/Write)
// 0x044 : Data signal of conv4_weights
//         bit 31~0 - conv4_weights[63:32] (Read/Write)
// 0x048 : reserved
// 0x04c : Data signal of conv5_weights
//         bit 31~0 - conv5_weights[31:0] (Read/Write)
// 0x050 : Data signal of conv5_weights
//         bit 31~0 - conv5_weights[63:32] (Read/Write)
// 0x054 : reserved
// 0x058 : Data signal of conv6_weights
//         bit 31~0 - conv6_weights[31:0] (Read/Write)
// 0x05c : Data signal of conv6_weights
//         bit 31~0 - conv6_weights[63:32] (Read/Write)
// 0x060 : reserved
// 0x064 : Data signal of fc1_weights
//         bit 31~0 - fc1_weights[31:0] (Read/Write)
// 0x068 : Data signal of fc1_weights
//         bit 31~0 - fc1_weights[63:32] (Read/Write)
// 0x06c : reserved
// 0x070 : Data signal of fc2_weights
//         bit 31~0 - fc2_weights[31:0] (Read/Write)
// 0x074 : Data signal of fc2_weights
//         bit 31~0 - fc2_weights[63:32] (Read/Write)
// 0x078 : reserved
// 0x07c : Data signal of conv1_bias
//         bit 31~0 - conv1_bias[31:0] (Read/Write)
// 0x080 : Data signal of conv1_bias
//         bit 31~0 - conv1_bias[63:32] (Read/Write)
// 0x084 : reserved
// 0x088 : Data signal of conv2_bias
//         bit 31~0 - conv2_bias[31:0] (Read/Write)
// 0x08c : Data signal of conv2_bias
//         bit 31~0 - conv2_bias[63:32] (Read/Write)
// 0x090 : reserved
// 0x094 : Data signal of conv3_bias
//         bit 31~0 - conv3_bias[31:0] (Read/Write)
// 0x098 : Data signal of conv3_bias
//         bit 31~0 - conv3_bias[63:32] (Read/Write)
// 0x09c : reserved
// 0x0a0 : Data signal of conv4_bias
//         bit 31~0 - conv4_bias[31:0] (Read/Write)
// 0x0a4 : Data signal of conv4_bias
//         bit 31~0 - conv4_bias[63:32] (Read/Write)
// 0x0a8 : reserved
// 0x0ac : Data signal of conv5_bias
//         bit 31~0 - conv5_bias[31:0] (Read/Write)
// 0x0b0 : Data signal of conv5_bias
//         bit 31~0 - conv5_bias[63:32] (Read/Write)
// 0x0b4 : reserved
// 0x0b8 : Data signal of conv6_bias
//         bit 31~0 - conv6_bias[31:0] (Read/Write)
// 0x0bc : Data signal of conv6_bias
//         bit 31~0 - conv6_bias[63:32] (Read/Write)
// 0x0c0 : reserved
// 0x0c4 : Data signal of fc1_bias
//         bit 31~0 - fc1_bias[31:0] (Read/Write)
// 0x0c8 : Data signal of fc1_bias
//         bit 31~0 - fc1_bias[63:32] (Read/Write)
// 0x0cc : reserved
// 0x0d0 : Data signal of fc2_bias
//         bit 31~0 - fc2_bias[31:0] (Read/Write)
// 0x0d4 : Data signal of fc2_bias
//         bit 31~0 - fc2_bias[63:32] (Read/Write)
// 0x0d8 : reserved
// 0x0dc : Data signal of pruned_feature_dram_read
//         bit 31~0 - pruned_feature_dram_read[31:0] (Read/Write)
// 0x0e0 : Data signal of pruned_feature_dram_read
//         bit 31~0 - pruned_feature_dram_read[63:32] (Read/Write)
// 0x0e4 : reserved
// 0x0e8 : Data signal of pruned_feature_dram_write
//         bit 31~0 - pruned_feature_dram_write[31:0] (Read/Write)
// 0x0ec : Data signal of pruned_feature_dram_write
//         bit 31~0 - pruned_feature_dram_write[63:32] (Read/Write)
// 0x0f0 : reserved
// 0x0f4 : Data signal of bitmap_info
//         bit 31~0 - bitmap_info[31:0] (Read)
// 0x0f8 : Data signal of bitmap_info
//         bit 31~0 - bitmap_info[63:32] (Read)
// 0x0fc : Data signal of bitmap_info
//         bit 31~0 - bitmap_info[95:64] (Read)
// 0x100 : Data signal of bitmap_info
//         bit 31~0 - bitmap_info[127:96] (Read)
// 0x104 : Data signal of bitmap_info
//         bit 31~0 - bitmap_info[159:128] (Read)
// 0x108 : Control signal of bitmap_info
//         bit 0  - bitmap_info_ap_vld (Read/COR)
//         others - reserved
// 0x124 : Data signal of total_processed_voxels
//         bit 31~0 - total_processed_voxels[31:0] (Read)
// 0x128 : Control signal of total_processed_voxels
//         bit 0  - total_processed_voxels_ap_vld (Read/COR)
//         others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL                        0x000
#define CONTROL_ADDR_GIE                            0x004
#define CONTROL_ADDR_IER                            0x008
#define CONTROL_ADDR_ISR                            0x00c
#define CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA   0x010
#define CONTROL_BITS_FINAL_OUTPUT_FULL_CUBIC_DATA   64
#define CONTROL_ADDR_CONV1_WEIGHTS_DATA             0x01c
#define CONTROL_BITS_CONV1_WEIGHTS_DATA             64
#define CONTROL_ADDR_CONV2_WEIGHTS_DATA             0x028
#define CONTROL_BITS_CONV2_WEIGHTS_DATA             64
#define CONTROL_ADDR_CONV3_WEIGHTS_DATA             0x034
#define CONTROL_BITS_CONV3_WEIGHTS_DATA             64
#define CONTROL_ADDR_CONV4_WEIGHTS_DATA             0x040
#define CONTROL_BITS_CONV4_WEIGHTS_DATA             64
#define CONTROL_ADDR_CONV5_WEIGHTS_DATA             0x04c
#define CONTROL_BITS_CONV5_WEIGHTS_DATA             64
#define CONTROL_ADDR_CONV6_WEIGHTS_DATA             0x058
#define CONTROL_BITS_CONV6_WEIGHTS_DATA             64
#define CONTROL_ADDR_FC1_WEIGHTS_DATA               0x064
#define CONTROL_BITS_FC1_WEIGHTS_DATA               64
#define CONTROL_ADDR_FC2_WEIGHTS_DATA               0x070
#define CONTROL_BITS_FC2_WEIGHTS_DATA               64
#define CONTROL_ADDR_CONV1_BIAS_DATA                0x07c
#define CONTROL_BITS_CONV1_BIAS_DATA                64
#define CONTROL_ADDR_CONV2_BIAS_DATA                0x088
#define CONTROL_BITS_CONV2_BIAS_DATA                64
#define CONTROL_ADDR_CONV3_BIAS_DATA                0x094
#define CONTROL_BITS_CONV3_BIAS_DATA                64
#define CONTROL_ADDR_CONV4_BIAS_DATA                0x0a0
#define CONTROL_BITS_CONV4_BIAS_DATA                64
#define CONTROL_ADDR_CONV5_BIAS_DATA                0x0ac
#define CONTROL_BITS_CONV5_BIAS_DATA                64
#define CONTROL_ADDR_CONV6_BIAS_DATA                0x0b8
#define CONTROL_BITS_CONV6_BIAS_DATA                64
#define CONTROL_ADDR_FC1_BIAS_DATA                  0x0c4
#define CONTROL_BITS_FC1_BIAS_DATA                  64
#define CONTROL_ADDR_FC2_BIAS_DATA                  0x0d0
#define CONTROL_BITS_FC2_BIAS_DATA                  64
#define CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA  0x0dc
#define CONTROL_BITS_PRUNED_FEATURE_DRAM_READ_DATA  64
#define CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA 0x0e8
#define CONTROL_BITS_PRUNED_FEATURE_DRAM_WRITE_DATA 64
#define CONTROL_ADDR_BITMAP_INFO_DATA               0x0f4
#define CONTROL_BITS_BITMAP_INFO_DATA               160
#define CONTROL_ADDR_BITMAP_INFO_CTRL               0x108
#define CONTROL_ADDR_TOTAL_PROCESSED_VOXELS_DATA    0x124
#define CONTROL_BITS_TOTAL_PROCESSED_VOXELS_DATA    32
#define CONTROL_ADDR_TOTAL_PROCESSED_VOXELS_CTRL    0x128
