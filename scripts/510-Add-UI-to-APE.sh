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

PACKAGE_APE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_APE"
if [ $variation == "performant" ]; then
    PACKAGE_APE_SUBDIRECTORY="$PACKAGE_PERFORMANT_APE"
fi

echo "             Variation: $variation"
echo "Package APE Subdirectory: $PACKAGE_APE_SUBDIRECTORY"

if [ $PACKAGE_APE_SUBDIRECTORY != "" ]; then
    THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_APE_SUBDIRECTORY"
    if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
        THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
    fi

    ZIP_FILE="$THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_ZIP_FILE"

    WEBSITE="$THIS_PACKAGE_DIR/Mmojo-Complete"
    mkdir -p $WEBSITE
    cp -r $BUILD_DIR/Mmojo-Complete/* $WEBSITE

    CA_FILE="$CERTIFICATES_DIR/selfsignCA.crt"
    if [ -f "$CA_FILE" ]; then
        cp $CA_FILE $WEBSITE/CA.crt
    fi

    cd $THIS_PACKAGE_DIR
    zip -0 -r -q $ZIP_FILE Mmojo-Complete/*

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
