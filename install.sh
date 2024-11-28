#!/bin/bash

# Function to display messages with consistent formatting
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Function to check if the last command succeeded
check_status() {
    if [ $? -ne 0 ]; then
        log "ERROR: $1"
        exit 1
    fi
}

# Function to check if a file exists
check_file() {
    if [ ! -f "$1" ]; then
        log "ERROR: File $1 does not exist"
        exit 1
    fi
}

# Check required files
log "Checking required files..."
check_file "environment.yml"
check_file "vendor/bitsandbytes/bitsandbytes-0.44.1.dev0-py3-none-manylinux_2_24_x86_64.whl"
check_file "vendor/axolotl/axolotl-0.5.2.zip"

# Check installation scripts
for script in scripts/install_*.sh; do
    check_file "$script"
    chmod +x "$script"
done

# Create and activate Conda environment
log "Creating Conda environment..."
conda env remove -n mi300_env --yes 2>/dev/null || true
conda env create -f environment.yml
check_status "Failed to create Conda environment"

# Activate environment
log "Activating Conda environment..."
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate mi300_env
check_status "Failed to activate Conda environment"

# Install components
log "Installing components..."
export PYTORCH_ROCM_ARCH="gfx90a;gfx942"

# Install PyTorch
./scripts/install_torch.sh
check_status "Failed to install PyTorch"

# Install DeepSpeed
./scripts/install_deepspeed.sh
check_status "Failed to install DeepSpeed"

# Install BitsAndBytes
./scripts/install_bitsandbytes.sh
check_status "Failed to install BitsAndBytes"

# Install Flash-Attention
./scripts/install_flashattention.sh
check_status "Failed to install Flash-Attention"

# Install Axolotl
./scripts/install_axolotl.sh
check_status "Failed to install Axolotl"

log "Installation completed successfully!"
log "To activate the environment: conda activate mi300_env"