// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of final_output_full_cubic
//        bit 31~0 - final_output_full_cubic[31:0] (Read/Write)
// 0x14 : Data signal of final_output_full_cubic
//        bit 31~0 - final_output_full_cubic[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of pruned_feature_dram_read
//        bit 31~0 - pruned_feature_dram_read[31:0] (Read/Write)
// 0x20 : Data signal of pruned_feature_dram_read
//        bit 31~0 - pruned_feature_dram_read[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of pruned_feature_dram_write
//        bit 31~0 - pruned_feature_dram_write[31:0] (Read/Write)
// 0x2c : Data signal of pruned_feature_dram_write
//        bit 31~0 - pruned_feature_dram_write[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of bitmap_info
//        bit 31~0 - bitmap_info[31:0] (Read)
// 0x38 : Data signal of bitmap_info
//        bit 31~0 - bitmap_info[63:32] (Read)
// 0x3c : Data signal of bitmap_info
//        bit 31~0 - bitmap_info[95:64] (Read)
// 0x40 : Data signal of bitmap_info
//        bit 31~0 - bitmap_info[127:96] (Read)
// 0x44 : Data signal of bitmap_info
//        bit 31~0 - bitmap_info[159:128] (Read)
// 0x48 : Control signal of bitmap_info
//        bit 0  - bitmap_info_ap_vld (Read/COR)
//        others - reserved
// 0x64 : Data signal of total_processed_voxels
//        bit 31~0 - total_processed_voxels[31:0] (Read)
// 0x68 : Control signal of total_processed_voxels
//        bit 0  - total_processed_voxels_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL                        0x00
#define CONTROL_ADDR_GIE                            0x04
#define CONTROL_ADDR_IER                            0x08
#define CONTROL_ADDR_ISR                            0x0c
#define CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA   0x10
#define CONTROL_BITS_FINAL_OUTPUT_FULL_CUBIC_DATA   64
#define CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA  0x1c
#define CONTROL_BITS_PRUNED_FEATURE_DRAM_READ_DATA  64
#define CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA 0x28
#define CONTROL_BITS_PRUNED_FEATURE_DRAM_WRITE_DATA 64
#define CONTROL_ADDR_BITMAP_INFO_DATA               0x34
#define CONTROL_BITS_BITMAP_INFO_DATA               160
#define CONTROL_ADDR_BITMAP_INFO_CTRL               0x48
#define CONTROL_ADDR_TOTAL_PROCESSED_VOXELS_DATA    0x64
#define CONTROL_BITS_TOTAL_PROCESSED_VOXELS_DATA    32
#define CONTROL_ADDR_TOTAL_PROCESSED_VOXELS_CTRL    0x68
