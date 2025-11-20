#!/bin/bash

################################################################################
# This script adds certs from the Mmojo Share to the mmojo-server-support
# subdirectory of the package directory.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

if [ -v CHOSEN_BUILD ] && [ -v CHOSEN_BUILD_PATH ]; then
    THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_ZIP-$CHOSEN_BUILD"
    SUPPORT_DIR="$THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_SUPPORT_DIR"

    if [ -d "$THIS_PACKAGE_DIR" ] && [ -d "$SUPPORT_DIR" ]; then
        WEBSITE="$SUPPORT_DIR/Mmojo-Complete"
        mkdir -p $WEBSITE
        cp -r $BUILD_DIR/Mmojo-Complete/* $WEBSITE

        CA_FILE="$SUPPORT_DIR/certs/selfsignCA.crt"
        if [ -f "$CA_FILE" ]; then
            cp $CA_FILE $WEBSITE/CA.crt
        fi

        echo "mmojo-server-support/Mmojo-Complete:"
        ls -al "$SUPPORT_DIR/Mmojo-Complete"
    fi
fi

cd $HOME

printf "\n**********\n*\n* FINISHED: $SCRIPT_NAME.\n*\n**********\n\n"

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
