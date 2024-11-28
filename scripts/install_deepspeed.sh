#!/bin/bash
set -e

DEEPSPEED_COMMIT="bf03f4835295bccc4765c9ae428c5d3e3ddb04fe"

echo "Installing DeepSpeed..."
pip uninstall deepspeed -y

# Définir le nombre max de jobs pour la compilation
export MAX_JOBS="$(nproc)"

# Cloner à un commit spécifique dans un dossier temporaire
git clone https://github.com/microsoft/DeepSpeed.git tmp_deepspeed
cd tmp_deepspeed
git checkout $DEEPSPEED_COMMIT

# Installation avec les mêmes options que votre script original
pip install --verbose --no-cache-dir --no-build-isolation ./

# Nettoyage
cd ..
rm -rf tmp_deepspeed