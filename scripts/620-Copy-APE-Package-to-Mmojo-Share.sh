#!/bin/bash

################################################################################
# This script builds the specified version of mmojo-server and other llama.cpp 
# targets.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1 $2.\n*\n$STARS\n\n"

cd $PACKAGE_DIR

variation=$1
branding=$2

if [ "$variation" != "compatible" ] && [ "$variation" != "performant" ]; then
    variation="compatible"
fi

if [ "$branding" != "doghouse" ] && [ "$branding" != "llama-server" ]; then
    branding=""
fi

THIS_PACKAGE_DIR=$PACKAGE_DIR
EXECUTABLE_FILE=$PACKAGE_MMOJO_SERVER_APE_FILE
if [ "$branding" == "doghouse" ]; then
    THIS_PACKAGE_DIR=$DOGHOUSE_PACKAGE_DIR
    PACKAGE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_APE"
    EXECUTABLE_FILE=$PACKAGE_DOGHOUSE_APE_FILE
elif [ "$branding" == "llama-server" ]; then
    THIS_PACKAGE_DIR=$LLAMA_SERVER_PACKAGE_DIR
    EXECUTABLE_FILE=$PACKAGE_LLAMA_SERVER_APEFILE
fi

PACKAGE_SUBDIRECTORY="$BUILD_COSMO_COMPATIBLE_APE"
if [ -v CHOSEN_MODEL_MNEMONIC]; then
    PACKAGE_SUBDIRECTORY+="-$CHOSEN_MODEL_MNEMONIC"
fi

echo "      Variation: $variation"
echo "       Branding: $branding"
echo "   subdirectory: $PACAKAGE_SUBDIRECTORY"
echo "   packaging in: $THIS_PACKAGE_DIR/$PACAKAGE_SUBDIRECTORY"
echo "     copying to: $MMOJO_SHARE_BUILDS/$PACAKAGE_SUBDIRECTORY"
echo "executable file: $EXECUTABLE_FILE"
echo ""

if [ -d "$THIS_PACKAGE_DIR" ] && [ "$PACAKAGE_SUBDIRECTORY" != "" ]; then
    if [[ ! $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
        mm-mount-mmojo-share.sh
    fi
    
    if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
        echo "Creating directories on Mmojo Share."
        sudo mkdir -p "$MMOJO_SHARE_PACKAGES"
        sudo mkdir -p "$MMOJO_SHARE_PACKAGES/$PACAKAGE_SUBDIRECTORY"

        if [ -d "$THIS_SHARE_DIR" ]; then
            echo "Copying mmojo-server to Mmojo Share."
            # Should have been packaged with model name in it.
            sudo cp -f $THIS_PACKAGE_DIR/$PACAKAGE_SUBDIRECTORY/$EXECUTABLE_FILE $MMOJO_SHARE_PACKAGES/$PACAKAGE_SUBDIRECTORY
        fi
    fi
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
