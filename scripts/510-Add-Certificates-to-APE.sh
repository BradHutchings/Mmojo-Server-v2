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
if [ "$variation" == "performant" ]; then
    PACKAGE_SUBDIRECTORY="$PACKAGE_PERFORMANT_APE"
fi

THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_SUBDIRECTORY"
APE_FILE="$PACKAGE_MMOJO_SERVER_ZIP_FILE"
if [ "$branding" == "dogpile" ]; then
    THIS_PACKAGE_DIR="$DOGPILE_PACKAGE_DIR/$PACKAGE_SUBDIRECTORY"
    APE_FILE="$PACKAGE_DOGPILE_ZIP_FILE"
fi

echo "             Variation: $variation"
echo "              Branding: $branding"
echo "              APE File: $APE_FILE"
echo "  Package Subdirectory: $PACKAGE_SUBDIRECTORY"
echo "This Package Directory: $THIS_PACKAGE_DIR"

if [ "$PACKAGE_SUBDIRECTORY" != "" ]; then
    if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
        THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
    fi

    ZIP_FILE="$THIS_PACKAGE_DIR/$APE_FILE"

    CERTS="$THIS_PACKAGE_DIR/certs"
    mkdir -p $CERTS
    cp $CERTIFICATES_DIR/cert.crt $CERTS
    cp $CERTIFICATES_DIR/cert.key  $CERTS
    # cp $CERTIFICATES_DIR/selfsignCA.crt $CERTS

    echo ""
    echo "Adding certificates to $ZIP_FILE."
    cd $THIS_PACKAGE_DIR
    zip -0 -r -q $ZIP_FILE certs/*

    echo ""
    echo "Contents of $ZIP_FILE:"
    unzip -l $ZIP_FILE 
fi

cd $HOME

printf "\n$STARS\n*\n* FINISHED: $SCRIPT_NAME $1 $2.\n*\n$STARS\n\n"

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
