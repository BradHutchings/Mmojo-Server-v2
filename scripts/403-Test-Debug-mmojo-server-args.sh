#!/bin/bash

################################################################################
# This script runs the debug build arguments in a `mmojo-server-args` file.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

THIS_TEST_DIR="$TEST_DIR/$TEST_DEBUG_MMOJO_SERVER_ARGS"
mkdir -p $THIS_TEST_DIR
rm -r -f $THIS_TEST_DIR/*
cd $THIS_TEST_DIR

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
  THREADS_PARAM="--threads${NL}$TEST_CPU_THREADS${NL}"
fi
# echo "\$THREADS_PARAM: $THREADS_PARAM"
# sleep 5s

NL=$'\n'
UI_PARAMS="--path${NL}$BUILD_DIR/Mmojo-Complete/${NL}--default-ui-endpoint${NL}/chat${NL}"
if [ ! -z $TEST_WITH_CHAT_UI ] && [ $TEST_WITH_CHAT_UI != 0 ]; then 
    # echo "Using chat UI."
    UI_PARAMS=""
fi
# echo "\$UI_PARAMS: $UI_PARAMS"
# sleep 5s

rm -f mmojo-server-args
rm -r -f mmojo-server-support

# --mlock is not needed to run this.
cat << EOF > mmojo-server-args
--model
$MODELS_DIR/$MODEL_PARAM
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
$UI_PARAMS$THREADS_PARAM
...
EOF
$BUILD_DIR/$BUILD_DEBUG/bin/mmojo-server

printf "\nVerify that 'mmojo-server-args' exists and 'mmojo-server-support' does not exist.\n"
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
