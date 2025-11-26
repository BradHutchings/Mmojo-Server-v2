#!/bin/bash

################################################################################
# This script assembles the dogpile_ape Actual Portable Executable (APE)
# and the mm-zipalign-ape APE from local x86_64 and aarch64 (arm64) builds. The
# mm-zipalign-ape APE is copied to $HOME/tools as mm-zipalign for use in the 
# packaging phase.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

cd $DOGPILE_BUILD_DIR

mkdir -p $DOGPILE_BUILD_DIR/$BUILD_COSMO_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"

# Thanks to Davide Eynard for the -M line to support Macs.

apelink \
	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $DOGPILE_BUILD_DIR/$BUILD_COSMO_APE/dogpile-ape \
	-M ./cosmocc/bin/ape-m1.c \
    $DOGPILE_BUILD_DIR/$BUILD_COSMO_X86_64/bin/dogpile \
    $DOGPILE_BUILD_DIR/$BUILD_COSMO_AARCH64/bin/dogpile

# Not using mm-ziplalign until we get the mmap() into `/zip/...` thing resolved.
# apelink \
# 	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
# 	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
# 	-o $DOGPILE_BUILD_DIR/$BUILD_COSMO_APE/mm-zipalign-ape \
# 	-M ./cosmocc/bin/ape-m1.c \
# 	$DOGPILE_BUILD_DIR/$BUILD_COSMO_X86_64/bin/mm-zipalign \
# 	$DOGPILE_BUILD_DIR/$BUILD_COSMO_AARCH64/bin/mm-zipalign

# Not using mm-ziplalign until we get the mmap() into `/zip/...` thing resolved.
# cp $DOGPILE_BUILD_DIR/$BUILD_COSMO_APE/mm-zipalign-ape $HOME/tools/mm-zipalign

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
