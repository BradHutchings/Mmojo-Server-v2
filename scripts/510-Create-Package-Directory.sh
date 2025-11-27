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

PACKAGE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_APE"
BUILD_SUBDIRECTORY="$BUILD_COSMO_COMPATIBLE_APE"
if [ $variation == "performant" ]; then
    PACKAGE_SUBDIRECTORY="$PACKAGE_PERFORMANT_APE"
    BUILD_SUBDIRECTORY="$BUILD_COSMO_PERFORMANT_APE"
fi

echo "           Variation: $variation"
echo "Package Subdirectory: $PACKAGE_SUBDIRECTORY"
echo "  Build Subirectory: $BUILD_SUBDIRECTORY"

if [ $PACKAGE_SUBDIRECTORY != "" ]; then
    THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_SUBDIRECTORY"
    if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
        THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
    fi

    if [ ! -d "$THIS_PACKAGE_DIR" ]; then
        mkdir -p "$THIS_PACKAGE_DIR"
    fi

    echo ""
    echo "Copying built $PACKAGE_MMOJO_SERVER_APE_FILE."
    BUILT_FILE="$BUILD_DIR/$BUILD_SUBDIRECTORY/$PACKAGE_MMOJO_SERVER_APE_FILE"
    ZIP_FILE="$THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_ZIP_FILE"
    if [ -f "$BUILT_FILE" ]; then
        cp $BUILT_FILE $ZIP_FILE
    fi

    echo "Removing extraneous time zone files from zip."
    zip -d -q $ZIP_FILE "/usr/*"

    echo ""
    echo "Contents of $ZIP_FILE:"
    unzip -l $ZIP_FILE 
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
