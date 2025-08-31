# this is full minkowskinet with 14 layers.

import torch
import torch.nn as nn
import torch.nn.functional as F

class MinkowskiNet(nn.Module):
    # input to the model is 64x64x64 voxels, 3 channels
    def __init__(self, in_channels=3, num_classes=20):
        super(MinkowskiNet, self).__init__()
        
        # layer 1
        self.conv1 = nn.Conv3d(in_channels, 16, kernel_size=3, stride=1, padding=1)
        self.bn1 = nn.BatchNorm3d(16)
        # layer 1 input is 64x64x64 voxels, 3 channels  
        # layer 1 output is same size 64x64x64, but with 16 channels
        
        # layer 2  
        self.conv2 = nn.Conv3d(16, 32, kernel_size=3, stride=2, padding=1)
        self.bn2 = nn.BatchNorm3d(32)
        # layer 2 input is 64x64x64, 16 channels
        # layer 2 output is 32x32x32, because of stride=2
        # 32 channels for each voxel
        
        # layer 3
        self.conv3 = nn.Conv3d(32, 64, kernel_size=3, stride=2, padding=1) 
        self.bn3 = nn.BatchNorm3d(64)
        # layer 3 input is 32x32x32, 32 channels
        # layer 3 output is 16x16x16, because of stride=2
        # 64 channels for each voxel
        
        # layer 4
        self.conv4 = nn.Conv3d(64, 128, kernel_size=3, stride=2, padding=1)
        self.bn4 = nn.BatchNorm3d(128)  
        # layer 4 input is 16x16x16, 64 channels
        # layer 4 output is 8x8x8, because of stride=2
        # 128 channels for each voxel
        
        # layer 5
        self.conv5 = nn.Conv3d(128, 256, kernel_size=3, stride=2, padding=1)
        self.bn5 = nn.BatchNorm3d(256)
        # layer 5 input is 8x8x8, 128 channels  
        # layer 5 output is 4x4x4, because of stride=2
        # 256 channels for each voxel
        
        # layer 6
        self.conv6 = nn.Conv3d(256, 512, kernel_size=3, stride=2, padding=1)
        self.bn6 = nn.BatchNorm3d(512)
        # layer 6 input is 4x4x4, 256 channels
        # layer 6 output is 2x2x2, because of stride=2  
        # 512 channels for each voxel
        
        # layer 7 - bottleneck layer
        self.conv7 = nn.Conv3d(512, 1024, kernel_size=3, stride=2, padding=1)
        self.bn7 = nn.BatchNorm3d(1024)
        # layer 7 input is 2x2x2, 512 channels
        # layer 7 output is 1x1x1, because of stride=2
        # 1024 channels for the single voxel - this is the feature bottleneck
        
        # layer 8 - start upsampling  
        self.deconv8 = nn.ConvTranspose3d(1024, 512, kernel_size=3, stride=2, padding=1, output_padding=1)
        self.bn8 = nn.BatchNorm3d(512)
        # layer 8 input is 1x1x1, 1024 channels
        # layer 8 output is 2x2x2, because ConvTranspose3d with stride=2 doubles size
        # 512 channels for each voxel
        
        # layer 9
        self.deconv9 = nn.ConvTranspose3d(512, 256, kernel_size=3, stride=2, padding=1, output_padding=1)  
        self.bn9 = nn.BatchNorm3d(256)
        # layer 9 input is 2x2x2, 512 channels
        # layer 9 output is 4x4x4, because ConvTranspose3d with stride=2 doubles size
        # 256 channels for each voxel
        
        # layer 10
        self.deconv10 = nn.ConvTranspose3d(256, 128, kernel_size=3, stride=2, padding=1, output_padding=1)
        self.bn10 = nn.BatchNorm3d(128) 
        # layer 10 input is 4x4x4, 256 channels
        # layer 10 output is 8x8x8, because ConvTranspose3d with stride=2 doubles size
        # 128 channels for each voxel
        
        # layer 11  
        self.deconv11 = nn.ConvTranspose3d(128, 64, kernel_size=3, stride=2, padding=1, output_padding=1)
        self.bn11 = nn.BatchNorm3d(64)
        # layer 11 input is 8x8x8, 128 channels  
        # layer 11 output is 16x16x16, because ConvTranspose3d with stride=2 doubles size
        # 64 channels for each voxel
        
        # layer 12
        self.deconv12 = nn.ConvTranspose3d(64, 32, kernel_size=3, stride=2, padding=1, output_padding=1)
        self.bn12 = nn.BatchNorm3d(32)
        # layer 12 input is 16x16x16, 64 channels
        # layer 12 output is 32x32x32, because ConvTranspose3d with stride=2 doubles size  
        # 32 channels for each voxel
        
        # layer 13
        self.deconv13 = nn.ConvTranspose3d(32, 16, kernel_size=3, stride=2, padding=1, output_padding=1)
        self.bn13 = nn.BatchNorm3d(16)
        # layer 13 input is 32x32x32, 32 channels
        # layer 13 output is 64x64x64, because ConvTranspose3d with stride=2 doubles size
        # 16 channels for each voxel - back to original spatial size
        
        # layer 14 - final output layer
        self.final_conv = nn.Conv3d(16, num_classes, kernel_size=3, stride=1, padding=1)
        # layer 14 input is 64x64x64, 16 channels  
        # layer 14 output is 64x64x64, num_classes channels
        # num_classes = number of object categories (e.g. 20 for chair, table, etc.)
        
    def forward(self, x):
        # x input shape: [batch_size, 3, 64, 64, 64]
        
        # encoder - downsampling path
        x = F.relu(self.bn1(self.conv1(x)))  # [batch_size, 16, 64, 64, 64]
        x = F.relu(self.bn2(self.conv2(x)))  # [batch_size, 32, 32, 32, 32] 
        x = F.relu(self.bn3(self.conv3(x)))  # [batch_size, 64, 16, 16, 16]
        x = F.relu(self.bn4(self.conv4(x)))  # [batch_size, 128, 8, 8, 8]
        x = F.relu(self.bn5(self.conv5(x)))  # [batch_size, 256, 4, 4, 4]
        x = F.relu(self.bn6(self.conv6(x)))  # [batch_size, 512, 2, 2, 2]  
        x = F.relu(self.bn7(self.conv7(x)))  # [batch_size, 1024, 1, 1, 1]
        
        # decoder - upsampling path
        x = F.relu(self.bn8(self.deconv8(x)))   # [batch_size, 512, 2, 2, 2]
        x = F.relu(self.bn9(self.deconv9(x)))   # [batch_size, 256, 4, 4, 4]
        x = F.relu(self.bn10(self.deconv10(x))) # [batch_size, 128, 8, 8, 8]
        x = F.relu(self.bn11(self.deconv11(x))) # [batch_size, 64, 16, 16, 16]
        x = F.relu(self.bn12(self.deconv12(x))) # [batch_size, 32, 32, 32, 32]
        x = F.relu(self.bn13(self.deconv13(x))) # [batch_size, 16, 64, 64, 64]
        
        # final prediction - no relu, raw scores
        x = self.final_conv(x)  # [batch_size, num_classes, 64, 64, 64]
        
        return x

