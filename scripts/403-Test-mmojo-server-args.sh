#!/bin/bash

cd $BUILD_LLAMA_CPP_DIR

rm -f mmojo-server-args
rm -r -f mmojo-server-support
cat << EOF > mmojo-server-args
--model
$HOME/$DOWNLOAD_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf
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
$(pwd)/completion-ui
--default-ui-endpoint
chat
--mlock
...
EOF
./$BUILD_TEST/bin/mmojo-server

cd $HOME

printf "\n**********\n*\n* FINISHED: 403-Test-mmojo-server-args.sh.\n*\n**********\n\n"
