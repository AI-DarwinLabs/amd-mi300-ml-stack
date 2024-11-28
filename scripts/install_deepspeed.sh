#!/bin/bash
set -e

DEEPSPEED_COMMIT="bf03f4835295bccc4765c9ae428c5d3e3ddb04fe"

echo "Installing DeepSpeed..."
pip uninstall deepspeed -y

# Set maximum number of jobs for compilation
export MAX_JOBS="$(nproc)"
# Set architecture for PyTorch
export PYTORCH_ROCM_ARCH="gfx90a;gfx942"

# Clone to a specific commit in a temporary folder
git clone https://github.com/microsoft/DeepSpeed.git tmp_deepspeed
cd tmp_deepspeed
git checkout $DEEPSPEED_COMMIT

# Install with the same options as the original script
pip install --verbose --no-cache-dir --no-build-isolation ./

# Cleanup
cd ..
rm -rf tmp_deepspeed