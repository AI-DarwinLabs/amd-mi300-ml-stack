#!/bin/bash
set -e

echo "Installing Flash-Attention..."
git clone --recursive https://github.com/ROCm/flash-attention.git
cd flash-attention
export MAX_JOBS=$(($(nproc) - 1))
GPU_ARCHS=gfx942 python setup.py install