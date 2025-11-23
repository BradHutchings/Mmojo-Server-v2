#!/bin/bash

################################################################################
# This script builds llama.cpp with Mmojo Server extensions for the CPU of the
# build environment machine and Vulkan GPU support. Thank you to Georgi Gerganov 
# and his team for llama.cpp!
#
# https://github.com/ggml-org/llama.cpp
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

echo "Creating package directories."
if [ ! -d "$DOGPILE_PACKAGE_DIR" ]; then
    mkdir -p "$DOGPILE_PACKAGE_DIR"
fi

THIS_PACKAGE_DIR="$DOGPILE_PACKAGE_DIR/$PACKAGE_APE"
if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
    THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
fi

if [ ! -d "$THIS_PACKAGE_DIR" ]; then
    mkdir -p "$THIS_PACKAGE_DIR"
fi

echo "Copying built mmojo-server-ape."
BUILT_FILE="$DOGPILE_BUILD_DIR/$BUILD_COSMO_APE/$PACKAGE_MMOJO_SERVER_APE_FILE"
ZIP_FILE="$THIS_PACKAGE_DIR/$PACKAGE_DOGPILE_ZIP_FILE"
if [ -f "$BUILT_FILE" ]; then
  cp $BUILT_FILE $ZIP_FILE
fi

echo "Removing extraneous time zone files from zip."
zip -d $ZIP_FILE "/usr/*"

echo ""
echo "Contents of $ZIP_FILE:"
unzip -l $ZIP_FILE 

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
