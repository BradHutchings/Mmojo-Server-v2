#!/bin/bash

TEST_DIR="$HOME/403-Test-mmojo-server-args"
mkdir -p $TEST_DIR
rm -r -f $TEST_DIR/*
cd $TEST_DIR

rm -f mmojo-server-args
rm -r -f mmojo-server-support
cat << EOF > mmojo-server-args
--model
$MODELS_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf
--host
0.0.0.0
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
--path
$BUILD_LLAMA_CPP_DIR/completion-ui
--default-ui-endpoint
chat
--mlock
...
EOF
$BUILD_LLAMA_CPP_DIR/$BUILD_TEST/bin/mmojo-server

printf "\nVerify that 'mmojo-server-args' exists and 'mmojo-server-support' does not exist.\n"
ls -ald mmojo-server-args
ls -ald mmojo-server-support

cd $HOME

printf "\n**********\n*\n* FINISHED: 403-Test-mmojo-server-args.sh.\n*\n**********\n\n"
