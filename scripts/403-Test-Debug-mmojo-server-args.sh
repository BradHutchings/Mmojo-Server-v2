#!/bin/bash

################################################################################
# This script runs the debug build arguments in a `mmojo-server-args` file.
#
# See licensing note at end.
################################################################################

TEST_DIR="$TEST_LLAMA_CPP_DIR/$TEST_DEBUG_MMOJO_SERVER_ARGS"
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
$BUILD_LLAMA_CPP_DIR/$BUILD_DEBUG/bin/mmojo-server

printf "\nVerify that 'mmojo-server-args' exists and 'mmojo-server-support' does not exist.\n"
ls -ald mmojo-server-args
ls -ald mmojo-server-support

cd $HOME

printf "\n**********\n*\n* FINISHED: 403-Test-Debug-mmojo-server-args.sh.\n*\n**********\n\n"

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
