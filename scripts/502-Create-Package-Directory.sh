#!/bin/bash

################################################################################
# This script creates a package directory for building the zip package.
#
# https://github.com/ggml-org/llama.cpp
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

echo "Creating package directories."
if [ ! -d "$PACKAGE_DIR" ]; then
    mkdir -p "$PACKAGE_DIR"
fi

if [ -v CHOSEN_BUILD ] && [ -v CHOSEN_BUILD_PATH ]; then
    THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_ZIP-$CHOSEN_BUILD"
    SUPPORT_DIR="$THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_SUPPORT_DIR"

    if [ -d $THIS_PACKAGE_DIR ]; then
        rm -r -f $THIS_PACKAGE_DIR
    fi
    mkdir -p "$THIS_PACKAGE_DIR"
        
    cp $CHOSEN_BUILD_PATH $THIS_PACKAGE_DIR
    mkdir -p "$SUPPORT_DIR"

    $TOUCH_FILE="Build - $CHOSEN_BUILD"
    if [ $CHOSEN_BUILD -ne "APE" ]; then
        TOUCH_FILE+=" - $CHOSEN_BUILD"
    if
    touch "$THIS_PACKAGE_DIR/$TOUCH_FILE"

    echo "$THIS_PACKAGE_DIR:"
    ls -al "$THIS_PACKAGE_DIR"

    echo "$SUPPORT_DIR:"
    ls -al "$SUPPORT_DIR"
fi

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
