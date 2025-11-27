#!/bin/bash

################################################################################
# This script builds the specified version of mmojo-server and other llama.cpp 
# targets.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1.\n*\n$STARS\n\n"

cd $PACKAGE_DIR

variation=$1

if [ $variation != "compatible" ] && [ $variation != "performant" ]; then
    variation="compatible"
fi

PACKAGE_SUBDIRECTORY=""
SHARE_DIRECTORY=""
    
PACKAGE_SUBDIRECTORY="$PACKAGE_COMPATIBLE_APE"
SHARE_DIRECTORY="$MMOJO_SHARE_PACKAGES_COMPATIBLE_APE"
if [ $variation == "performant" ]; then
    PACKAGE_SUBDIRECTORY="$PACKAGE_PERFORMANT_APE"
    SHARE_DIRECTORY="$MMOJO_SHARE_PACKAGES_PERFORMANT_APE"
fi

echo "           Variation: $variation"
echo "Package Subdirectory: $PACKAGE_SUBDIRECTORY"
echo "    Share DDirectory: $SHARE_DIRECTORY"

if [ $PACKAGE_SUBDIRECTORY != "" ] && [ $SHARE_DIRECTORY != "" ]; then
    THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_SUBDIRECTORY"
    if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
        THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
    fi

    if [[ ! $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
        mm-mount-mmojo-share.sh
    fi
    
    if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
        echo "Creating directories on Mmojo Share."
        sudo mkdir -p $MMOJO_SHARE_PACKAGES
        sudo mkdir -p $SHARE_DIRECTORY

        if [ -d "$SHARE_DIRECTORY" ]; then
            echo "Copying mmojo-server to Mmojo Share."
            sudo cp -f $THIS_PACKAGE_DIR/mmojo-server $SHARE_DIRECTORY/mmojo-server
        fi
    fi
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
