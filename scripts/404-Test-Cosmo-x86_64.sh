#!/bin/bash

################################################################################
# This script runs the Cosmo x86_64 build with command-line arguments.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

THIS_TEST="$TEST_DIR/$TEST_COSMO_X86_64"
mkdir -p $THIS_TEST
rm -r -f $THIS_TEST/*
cd $THIS_TEST

MODEL_PARAM="Google-Gemma-1B-Instruct-v3-q8_0.gguf"
if [[ -v TEST_MODEL ]]; then
    echo "\$TEST_MODEL: $TEST_MODEL."
    if [ -f "$MODELS_DIR/$TEST_MODEL" ]; then
        echo "Model found."
        MODEL_PARAM=$TEST_MODEL
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

rm -f mmojo-server-args
rm -r -f mmojo-server-support
$BUILD_DIR/$BUILD_COSMO_X86_64/bin/mmojo-server --model $MODELS_DIR/$MODEL_PARAM \
    $UI_PARAMS $THREADS_PARAM --host 0.0.0.0 --port 8080 --batch-size 64 --threads-http 8 --ctx-size 0 --mlock

printf "\nVerify that 'mmojo-server-args' and 'mmojo-server-support' do not exist.\n"
ls -ald mmojo-server-args
ls -ald mmojo-server-support

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
