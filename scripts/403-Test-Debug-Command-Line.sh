#!/bin/bash

################################################################################
# This script runs the debug build with command-line arguments.
#
# See licensing note at end.
################################################################################

TEST_DIR="$TEST_LLAMA_CPP_DIR/$TEST_DEBUG_COMMAND_LINE"
mkdir -p $TEST_DIR
rm -r -f $TEST_DIR/*
cd $TEST_DIR

UI_PARAMS=" --path $BUILD_LLAMA_CPP_DIR/Mmojo-Complete/ --default-ui-endpoint \"chat\""
if [ $TEST_WITH_CHAT_UI ]; then
    echo "Using chat UI."
    UI_PARAMS=""
fi
echo "\$UI_PARAMS: $UI_PARAMS"
sleep 5s

rm -f mmojo-server-args
rm -r -f mmojo-server-support
$BUILD_LLAMA_CPP_DIR/$BUILD_DEBUG/bin/mmojo-server --model $MODELS_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf \
    $UI_PARAMS --host 0.0.0.0 --port 8080 --batch-size 64 \
    --threads-http 8 --ctx-size 0 --mlock

printf "\nVerify that 'mmojo-server-args' and 'mmojo-server-support' do not exist.\n"
ls -ald mmojo-server-args
ls -ald mmojo-server-support

cd $HOME

printf "\n**********\n*\n* FINISHED: 403-Test-Debug-Command-Line.sh.\n*\n**********\n\n"

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
