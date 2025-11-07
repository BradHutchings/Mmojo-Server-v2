#!/bin/bash

TEST_DIR="$HOME/Test-Command-Line"
mkdir -p $TEST_DIR
rm -r -f $TEST_DIR/*
cd $TEST_DIR

rm -f mmojo-server-args
rm -r -f mmojo-server-support
$BUILD_LLAMA_CPP_DIR/$BUILD_TEST/bin/mmojo-server --model $MODELS_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf \
    --path $BUILD_LLAMA_CPP_DIR/completion-ui/ --default-ui-endpoint "chat" --host 0.0.0.0 --port 8080 --batch-size 64 \
    --threads-http 8 --ctx-size 0 --mlock

printf "\nVerify 'mmojo-server-args' and 'mmojo-server-support'."
ls -ald mmojo-server-args mmojo-server-support

cd $HOME

printf "\n**********\n*\n* FINISHED: 403-Test-Command-Line.sh.\n*\n**********\n\n"
