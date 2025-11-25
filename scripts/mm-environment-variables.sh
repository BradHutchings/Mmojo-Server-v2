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

export STARS="****************************************"
printf "\n$STARS\n*\n* STARTED: mm-environment-variables.sh.\n*\n$STARS\n\n"

cd $HOME

# Reset these compiler environment variables. Set in build step scripts as needed.
unset CC
unset CXX
unset AR

export HOME_SCRIPTS="$HOME/mm-scripts"
export TILDE_SCRIPTS="~/mm-scripts"

export MMOJO_SERVER_DIR="$HOME/200-mmojo-server"
export MMOJO_SERVER_FILES="$MMOJO_SERVER_DIR/files"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"

export MMOJO_SHARE_MOUNT_POINT="/mnt/mmojo"
export MMOJO_SHARE_BUILDS="$MMOJO_SHARE_MOUNT_POINT/builds"
export MMOJO_SHARE_BUILDS_APE="$MMOJO_SHARE_BUILDS/ape"
export MMOJO_SHARE_BUILDS_COMPATIBLE_APE="$MMOJO_SHARE_BUILDS/compatible-ape"
export MMOJO_SHARE_BUILDS_PERFORMANT_APE="$MMOJO_SHARE_BUILDS/performant-ape"
export MMOJO_SHARE_BUILDS_CPU_NATIVE="$MMOJO_SHARE_BUILDS/cpu-native"
export MMOJO_SHARE_BUILDS_CUDA="$MMOJO_SHARE_BUILDS/cuda"
export MMOJO_SHARE_BUILDS_VULKAN="$MMOJO_SHARE_BUILDS/vulkan"
export MMOJO_SHARE_PACKAGES="$MMOJO_SHARE_MOUNT_POINT/packages"
export MMOJO_SHARE_PACKAGES_APE="$MMOJO_SHARE_PACKAGES/ape"
export MMOJO_SHARE_PACKAGES_ZIP="$MMOJO_SHARE_PACKAGES/zip"

export MOUNT_MMOJO_SHARE_SCRIPT="mm-mount-mmojo-share.sh"

# Prefix is 300- so we can wipe them out quickly, and changing script numbers doesn't mess stuff up.
export MODELS_DIR="$HOME/300-MODELS"
export MODEL_MAP="$MODELS_DIR/model-map.txt"
export BUILD_COSMOPOLITAN_DIR="$HOME/300-BUILD-cosmopolitan"
export COSMOCC_DIR="$BUILD_COSMOPOLITAN_DIR/cosmocc"
export BUILD_OPENSSSL_DIR="$HOME/300-BUILD-openssl"
export INSTALL_CUDA_TOOLKIT_DIR="$HOME/300-INSTALL-cuda-toolkit"
export BUILD_VULKAN_SDK_DIR="$HOME/300-BUILD-vulkan-sdk"
export VULKAN_VERSION="1.4.328.1"
if [[ -z "${VULKAN_SIMULTANEOUS_COMPILES}" ]]; then
  export VULKAN_SIMULTANEOUS_COMPILES=4
fi

VULKAN_SETUP_ENV="$BUILD_VULKAN_SDK_DIR/$VULKAN_VERSION/setup-env.sh"
if [ -e "$VULKAN_SETUP_ENV" ]; then
  source $VULKAN_SETUP_ENV
fi

export BUILD_DIR="$HOME/400-BUILD-mmojo-server"
export BUILD_DEBUG="build-debug"
export BUILD_COSMO_X86_64="build-cosmo-x86_64"
export BUILD_COSMO_AARCH64="build-cosmo-aarch64"
export BUILD_COSMO_APE="build-cosmo-ape"
export BUILD_COSMO_COMPATIBLE_X86_64="build-cosmo-compatible-x86_64"
export BUILD_COSMO_COMPATIBLE_AARCH64="build-cosmo-compatible-aarch64"
export BUILD_COSMO_COMPATIBLE_APE="build-cosmo-compatible-ape"
export BUILD_COSMO_PERFORMANT_X86_64="build-cosmo-performant-x86_64"
export BUILD_COSMO_PERFORMANT_AARCH64="build-cosmo-performant-aarch64"
export BUILD_COSMO_PERFORMANT_APE="build-performant-cosmo-ape"
export BUILD_CPU_NATIVE="build-cpu-native"
export BUILD_CPU_COMPATIBLE="build-cpu-compatible"
export BUILD_CPU_PERFORMANT="build-cpu-performant"
export BUILD_CUDA="build-cuda"
export BUILD_VULKAN="build-vulkan"
export BUILD_METAL="build-metal"

