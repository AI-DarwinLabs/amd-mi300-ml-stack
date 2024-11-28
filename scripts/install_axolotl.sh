#!/bin/bash
set -e

echo "Installing Axolotl..."
cd vendor/axolotl/
pip install -e .
