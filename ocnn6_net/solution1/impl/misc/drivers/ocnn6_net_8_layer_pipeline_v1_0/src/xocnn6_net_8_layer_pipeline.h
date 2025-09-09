// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XOCNN6_NET_8_LAYER_PIPELINE_H
#define XOCNN6_NET_8_LAYER_PIPELINE_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xocnn6_net_8_layer_pipeline_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XOcnn6_net_8_layer_pipeline_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XOcnn6_net_8_layer_pipeline;

typedef u32 word_type;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
    u32 word_4;
} XOcnn6_net_8_layer_pipeline_Bitmap_info;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XOcnn6_net_8_layer_pipeline_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XOcnn6_net_8_layer_pipeline_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XOcnn6_net_8_layer_pipeline_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XOcnn6_net_8_layer_pipeline_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XOcnn6_net_8_layer_pipeline_Initialize(XOcnn6_net_8_layer_pipeline *InstancePtr, UINTPTR BaseAddress);
XOcnn6_net_8_layer_pipeline_Config* XOcnn6_net_8_layer_pipeline_LookupConfig(UINTPTR BaseAddress);
#else
int XOcnn6_net_8_layer_pipeline_Initialize(XOcnn6_net_8_layer_pipeline *InstancePtr, u16 DeviceId);
XOcnn6_net_8_layer_pipeline_Config* XOcnn6_net_8_layer_pipeline_LookupConfig(u16 DeviceId);
#endif
int XOcnn6_net_8_layer_pipeline_CfgInitialize(XOcnn6_net_8_layer_pipeline *InstancePtr, XOcnn6_net_8_layer_pipeline_Config *ConfigPtr);
#else
int XOcnn6_net_8_layer_pipeline_Initialize(XOcnn6_net_8_layer_pipeline *InstancePtr, const char* InstanceName);
int XOcnn6_net_8_layer_pipeline_Release(XOcnn6_net_8_layer_pipeline *InstancePtr);
#endif

void XOcnn6_net_8_layer_pipeline_Start(XOcnn6_net_8_layer_pipeline *InstancePtr);
u32 XOcnn6_net_8_layer_pipeline_IsDone(XOcnn6_net_8_layer_pipeline *InstancePtr);
u32 XOcnn6_net_8_layer_pipeline_IsIdle(XOcnn6_net_8_layer_pipeline *InstancePtr);
u32 XOcnn6_net_8_layer_pipeline_IsReady(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_EnableAutoRestart(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_DisableAutoRestart(XOcnn6_net_8_layer_pipeline *InstancePtr);

void XOcnn6_net_8_layer_pipeline_Set_final_output_full_cubic(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_final_output_full_cubic(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv1_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv1_weights(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv2_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv2_weights(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv3_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv3_weights(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv4_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv4_weights(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv5_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv5_weights(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv6_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv6_weights(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_fc1_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_fc1_weights(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_fc2_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_fc2_weights(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv1_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv1_bias(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv2_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv2_bias(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv3_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv3_bias(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv4_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv4_bias(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv5_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv5_bias(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_conv6_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_conv6_bias(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_fc1_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_fc1_bias(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_fc2_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_fc2_bias(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_pruned_feature_dram_read(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_pruned_feature_dram_read(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_Set_pruned_feature_dram_write(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data);
u64 XOcnn6_net_8_layer_pipeline_Get_pruned_feature_dram_write(XOcnn6_net_8_layer_pipeline *InstancePtr);
XOcnn6_net_8_layer_pipeline_Bitmap_info XOcnn6_net_8_layer_pipeline_Get_bitmap_info(XOcnn6_net_8_layer_pipeline *InstancePtr);
u32 XOcnn6_net_8_layer_pipeline_Get_bitmap_info_vld(XOcnn6_net_8_layer_pipeline *InstancePtr);
u32 XOcnn6_net_8_layer_pipeline_Get_total_processed_voxels(XOcnn6_net_8_layer_pipeline *InstancePtr);
u32 XOcnn6_net_8_layer_pipeline_Get_total_processed_voxels_vld(XOcnn6_net_8_layer_pipeline *InstancePtr);

void XOcnn6_net_8_layer_pipeline_InterruptGlobalEnable(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_InterruptGlobalDisable(XOcnn6_net_8_layer_pipeline *InstancePtr);
void XOcnn6_net_8_layer_pipeline_InterruptEnable(XOcnn6_net_8_layer_pipeline *InstancePtr, u32 Mask);
void XOcnn6_net_8_layer_pipeline_InterruptDisable(XOcnn6_net_8_layer_pipeline *InstancePtr, u32 Mask);
void XOcnn6_net_8_layer_pipeline_InterruptClear(XOcnn6_net_8_layer_pipeline *InstancePtr, u32 Mask);
u32 XOcnn6_net_8_layer_pipeline_InterruptGetEnabled(XOcnn6_net_8_layer_pipeline *InstancePtr);
u32 XOcnn6_net_8_layer_pipeline_InterruptGetStatus(XOcnn6_net_8_layer_pipeline *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