class SimpleMinkowskiNet(nn.Module):
    # simplified version with only 4 layers for FPGA
    def __init__(self, in_channels=3, num_classes=20):
        super(SimpleMinkowskiNet, self).__init__()
        
        # layer 1
        self.conv1 = nn.Conv3d(in_channels, 32, kernel_size=3, stride=1, padding=1)
        # layer 1 input is 64x64x64, 3 channels
        # layer 1 output is 64x64x64, 32 channels
        
        # layer 2  
        self.conv2 = nn.Conv3d(32, 64, kernel_size=3, stride=2, padding=1)
        # layer 2 input is 64x64x64, 32 channels
        # layer 2 output is 32x32x32, 64 channels
        
        # layer 3
        self.conv3 = nn.Conv3d(64, 128, kernel_size=3, stride=2, padding=1) 
        # layer 3 input is 32x32x32, 64 channels
        # layer 3 output is 16x16x16, 128 channels
        
        # layer 4 - final output
        self.conv4 = nn.Conv3d(128, num_classes, kernel_size=3, stride=1, padding=1)
        # layer 4 input is 16x16x16, 128 channels  
        # layer 4 output is 16x16x16, num_classes channels
        
    def forward(self, x):
        # x input shape: [batch_size, 3, 64, 64, 64]
        x = F.relu(self.conv1(x))  # [batch_size, 32, 64, 64, 64]
        x = F.relu(self.conv2(x))  # [batch_size, 64, 32, 32, 32] 
        x = F.relu(self.conv3(x))  # [batch_size, 128, 16, 16, 16]
        x = self.conv4(x)          # [batch_size, num_classes, 16, 16, 16]
        return x

# test the models
if __name__ == "__main__":
    # create fake input data
    input_data = torch.randn(1, 3, 64, 64, 64)  # batch=1, channels=3, size=64x64x64
    
    # test full model
    full_model = MinkowskiNet(in_channels=3, num_classes=20)
    output_full = full_model(input_data)
    print(f"Full model output shape: {output_full.shape}")
    
    # test simple model  
    simple_model = SimpleMinkowskiNet(in_channels=3, num_classes=20)
    output_simple = simple_model(input_data)
    print(f"Simple model output shape: {output_simple.shape}")
