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
attire=$2
branding=$3

if [ "$variation" != "compatible" ] && [ "$variation" != "performant" ]; then
    variation="compatible"
fi

if [ "$attire" != "attired" ] && [ "$attire" != "naked" ]; then
    attire="attired"
fi

if [ "$branding" != "doghouse" ] && [ "$branding" != "llama-server" ]; then
    branding=""
fi

THIS_PACKAGE_DIR=$PACKAGE_DIR
EXECUTABLE_FILE=$PACKAGE_MMOJO_SERVER_APE_FILE
if [ "$branding" == "doghouse" ]; then
    THIS_PACKAGE_DIR=$DOGHOUSE_PACKAGE_DIR
    EXECUTABLE_FILE=$PACKAGE_DOGHOUSE_APE_FILE
elif [ "$branding" == "llama-server" ]; then
    THIS_PACKAGE_DIR=$LLAMA_SERVER_PACKAGE_DIR
    EXECUTABLE_FILE=$PACKAGE_LLAMA_SERVER_APEFILE
fi
EXE_FILE="$EXECUTABLE_FILE.exe"

PACKAGE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_APE"
if [ "$attire" == "attired" ]; then
    if [ "$variation" == "compatible" ]; then
        PACKAGE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_APE"
    elif [ "$variation" == "performant" ]; then
        PACKAGE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_APE"
    fi
elif [ "$attire" == "naked" ]; then
    if [ "$variation" == "compatible" ]; then
        PACKAGE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_NAKED_APE"
    elif [ "$variation" == "performant" ]; then
        PACKAGE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_NAKED_APE"
    fi
fi

if [ "$attire" == "attired" ] && [ -v CHOSEN_MODEL_MNEMONIC ]; then
    PACKAGE_SUBDIRECTORY+="-$CHOSEN_MODEL_MNEMONIC"
fi

echo "      Variation: $variation"
echo "         Attire: $attire"
echo "       Branding: $branding"
echo "   subdirectory: $PACKAGE_SUBDIRECTORY"
echo "   packaging in: $THIS_PACKAGE_DIR/$PACKAGE_SUBDIRECTORY"
echo "     copying to: $MMOJO_SHARE_PACKAGES/$PACKAGE_SUBDIRECTORY"
echo "executable file: $EXECUTABLE_FILE"
echo "      .exe file: $EXE_FILE"
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
            sudo cp -f $THIS_PACKAGE_DIR/$PACAKAGE_SUBDIRECTORY/$EXECUTABLE_FILE $MMOJO_SHARE_PACKAGES/$PACAKAGE_SUBDIRECTORY/$EXE_FILE
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
