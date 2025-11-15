#!/bin/bash

################################################################################
# This script assembles the mmojo-server-ape Actual Portable Executable (APE)
# and the mm-zipalign-ape APE from x86_64 and aarch64 (arm64) builds on your
# Mmojo Share. The mm-zipalign-ape APE is copied to $HOME/tools as mm-zipalign 
# for use in the packaging phase.
#
# See licensing note at end.
################################################################################

cd $BUILD_LLAMA_CPP_DIR

mm-mount-mmojo-share.sh
sudo mkdir -p $MMOJO_SHARE_BUILDS
sudo mkdir -p $MMOJO_SHARE_BUILDS_APE

mkdir -p $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
apelink \
	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mmojo-server-ape \
    $MMOJO_SHARE_BUILDS_APE/mmojo-server-x86_64  \
    $MMOJO_SHARE_BUILDS_APE/mmojo-server-aarch64

apelink \
	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mm-zipalign-ape \
    $MMOJO_SHARE_BUILDS_APE/mm-zipalign-x86_64  \
    $MMOJO_SHARE_BUILDS_APE/mm-zipalign-aarch64

cp $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mm-zipalign-ape $HOME/tools/mm-zipalign

export PATH=$SAVE_PATH

cd $HOME

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* FINISHED: $SCRIPT_NAME.\n*\n**********\n\n"
# printf "\n**********\n*\n* FINISHED: 404-Assemble-Cosmo-APE-Mmojo-Share.sh.\n*\n**********\n\n"

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
