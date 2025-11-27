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

echo "               Variation: $variation"
echo "Package APE Subdirectory: $PACKAGE_APE_SUBDIRECTORY"

if [ $PACKAGE_APE_SUBDIRECTORY != "" ]; then
    THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_APE_SUBDIRECTORY"
    if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
        THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
    fi

    ZIP_FILE="$THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_ZIP_FILE"

    cd "$THIS_PACKAGE_DIR"
cat << EOF > $PACKAGE_MMOJO_SERVER_ARGS_FILE
--host
127.0.0.1
--port
8080
--ctx-size
0
--threads-http
8
--batch-size
64
--batch-sleep-ms
0
EOF

    if [ $ADDED_CERTS ]; then
cat << EOF >> $PACKAGE_MMOJO_SERVER_ARGS_FILE
--ssl-key-file
/zip/certs/cert.key
--ssl-cert-file
/zip/certs/cert.crt
EOF
    fi

    if [ $ADDED_MMOJO_COMPLETE ]; then
cat << EOF >> $PACKAGE_MMOJO_SERVER_ARGS_FILE
--path
/zip/Mmojo-Complete
--default-ui-endpoint
chat
EOF
    fi

    # Memory mapping through Coscmo libc does not work. If we add a model, make sure we don't use mmap.
    # We need an enable mmap paramter to override this.

    if [ $ADDED_MODEL ] && [ -v CHOSEN_MODEL ]; then
cat << EOF >> $PACKAGE_MMOJO_SERVER_ARGS_FILE
--no-mmap
--model
/zip/$CHOSEN_MODEL
EOF
    fi

cat << EOF >> $PACKAGE_MMOJO_SERVER_ARGS_FILE
...
EOF

    echo ""
    echo "$PACKAGE_MMOJO_SERVER_ARGS_FILE:"
    cat $PACKAGE_MMOJO_SERVER_ARGS_FILE

    echo ""
    echo "Adding $PACKAGE_MMOJO_SERVER_ARGS_FILE file to $ZIP_FILE."
    zip -0 -r $ZIP_FILE $PACKAGE_MMOJO_SERVER_ARGS_FILE

    echo ""
    echo "Contents of $ZIP_FILE:"
    unzip -l $ZIP_FILE 

    echo ""
    echo "Cleaning up."
    mv $ZIP_FILE $PACKAGE_MMOJO_SERVER_FILE
    rm -r -f Mmojo-Complete certs $PACKAGE_MMOJO_SERVER_ARGS_FILE

    echo ""
    echo "Listing packaging directory: $THIS_PACKAGE_DIR"
    ls -al $THIS_PACKAGE_DIR
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
