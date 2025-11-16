#!/bin/bash

################################################################################
# This script assembles the mmojo-server-ape Actual Portable Executable (APE)
# and the mm-zipalign-ape APE from local x86_64 and aarch64 (arm64) builds. The
# mm-zipalign-ape APE is copied to $HOME/tools as mm-zipalign for use in the 
# packaging phase.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

cd $BUILD_LLAMA_CPP_DIR

mkdir -p $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"

apelink \
	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mmojo-server-ape \
    $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_X86_64/bin/mmojo-server \
    $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64/bin/mmojo-server

apelink \
	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mm-zipalign-ape \
    $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_X86_64/bin/mm-zipalign \
    $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64/bin/mm-zipalign

cp $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mm-zipalign-ape $HOME/tools/mm-zipalign

export PATH=$SAVE_PATH

cd $HOME

printf "\n**********\n*\n* FINISHED: $SCRIPT_NAME.\n*\n**********\n\n"

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