export TEST_DIR="$HOME/400-TEST-mmojo-server"
export TEST_DEBUG_COMMAND_LINE="test-debug-command-line"
export TEST_DEBUG_MMOJO_SERVER_ARGS="test-debug-mmojo-server-args"
export TEST_DEBUG_MMOJO_SERVER_SUPPORT="test-debug-mmojo-server-support"
export TEST_COSMO_X86_64="test-cosmo-x86_64"
export TEST_COSMO_AARCH64="test-cosmo-aarch64"
export TEST_COSMO_APE="test-cosmo-ape"
export TEST_CPU="test-cpu"
export TEST_CUDA="test-cuda"
export TEST_VULKAN="test-vulkan"

# Reset this when we update environment variables.
unset TEST_MODEL
unset TEST_CPU_THREADS
unset TEST_WITH_CHAT_UI

export PACKAGE_DIR="$HOME/500-PACKAGE-mmojo-server"
export PACKAGE_APE="ape"
export PACKAGE_COMPATIBLE_APE="compatible-ape"
export PACKAGE_PERFORMANT_APE="performant-ape"
export PACKAGE_ZIP="zip"
export PACKAGE_SEAS="seas"

export PACKAGE_MMOJO_SERVER_FILE="mmojo-server"
export PACKAGE_MMOJO_SERVER_APE_FILE="mmojo-server-ape"
# export PACKAGE_MMOJO_SERVER_COMPATIBLE_APE_FILE="mmojo-server-compatible-ape"
# export PACKAGE_MMOJO_SERVER_PERFORMANT_APE_FILE="mmojo-server-performant-ape"
export PACKAGE_MMOJO_SERVER_ZIP_FILE="mmojo-server.zip"
export PACKAGE_MMOJO_SERVER_EXE_FILE="mmojo-server.exe"

# Change this to "mmojo-server-args", update server-mmojo.cpp.
export PACKAGE_DEFAULT_ARGS_FILE="default-args"
export PACKAGE_MMOJO_SERVER_ARGS_FILE="mmojo-server-args"
export PACKAGE_MMOJO_SERVER_SUPPORT_DIR="mmojo-server-support"

export DOGPILE_FILES="$MMOJO_SERVER_DIR/files/dogpile"
export DOGPILE_SCRIPTS="$MMOJO_SERVER_DIR/scripts/dogpile"

export DOGPILE_BUILD_DIR="$HOME/400-BUILD-dogpile"
export DOGPILE_TEST_DIR="$HOME/400-TEST-dogpile"
export DOGPILE_PACKAGE_DIR="$HOME/500-PACKAGE-dogpile"

export PACKAGE_DOGPILE_FILE="dogpile"
export PACKAGE_DOGPILE_APE_FILE="dogpile-ape"
export PACKAGE_DOGPILE_COMPATIBLE_APE_FILE="dogpile-compatible-ape"
export PACKAGE_DOGPILE_PERFORMANT_APE_FILE="dogpile-performant-ape"
export PACKAGE_DOGPILE_ZIP_FILE="dogpile.zip"
export PACKAGE_DOGPILE_EXE_FILE="dogpile.exe"
export PACKAGE_DOGPILE_ARGS_FILE="dogpile-args"
export PACKAGE_DOGPILE_SUPPORT_DIR="dogpile-support"

# export BUILD_LLAMAFILE_DIR="$HOME/305-BUILD-llamafile"
# export ZIPALIGN="$BUILD_LLAMAFILE_DIR/bin/zipalign"
export ZIPALIGN="$HOME/tools/mm-zipalign"

# Run this script when user starts a session.
SEARCH_STRING="\. mm-environment-variables.sh"
COMMAND_STRING=". mm-environment-variables.sh"
BASHRC_PATH="$HOME/.bashrc"
if ! grep -q "$SEARCH_STRING" "$BASHRC_PATH"; then
    echo $COMMAND_STRING >> $BASHRC_PATH
fi

if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi

printf "\n$STARS\n*\n* FINISHED: mm-environment-variables.sh.\n*\n$STARS\n\n"


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
