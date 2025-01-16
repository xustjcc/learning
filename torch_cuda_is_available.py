#!/usr/bin/python3
# -*- coding: utf-8 -*-

import torch

if __name__ == '__main__':

    if torch.cuda.is_available():
        for i in range(torch.cuda.device_count()):
            print(f"GPU {i}: {torch.cuda.get_device_name(i)}")
            print(f"  Capability: {torch.cuda.get_device_capability(i)}")
            print(f"  Total Memory: {torch.cuda.get_device_properties(i).total_memory / 1e9:.2f} GB")
            print(f" CUDA Version: {torch.version.cuda}")
            print(f"CUDNN Version: {torch.backends.cudnn.version()}")
    else:
        print(f"not found GPU")

