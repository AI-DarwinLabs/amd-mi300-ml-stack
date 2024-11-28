#!/bin/bash
set -e

echo "Installing BitsAndBytes..."
wget "https://github.com/bitsandbytes-foundation/bitsandbytes/releases/download/continuous-release_multi-backend-refactor/bitsandbytes-0.44.1.dev0-py3-none-manylinux_2_24_x86_64.whl"
pip install --no-deps vendor/bitsandbytes/bitsandbytes-0.44.1.dev0-py3-none-manylinux_2_24_x86_64.whl