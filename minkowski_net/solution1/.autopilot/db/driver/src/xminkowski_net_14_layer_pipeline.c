// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xminkowski_net_14_layer_pipeline.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMinkowski_net_14_layer_pipeline_CfgInitialize(XMinkowski_net_14_layer_pipeline *InstancePtr, XMinkowski_net_14_layer_pipeline_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMinkowski_net_14_layer_pipeline_Start(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMinkowski_net_14_layer_pipeline_IsDone(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMinkowski_net_14_layer_pipeline_IsIdle(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMinkowski_net_14_layer_pipeline_IsReady(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMinkowski_net_14_layer_pipeline_EnableAutoRestart(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XMinkowski_net_14_layer_pipeline_DisableAutoRestart(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL, 0);
}

void XMinkowski_net_14_layer_pipeline_Set_final_output_full_cubic(XMinkowski_net_14_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA, (u32)(Data));
    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA + 4, (u32)(Data >> 32));
}

u64 XMinkowski_net_14_layer_pipeline_Get_final_output_full_cubic(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA);
    Data += (u64)XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA + 4) << 32;
    return Data;
}

void XMinkowski_net_14_layer_pipeline_Set_pruned_feature_dram_read(XMinkowski_net_14_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA, (u32)(Data));
    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA + 4, (u32)(Data >> 32));
}

u64 XMinkowski_net_14_layer_pipeline_Get_pruned_feature_dram_read(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA);
    Data += (u64)XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA + 4) << 32;
    return Data;
}

void XMinkowski_net_14_layer_pipeline_Set_pruned_feature_dram_write(XMinkowski_net_14_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA, (u32)(Data));
    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA + 4, (u32)(Data >> 32));
}

u64 XMinkowski_net_14_layer_pipeline_Get_pruned_feature_dram_write(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA);
    Data += (u64)XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA + 4) << 32;
    return Data;
}

XMinkowski_net_14_layer_pipeline_Bitmap_info XMinkowski_net_14_layer_pipeline_Get_bitmap_info(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    XMinkowski_net_14_layer_pipeline_Bitmap_info Data;

    Data.word_0 = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 0);
    Data.word_1 = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 4);
    Data.word_2 = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 8);
    Data.word_3 = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 12);
    Data.word_4 = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 16);
    return Data;
}

u32 XMinkowski_net_14_layer_pipeline_Get_bitmap_info_vld(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_CTRL);
    return Data & 0x1;
}

u32 XMinkowski_net_14_layer_pipeline_Get_total_processed_voxels(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_TOTAL_PROCESSED_VOXELS_DATA);
    return Data;
}

u32 XMinkowski_net_14_layer_pipeline_Get_total_processed_voxels_vld(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_TOTAL_PROCESSED_VOXELS_CTRL);
    return Data & 0x1;
}

void XMinkowski_net_14_layer_pipeline_InterruptGlobalEnable(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_GIE, 1);
}

void XMinkowski_net_14_layer_pipeline_InterruptGlobalDisable(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_GIE, 0);
}

void XMinkowski_net_14_layer_pipeline_InterruptEnable(XMinkowski_net_14_layer_pipeline *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_IER);
    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_IER, Register | Mask);
}

void XMinkowski_net_14_layer_pipeline_InterruptDisable(XMinkowski_net_14_layer_pipeline *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_IER);
    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_IER, Register & (~Mask));
}

void XMinkowski_net_14_layer_pipeline_InterruptClear(XMinkowski_net_14_layer_pipeline *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMinkowski_net_14_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_ISR, Mask);
}

u32 XMinkowski_net_14_layer_pipeline_InterruptGetEnabled(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_IER);
}

u32 XMinkowski_net_14_layer_pipeline_InterruptGetStatus(XMinkowski_net_14_layer_pipeline *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMinkowski_net_14_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XMINKOWSKI_NET_14_LAYER_PIPELINE_CONTROL_ADDR_ISR);
}

