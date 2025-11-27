#!/bin/bash

################################################################################
# This script builds the specified version of mmojo-server and other llama.cpp 
# targets.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1 $2.\n*\n$STARS\n\n"

cd $BUILD_DIR

variation=$1

if [ $variation != "compatible" ] && [ $variation != "performant" ]; then
    variation="compatible"
fi

BUILD_SUBDIRECTORY=""
SHARE_DIRECTORY=""
    
BUILD_SUBDIRECTORY="$BUILD_COSMO_COMPATIBLE_APE"
SHARE_DIRECTORY="$MMOJO_SHARE_BUILDS_COMPATIBLE_APE"
if [ $variation == "performant" ]; then
    BUILD_SUBDIRECTORY="$BUILD_COSMO_PERFORMANT_APE"
    SHARE_DIRECTORY="$MMOJO_SHARE_BUILDS_PERFORMANT_APE"
fi

echo "         Variation: $variation"
echo "Build Subdirectory: $BUILD_SUBDIRECTORY"
echo "  Share DDirectory: $SHARE_DIRECTORY"

if [ $BUILD_SUBDIRECTORY != "" ] && [ $SHARE_DIRECTORY != "" ]; then
    if [[ ! $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
        mm-mount-mmojo-share.sh
    fi
    
    if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
        echo "Creating directories on Mmojo Share."
        sudo mkdir -p $MMOJO_SHARE_BUILDS
        sudo mkdir -p $SHARE_DIRECTORY

        if [ -d "$SHARE_DIRECTORY" ]; then
            echo "Copying mmojo-server-$processor to Mmojo Share."
            sudo cp -f $BUILD_DIR/$BUILD_SUBDIRECTORY/mmojo-server-ape $SHARE_DIRECTORY/mmojo-server-ape
        fi
    fi
fi

export PATH=$SAVE_PATH
unset CC
unset CXX
unset AR

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
