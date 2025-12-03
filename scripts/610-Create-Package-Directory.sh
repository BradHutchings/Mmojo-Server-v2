#!/bin/bash

################################################################################
# This script builds the specified version of mmojo-server and other llama.cpp 
# targets.
#
# See licensing note at end.
################################################################################
SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1 $2.\n*\n$STARS\n\n"

variation=$1
branding=$2

if [ "$variation" != "compatible" ] && [ "$variation" != "performant" ]; then
    variation="compatible"
fi

if [ "$branding" != "dogpile" ]; then
    branding=""
fi

PACKAGE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_APE"
BUILD_SUBDIRECTORY="$BUILD_COSMO_COMPATIBLE_APE"
if [ $variation == "performant" ]; then
    PACKAGE_SUBDIRECTORY="$PACKAGE_PERFORMANT_APE"
    BUILD_SUBDIRECTORY="$BUILD_COSMO_PERFORMANT_APE"
fi

THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_SUBDIRECTORY"
THIS_BUILD_DIR="$BUILD_DIR/$BUILD_SUBDIRECTORY"
APE_FILE="$PACKAGE_MMOJO_SERVER_APE_FILE"
ZIP_FILE="$PACKAGE_MMOJO_SERVER_ZIP_FILE"
if [ "$branding" == "dogpile" ]; then
    THIS_PACKAGE_DIR="$DOGPILE_PACKAGE_DIR/$PACKAGE_SUBDIRECTORY"
    THIS_BUILD_DIR="$DOGPILE_BUILD_DIR/$BUILD_SUBDIRECTORY"
    APE_FILE="$PACKAGE_DOGPILE_APE_FILE"
    ZIP_FILE="$PACKAGE_DOGPILE_ZIP_FILE"
fi

if [ -v CHOSEN_MODEL_MNEMONIC ]; then
    THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_MNEMONIC"
fi

echo "             Variation: $variation"
echo "              Branding: $branding"
echo "              APE File: $APE_FILE"
echo "              APE File: $ZIP_FILE"
echo "  Package Subdirectory: $PACKAGE_SUBDIRECTORY"
echo "     Build Subirectory: $BUILD_SUBDIRECTORY"
echo "This Package Directory: $THIS_PACKAGE_DIR"
echo "  This Build Directory: $THIS_BUILD_DIR"

if [ "$THIS_PACKAGE_DIR" != "" ] && [ "$THIS_BUILD_DIR" != "" ]; then
    if [ ! -d "$THIS_PACKAGE_DIR" ]; then
        mkdir -p "$THIS_PACKAGE_DIR"
    fi

    echo ""
    echo "Copying built $APE_FILE."
    THIS_BUILT_FILE="$THIS_BUILD_DIR/$APE_FILE"
    THIS_ZIP_FILE="$THIS_PACKAGE_DIR/$ZIP_FILE"
    if [ -f "$THIS_BUILT_FILE" ]; then
        cp $THIS_BUILT_FILE $THIS_ZIP_FILE
    fi

    echo "Removing extraneous time zone files from $THIS_ZIP_FILE."
    zip -d -q $THIS_ZIP_FILE "/usr/*"

    echo ""
    echo "Contents of $THIS_ZIP_FILE:"
    unzip -l $THIS_ZIP_FILE 
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
