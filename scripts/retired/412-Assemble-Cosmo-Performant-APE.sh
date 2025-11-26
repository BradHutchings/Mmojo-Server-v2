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
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

cd $BUILD_DIR

mkdir -p $BUILD_DIR/$BUILD_COSMO_PERFORMANT_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"

# Thanks to Davide Eynard for the -M line to support Macs.

apelink \
	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_DIR/$BUILD_COSMO_PERFORMANT_APE/mmojo-server-ape \
	-M ./cosmocc/bin/ape-m1.c \
    $BUILD_DIR/$BUILD_COSMO_PERFORMANT_X86_64/bin/mmojo-server \
    $BUILD_DIR/$BUILD_COSMO_PERFORMANT_AARCH64/bin/mmojo-server

# Not using mm-ziplalign until we get the mmap() into `/zip/...` thing resolved.
# apelink \
# 	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
# 	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
#	-o $BUILD_DIR/$BUILD_COSMO_PERFORMANT_APE/mm-zipalign-ape \
#	-M ./cosmocc/bin/ape-m1.c \
#	$BUILD_DIR/$BUILD_COSMO_PERFORMANT_X86_64/bin/mm-zipalign \
#	$BUILD_DIR/$BUILD_COSMO_PERFORMANT_AARCH64/bin/mm-zipalign

# Not using mm-ziplalign until we get the mmap() into `/zip/...` thing resolved.
# cp $BUILD_DIR/$BUILD_COSMO_PERFORMANT_APE/mm-zipalign-ape $HOME/tools/mm-zipalign

export PATH=$SAVE_PATH

cd $HOME

printf "\n$STARS\n*\n* FINISHED: $SCRIPT_NAME.\n*\n$STARS\n\n"

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
