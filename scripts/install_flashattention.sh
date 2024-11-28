#!/bin/bash
set -e

echo "Installing Flash-Attention..."
git clone --recursive https://github.com/ROCm/flash-attention.git
cd flash-attention
export MAX_JOBS=$(($(nproc) - 1))
export PYTORCH_ROCM_ARCH="gfx90a;gfx942"
pip install -v .