#!/bin/bash

################################################################################
# This script sets environment variables for building, testing, and packaging
# all of the things we build, test, and package in this repo. It is copied
# to your $HOME/scripts directory for convenient access.
#
# Run from the command-line like this so all the variables are exported to
# the shell environment:
#
#     . mm-environment-variables.sh
#
# See licensing note at end.
################################################################################

cd $HOME

# Reset these compiler environment variables. Set in build step scripts as needed.
unset CC
unset CXX
unset AR

export HOME_SCRIPTS="$HOME/scripts"
export TILDE_SCRIPTS="~/scripts"
export HOME_TOOLS="$HOME/scripts"
export TILDE_TOOLS="~/tools"

export MMOJO_SERVER_DIR="$HOME/201-mmojo-server"
export MMOJO_SERVER_FILES="$MMOJO_SERVER_DIR/files"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"

export MMOJO_SHARE_MOUNT_POINT="/mnt/mmojo"
export MMOJO_SHARE_BUILDS="$MMOJO_SHARE_MOUNT_POINT/builds"
export MMOJO_SHARE_BUILDS_APE="$MMOJO_SHARE_BUILDS/ape"
export MOUNT_MMOJO_SHARE_SCRIPT="mm-mount-mmojo-share.sh"

export MODELS_DIR="$HOME/302-MODELS"
export MODEL_MAP="$MODELS_DIR/model-map.txt"
export BUILD_COSMOPOLITAN_DIR="$HOME/304-BUILD-cosmopolitan"
export COSMOCC_DIR="$BUILD_COSMOPOLITAN_DIR/cosmocc"
export BUILD_OPENSSSL_DIR="$HOME/305-BUILD-openssl"
export BUILD_VULKAN_DIR="$HOME/306-BUILD-vulkan"
export VULKAN_VERSION="1.4.328.1"
if [[ -z "${VULKAN_SIMULTANEOUS_COMPILES}" ]]; then
  export VULKAN_SIMULTANEOUS_COMPILES=4
fi

VULKAN_SETUP_ENV="$BUILD_VULKAN_DIR/$VULKAN_VERSION/setup-env.sh"
if [ -e "$VULKAN_SETUP_ENV" ]; then
  source $VULKAN_SETUP_ENV
fi

export BUILD_LLAMA_CPP_DIR="$HOME/400-BUILD-lamma-cpp"
export BUILD_CPU_DEBUG="build-cpu-debug"
export BUILD_CPU_RELEASE="build-cpu-release"
export BUILD_COSMO_X86_64="build-cosmo-x86_64"
export BUILD_COSMO_AARCH64="build-cosmo-aarch64"
export BUILD_COSMO_APE="build-cosmo-ape"

# export BUILD_LLAMAFILE_DIR="$HOME/305-BUILD-llamafile"
# export ZIPALIGN="$BUILD_LLAMAFILE_DIR/bin/zipalign"
export ZIPALIGN="$HOME/tools/mm-zipalign"

if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi

printf "\n**********\n*\n* FINISHED: mm-environment-variables.\n*\n**********\n\n"

################################################################################
#  This is an original script for the Mmojo Server repo. It is covered by
#  the repo's MIT-style LICENSE:
#
#  https://github.com/BradHutchings/Mmojo-Server/blob/main/LICENSE
#
#  Copyright (c) 2025 Brad Hutchings.
#  --
#  Brad Hutchings
#  brad@bradhutchings.com
################################################################################
