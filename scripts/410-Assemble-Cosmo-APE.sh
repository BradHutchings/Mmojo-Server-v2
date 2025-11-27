#!/bin/bash

################################################################################
# This script builds the specified version of mmojo-server and other llama.cpp 
# targets.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1.\n*\n$STARS\n\n"

cd $BUILD_DIR

variation=$1

if [ $variation != "compatible" ] && [ $variation != "performant" ]; then
    variation="compatible"
fi

BUILD_X86_64_SUBDIRECTORY="$BUILD_COSMO_COMPATIBLE_X86_64"
BUILD_AARCH64_SUBDIRECTORY="$BUILD_COSMO_COMPATIBLE_AARCH64"
BUILD_APE_SUBDIRECTORY="$BUILD_COSMO_COMPATIBLE_APE"
if [ $variation == "performant" ]; then
    BUILD_X86_64_SUBDIRECTORY="$BUILD_COSMO_PERFORMANT_X86_64"
    BUILD_AARCH64_SUBDIRECTORY="$BUILD_COSMO_PERFORMANT_AARCH64"
    BUILD_APE_SUBDIRECTORY="$BUILD_COSMO_PERFORMANT_APE"
fi

echo "                 Variation: $variation"
echo " Build x86_64 Subdirectory: $BUILD_X86_64_SUBDIRECTORY"
echo "Build aarch64 Subdirectory: $BUILD_AARCH64_SUBDIRECTORY"
echo "    Build APE Subdirectory: $BUILD_APE_SUBDIRECTORY"

if [ $BUILD_X86_64_SUBDIRECTORY != "" ] && [ $BUILD_AARCH64_SUBDIRECTORY != "" ] && [ $BUILD_APE_SUBDIRECTORY != "" ]; then
    mkdir -p $BUILD_DIR/$BUILD_APE_SUBDIRECTORY
    export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"

    # Thanks to Davide Eynard for the -M line to support Macs.

    apelink \
	      -l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	      -l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	      -o $BUILD_DIR/$BUILD_APE_SUBDIRECTORY/mmojo-server-ape \
	      -M ./cosmocc/bin/ape-m1.c \
        $BUILD_DIR/$BUILD_X86_64_SUBDIRECTORY/bin/mmojo-server \
        $BUILD_DIR/$BUILD_AARCH64_SUBDIRECTORY/bin/mmojo-server

        # Not using mm-ziplalign until we get the mmap() into `/zip/...` thing resolved.
        # apelink \
        # 	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
        # 	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
        #	-o $BUILD_DIR/$BUILD_APE_SUBDIRECTORY/mm-zipalign-ape \
        #	-M ./cosmocc/bin/ape-m1.c \
        #	$BUILD_DIR/$BUILD_X86_64_SUBDIRECTORY/bin/mm-zipalign \
        #	$BUILD_DIR/$BUILD_AARCH64_SUBDIRECTORY/bin/mm-zipalign

        # Not using mm-ziplalign until we get the mmap() into `/zip/...` thing resolved.
        # cp $BUILD_DIR/$BUILD_APE_SUBDIRECTORY/mm-zipalign-ape $HOME/mm-scripts/mm-zipalign

    export PATH=$SAVE_PATH
fi

cd $HOME

printf "\n$STARS\n*\n* FINISHED: $SCRIPT_NAME $1.\n*\n$STARS\n\n"

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
