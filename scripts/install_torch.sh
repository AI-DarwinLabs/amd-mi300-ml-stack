#!/bin/bash
set -e

echo "Installing PyTorch ROCm..."
pip install torch==2.5.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/test/rocm6.2/
