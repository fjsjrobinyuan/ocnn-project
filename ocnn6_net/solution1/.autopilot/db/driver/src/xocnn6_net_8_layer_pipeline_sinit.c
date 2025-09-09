// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xocnn6_net_8_layer_pipeline.h"

extern XOcnn6_net_8_layer_pipeline_Config XOcnn6_net_8_layer_pipeline_ConfigTable[];

#ifdef SDT
XOcnn6_net_8_layer_pipeline_Config *XOcnn6_net_8_layer_pipeline_LookupConfig(UINTPTR BaseAddress) {
	XOcnn6_net_8_layer_pipeline_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XOcnn6_net_8_layer_pipeline_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XOcnn6_net_8_layer_pipeline_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XOcnn6_net_8_layer_pipeline_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XOcnn6_net_8_layer_pipeline_Initialize(XOcnn6_net_8_layer_pipeline *InstancePtr, UINTPTR BaseAddress) {
	XOcnn6_net_8_layer_pipeline_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XOcnn6_net_8_layer_pipeline_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XOcnn6_net_8_layer_pipeline_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XOcnn6_net_8_layer_pipeline_Config *XOcnn6_net_8_layer_pipeline_LookupConfig(u16 DeviceId) {
	XOcnn6_net_8_layer_pipeline_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XOCNN6_NET_8_LAYER_PIPELINE_NUM_INSTANCES; Index++) {
		if (XOcnn6_net_8_layer_pipeline_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XOcnn6_net_8_layer_pipeline_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XOcnn6_net_8_layer_pipeline_Initialize(XOcnn6_net_8_layer_pipeline *InstancePtr, u16 DeviceId) {
	XOcnn6_net_8_layer_pipeline_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XOcnn6_net_8_layer_pipeline_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XOcnn6_net_8_layer_pipeline_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

