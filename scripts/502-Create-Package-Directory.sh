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

if [ ! -d "$PACKAGE_DIR/$PACKAGE_ZIP" ]; then
    mkdir -p "$PACKAGE_DIR/$PACKAGE_ZIP"
fi

if [ -v CHOSEN_BUILD ] && [ -v CHOSEN_BUILD_PATH ]; then
    cp $CHOSEN_BUILD_PATH $PACKAGE_DIR/$PACKAGE_ZIP
    mkdir -p "$PACKAGE_DIR/$PACKAGE_ZIP/$PACKAGE_MMOJO_SERVER_SUPPORT_DIR"
    touch "$PACKAGE_DIR/$PACKAGE_ZIP/Build--$CHOSEN_BUILD"
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
