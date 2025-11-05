#!/bin/bash

# Environment Variables for preparing the build environment, building, and packaging.
# run this with: ". mm-environment-variables.sh"

cd $HOME
export MMOJO_SERVER_DIR="$HOME/201-mmojo-server"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"

export MODELS_DIR="$HOME/302-MODELS"
export MODEL_MAP="$MODELS_DIR/model-map.txt"
export BUILD_COSMOPOLITAN_DIR="$HOME/304-BUILD-cosmopolitan"
export COSMOCC_DIR="$BUILD_COSMOPOLITAN_DIR/cosmocc"
export BUILD_LLAMAFILE_DIR="$HOME/305-BUILD-llamafile"
export ZIPALIGN="$BUILD_LLAMAFILE_DIR/bin/zipalign"
export BUILD_OPENSSSL_DIR="$HOME/306-BUILD-openssl"
export BUILD_VULKAN_DIR="$HOME/307-BUILD-vulkan"
export BUILD_VULKAN_DIR="25-BUILD-vulkan"
export VULKAN_VERSION="1.4.328.1"
if [[ -z "${VULKAN_SIMULTANEOUS_COMPILES}" ]]; then
  export VULKAN_SIMULTANEOUS_COMPILES=4
fi

$VULKAN_SETUP_ENV="$BUILD_VULKAN_DIR/$VULKAN_VERSION/setup-env.sh"
if [ -e "$VULKAN_SETUP_ENV" ]; then
  source $VULKAN_SETUP_ENV
fi

export BUILD_LLAMA_CPP_DIR="$HOME/400-BUILD-lamma-cpp"

if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi
printf "\n**********\n*\n* FINISHED: mm-environment-variables.\n*\n**********\n\n"
