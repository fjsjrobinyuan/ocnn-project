// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XMINKOWSKI_NET_14_LAYER_PIPELINE_H
#define XMINKOWSKI_NET_14_LAYER_PIPELINE_H

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
#include "xminkowski_net_14_layer_pipeline_hw.h"

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
} XMinkowski_net_14_layer_pipeline_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMinkowski_net_14_layer_pipeline;

typedef u32 word_type;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
    u32 word_4;
} XMinkowski_net_14_layer_pipeline_Bitmap_info;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMinkowski_net_14_layer_pipeline_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMinkowski_net_14_layer_pipeline_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMinkowski_net_14_layer_pipeline_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMinkowski_net_14_layer_pipeline_ReadReg(BaseAddress, RegOffset) \
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
int XMinkowski_net_14_layer_pipeline_Initialize(XMinkowski_net_14_layer_pipeline *InstancePtr, UINTPTR BaseAddress);
XMinkowski_net_14_layer_pipeline_Config* XMinkowski_net_14_layer_pipeline_LookupConfig(UINTPTR BaseAddress);
#else
int XMinkowski_net_14_layer_pipeline_Initialize(XMinkowski_net_14_layer_pipeline *InstancePtr, u16 DeviceId);
XMinkowski_net_14_layer_pipeline_Config* XMinkowski_net_14_layer_pipeline_LookupConfig(u16 DeviceId);
#endif
int XMinkowski_net_14_layer_pipeline_CfgInitialize(XMinkowski_net_14_layer_pipeline *InstancePtr, XMinkowski_net_14_layer_pipeline_Config *ConfigPtr);
#else
int XMinkowski_net_14_layer_pipeline_Initialize(XMinkowski_net_14_layer_pipeline *InstancePtr, const char* InstanceName);
int XMinkowski_net_14_layer_pipeline_Release(XMinkowski_net_14_layer_pipeline *InstancePtr);
#endif

void XMinkowski_net_14_layer_pipeline_Start(XMinkowski_net_14_layer_pipeline *InstancePtr);
u32 XMinkowski_net_14_layer_pipeline_IsDone(XMinkowski_net_14_layer_pipeline *InstancePtr);
u32 XMinkowski_net_14_layer_pipeline_IsIdle(XMinkowski_net_14_layer_pipeline *InstancePtr);
u32 XMinkowski_net_14_layer_pipeline_IsReady(XMinkowski_net_14_layer_pipeline *InstancePtr);
void XMinkowski_net_14_layer_pipeline_EnableAutoRestart(XMinkowski_net_14_layer_pipeline *InstancePtr);
void XMinkowski_net_14_layer_pipeline_DisableAutoRestart(XMinkowski_net_14_layer_pipeline *InstancePtr);

void XMinkowski_net_14_layer_pipeline_Set_final_output_full_cubic(XMinkowski_net_14_layer_pipeline *InstancePtr, u64 Data);
u64 XMinkowski_net_14_layer_pipeline_Get_final_output_full_cubic(XMinkowski_net_14_layer_pipeline *InstancePtr);
void XMinkowski_net_14_layer_pipeline_Set_pruned_feature_dram_read(XMinkowski_net_14_layer_pipeline *InstancePtr, u64 Data);
u64 XMinkowski_net_14_layer_pipeline_Get_pruned_feature_dram_read(XMinkowski_net_14_layer_pipeline *InstancePtr);
void XMinkowski_net_14_layer_pipeline_Set_pruned_feature_dram_write(XMinkowski_net_14_layer_pipeline *InstancePtr, u64 Data);
u64 XMinkowski_net_14_layer_pipeline_Get_pruned_feature_dram_write(XMinkowski_net_14_layer_pipeline *InstancePtr);
XMinkowski_net_14_layer_pipeline_Bitmap_info XMinkowski_net_14_layer_pipeline_Get_bitmap_info(XMinkowski_net_14_layer_pipeline *InstancePtr);
u32 XMinkowski_net_14_layer_pipeline_Get_bitmap_info_vld(XMinkowski_net_14_layer_pipeline *InstancePtr);
u32 XMinkowski_net_14_layer_pipeline_Get_total_processed_voxels(XMinkowski_net_14_layer_pipeline *InstancePtr);
u32 XMinkowski_net_14_layer_pipeline_Get_total_processed_voxels_vld(XMinkowski_net_14_layer_pipeline *InstancePtr);

void XMinkowski_net_14_layer_pipeline_InterruptGlobalEnable(XMinkowski_net_14_layer_pipeline *InstancePtr);
void XMinkowski_net_14_layer_pipeline_InterruptGlobalDisable(XMinkowski_net_14_layer_pipeline *InstancePtr);
void XMinkowski_net_14_layer_pipeline_InterruptEnable(XMinkowski_net_14_layer_pipeline *InstancePtr, u32 Mask);
void XMinkowski_net_14_layer_pipeline_InterruptDisable(XMinkowski_net_14_layer_pipeline *InstancePtr, u32 Mask);
void XMinkowski_net_14_layer_pipeline_InterruptClear(XMinkowski_net_14_layer_pipeline *InstancePtr, u32 Mask);
u32 XMinkowski_net_14_layer_pipeline_InterruptGetEnabled(XMinkowski_net_14_layer_pipeline *InstancePtr);
u32 XMinkowski_net_14_layer_pipeline_InterruptGetStatus(XMinkowski_net_14_layer_pipeline *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
