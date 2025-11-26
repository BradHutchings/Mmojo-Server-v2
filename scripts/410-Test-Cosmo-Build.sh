#!/bin/bash

################################################################################
# This script tests the specified Cosmo build of mmojo-server.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1 $2.\n*\n$STARS\n\n"

cd $BUILD_DIR

processor=$1
variation=$2

if [ $processor == "arm64" ]; then
    processor="aarch64"
fi

if [ $processor != "x86_64" ] && [ $processor != "aarch64" ]; then
    processor="x86_64"
fi

if [ $variation != "compatible" ] && [ $variation != "performant" ]; then
    variation="compatible"
fi

BUILD_SUBDIRECTORY=""
TEST_SUBDIRECTORY=""
if [ $processor == "x86_64" ]; then
    BUILD_SUBDIRECTORY="$BUILD_COSMO_COMPATIBLE_X86_64"
    TEST_SUBDIRECTORY="$TEST_COSMO_COMPATIBLE_X86_64"
    if [ $variation == "performant" ]; then
        BUILD_SUBDIRECTORY="$BUILD_COSMO_PERFORMANT_X86_64"
        TEST_SUBDIRECTORY="$TEST_COSMO_PERFORMANT_X86_64"
    fi
fi
if [ $processor == "aarch64" ]; then
    BUILD_SUBDIRECTORY="$BUILD_COSMO_COMPATIBLE_AARCH64"
    TEST_SUBDIRECTORY="$TEST_COSMO_COMPATIBLE_AARCH64"
    if [ $variation == "performant" ]; then
        BUILD_SUBDIRECTORY="$BUILD_COSMO_PERFORMANT_AARCH64"
        TEST_SUBDIRECTORY="$TEST_COSMO_PERFORMANT_AARCH64"
    fi
fi

echo "   Processor: $processor"
echo "   Variation: $variation"
echo "Build Subdirectory: $BUILD_SUBDIRECTORY"
echo " Test Subdirectory: $TEST_SUBDIRECTORY"

if [ -d $BUILD_DIR/$xx ] && [ $TEST_SUBDIRECTORY != "" ]; then
    THIS_TEST="$TEST_DIR/$TEST_SUBDIRECTORY"
    mkdir -p $THIS_TEST
    rm -r -f $THIS_TEST/*
    cd $THIS_TEST

    MODEL_PARAM="Google-Gemma-1B-Instruct-v3-q8_0.gguf"
    if [[ -v CHOSEN_MODEL ]]; then
        echo "\$CHOSEN_MODEL: $CHOSEN_MODEL."
        if [ -f "$MODELS_DIR/$CHOSEN_MODEL" ]; then
            echo "Model found."
            MODEL_PARAM=$CHOSEN_MODEL
        fi
    fi    
    # echo "\$MODEL_PARAM: $MODEL_PARAM"
    # sleep 5s
    
    THREADS_PARAM=""
    if [[ -v TEST_CPU_THREADS ]]; then
        THREADS_PARAM=" --threads $TEST_CPU_THREADS "
    fi
    # echo "\$THREADS_PARAM: $THREADS_PARAM"
    # sleep 5s

    UI_PARAMS=" --path $BUILD_DIR/Mmojo-Complete/ --default-ui-endpoint /chat "
    if [ ! -z $TEST_WITH_CHAT_UI ] && [ $TEST_WITH_CHAT_UI != 0 ]; then 
        # echo "Using chat UI."
        UI_PARAMS=""
    fi
    # echo "\$UI_PARAMS: $UI_PARAMS"
    # sleep 5s

    rm -f $PACKAGE_MMOJO_SERVER_ARGS_FILE
    rm -r -f $PACKAGE_MMOJO_SERVER_SUPPORT_DIR

    # --mlock is not needed to run this.
    $BUILD_DIR/$BUILD_SUBDIRECTORY/bin/mmojo-server --model $MODELS_DIR/$MODEL_PARAM \
        $UI_PARAMS $THREADS_PARAM --host 0.0.0.0 --port 8080 --batch-size 64 --threads-http 8 --ctx-size 0
    
    printf "\nVerify that args file and support folder do not exist.\n"
    ls -ald $PACKAGE_MMOJO_SERVER_ARGS_FILE
    ls -ald $PACKAGE_MMOJO_SERVER_SUPPORT_DIR
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
