# AMD MI300 ML Stack

This repository provides a comprehensive setup for machine learning environments on AMD MI300 GPUs. It includes automated deployment scripts and configurations for popular ML frameworks optimized for AMD MI300 architecture.

## Prerequisites

- AMD MI300 GPU
- ROCm 6.2 or later
- Python 3.10.11
- Conda package manager

## Quick Start

1. Clone the repository:
```bash
git clone https://github.com/AI-DarwinLabs/amd-mi300-ml-stack.git
cd amd-mi300-ml-stack
```

2. Run the installation script:
```bash
bash install.sh
```

## Environment Setup

The installation script will create a conda environment with Python 3.10.11 and install the following optimized packages:

- DeepSpeed 0.15.4 (custom build)
- Bitsandbytes 0.44.1 (optimized for AMD)
- PyTorch ROCm 2.5.0
- Flash Attention (ROCm version)
- Axolotl 0.5.2 (modified for MI300)

## HPC/Slurm Configuration

When running on HPC systems with Slurm, add these environment variables to your job scripts:

```bash
# Device Visibility
export CUDA_VISIBLE_DEVICES=0,1,2,3
export TORCH_CUDA_ARCH_LIST="9.0"
export HIP_VISIBLE_DEVICES=0,1,2,3
export ROCR_VISIBLE_DEVICES=0,1,2,3

# RCCL Optimizations
export RCCL_ENABLE_DIRECT=1
export RCCL_ENABLE_NUMA_BINDING=1
export RCCL_ENABLE_SYNC_MEMOPS=1
export RCCL_TRANSPORT=SHM
export RCCL_DEBUG=INFO
```

## Repository Structure

```
.
├── install.sh              # Main installation script
├── environment.yml         # Conda environment specification
├── scripts/               # Installation scripts for individual components
│   ├── install_deepspeed.sh
│   ├── install_bitsandbytes.sh
│   ├── install_torch.sh
│   ├── install_flash_attention.sh
│   └── install_axolotl.sh
└── vendor/                # Third-party packages and modifications
    ├── DeepSpeed-0.15.4.tar.gz
    ├── axolotl/
    └── flash-attention/
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.