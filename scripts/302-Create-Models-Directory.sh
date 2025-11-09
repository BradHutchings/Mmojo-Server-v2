#!/bin/bash

mkdir -p $MODELS_DIR
cd $MODELS_DIR

cat << EOF > $MODEL_MAP
Google-Gemma-1B-Instruct-v3-q8_0.gguf mmojo-server-Google-Gemma-1B-Instruct-v3
EOF

cd $HOME

printf "\n**********\n*\n* FINISHED: 302-Create-Models-Directory.sh.\n*\n**********\n\n"
