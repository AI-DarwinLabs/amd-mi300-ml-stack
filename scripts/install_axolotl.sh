#!/bin/bash
set -e

echo "Installing Axolotl..."
cd vendor/axolotl/
unzip -o axolotl-0.5.2.zip
cd axolotl-0.5.2
pip install -e .
