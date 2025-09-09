// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xocnn6_net_8_layer_pipeline.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XOcnn6_net_8_layer_pipeline_CfgInitialize(XOcnn6_net_8_layer_pipeline *InstancePtr, XOcnn6_net_8_layer_pipeline_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XOcnn6_net_8_layer_pipeline_Start(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL) & 0x80;
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XOcnn6_net_8_layer_pipeline_IsDone(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XOcnn6_net_8_layer_pipeline_IsIdle(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XOcnn6_net_8_layer_pipeline_IsReady(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XOcnn6_net_8_layer_pipeline_EnableAutoRestart(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XOcnn6_net_8_layer_pipeline_DisableAutoRestart(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_AP_CTRL, 0);
}

void XOcnn6_net_8_layer_pipeline_Set_final_output_full_cubic(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_final_output_full_cubic(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FINAL_OUTPUT_FULL_CUBIC_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv1_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV1_WEIGHTS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV1_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv1_weights(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV1_WEIGHTS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV1_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv2_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV2_WEIGHTS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV2_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv2_weights(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV2_WEIGHTS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV2_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv3_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV3_WEIGHTS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV3_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv3_weights(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV3_WEIGHTS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV3_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv4_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV4_WEIGHTS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV4_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv4_weights(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV4_WEIGHTS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV4_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv5_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV5_WEIGHTS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV5_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv5_weights(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV5_WEIGHTS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV5_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv6_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV6_WEIGHTS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV6_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv6_weights(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV6_WEIGHTS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV6_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_fc1_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC1_WEIGHTS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC1_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_fc1_weights(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC1_WEIGHTS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC1_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_fc2_weights(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC2_WEIGHTS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC2_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_fc2_weights(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC2_WEIGHTS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC2_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv1_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV1_BIAS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV1_BIAS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv1_bias(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV1_BIAS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV1_BIAS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv2_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV2_BIAS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV2_BIAS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv2_bias(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV2_BIAS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV2_BIAS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv3_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV3_BIAS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV3_BIAS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv3_bias(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV3_BIAS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV3_BIAS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv4_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV4_BIAS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV4_BIAS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv4_bias(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV4_BIAS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV4_BIAS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv5_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV5_BIAS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV5_BIAS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv5_bias(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV5_BIAS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV5_BIAS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_conv6_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV6_BIAS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV6_BIAS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_conv6_bias(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV6_BIAS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_CONV6_BIAS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_fc1_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC1_BIAS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC1_BIAS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_fc1_bias(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC1_BIAS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC1_BIAS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_fc2_bias(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC2_BIAS_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC2_BIAS_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_fc2_bias(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC2_BIAS_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_FC2_BIAS_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_pruned_feature_dram_read(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_pruned_feature_dram_read(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_READ_DATA + 4) << 32;
    return Data;
}

void XOcnn6_net_8_layer_pipeline_Set_pruned_feature_dram_write(XOcnn6_net_8_layer_pipeline *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA, (u32)(Data));
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA + 4, (u32)(Data >> 32));
}

u64 XOcnn6_net_8_layer_pipeline_Get_pruned_feature_dram_write(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA);
    Data += (u64)XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_PRUNED_FEATURE_DRAM_WRITE_DATA + 4) << 32;
    return Data;
}

XOcnn6_net_8_layer_pipeline_Bitmap_info XOcnn6_net_8_layer_pipeline_Get_bitmap_info(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    XOcnn6_net_8_layer_pipeline_Bitmap_info Data;

    Data.word_0 = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 0);
    Data.word_1 = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 4);
    Data.word_2 = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 8);
    Data.word_3 = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 12);
    Data.word_4 = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_DATA + 16);
    return Data;
}

u32 XOcnn6_net_8_layer_pipeline_Get_bitmap_info_vld(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_BITMAP_INFO_CTRL);
    return Data & 0x1;
}

u32 XOcnn6_net_8_layer_pipeline_Get_total_processed_voxels(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_TOTAL_PROCESSED_VOXELS_DATA);
    return Data;
}

u32 XOcnn6_net_8_layer_pipeline_Get_total_processed_voxels_vld(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_TOTAL_PROCESSED_VOXELS_CTRL);
    return Data & 0x1;
}

void XOcnn6_net_8_layer_pipeline_InterruptGlobalEnable(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_GIE, 1);
}

void XOcnn6_net_8_layer_pipeline_InterruptGlobalDisable(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_GIE, 0);
}

void XOcnn6_net_8_layer_pipeline_InterruptEnable(XOcnn6_net_8_layer_pipeline *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_IER);
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_IER, Register | Mask);
}

void XOcnn6_net_8_layer_pipeline_InterruptDisable(XOcnn6_net_8_layer_pipeline *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_IER);
    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_IER, Register & (~Mask));
}

void XOcnn6_net_8_layer_pipeline_InterruptClear(XOcnn6_net_8_layer_pipeline *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOcnn6_net_8_layer_pipeline_WriteReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_ISR, Mask);
}

u32 XOcnn6_net_8_layer_pipeline_InterruptGetEnabled(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_IER);
}

u32 XOcnn6_net_8_layer_pipeline_InterruptGetStatus(XOcnn6_net_8_layer_pipeline *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XOcnn6_net_8_layer_pipeline_ReadReg(InstancePtr->Control_BaseAddress, XOCNN6_NET_8_LAYER_PIPELINE_CONTROL_ADDR_ISR);
}

