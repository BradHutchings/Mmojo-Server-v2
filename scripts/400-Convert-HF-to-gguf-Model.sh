#!/bin/bash

################################################################################
# This script converts a Hugging Face repo with safetensor files into a .gguf 
# model.
#
# https://github.com/ggml-org/llama.cpp
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1 $2 $3 $4.\n*\n$STARS\n\n"

model_name=$1
model_type=$2
model_mnemonic=$3
model_repo=$4

GGUF_DIR="$BUILD_MODELS_DIR/$model_name-$model_type"
GGUF_FILE="$model_name-$model_type.gguf"

echo "    model_name: $model_name"
echo "    model_type: $model_type"
echo "model_mnemonic: $model_mnemonic"
echo "    model_repo: $model_repo"
echo "      GGUF_DIR: $GGUF_DIR"
echo "     GGUF_FILE: $GGUF_FILE"

if [ "$model_name" != "" ] && [ "$model_type" != "" ] && [ "$model_mnemonic" != "" ] && [ "$model_repo" != "" ]; then
    mkdir -p $BUILD_MODELS_DIR
    if [ ! -d $GGUF_DIR ]; then
        echo ""
        echo "Cloning $model_repo."
        git clone $model_repo $GGUF_DIR
    fi

    echo ""
    echo "Converting to $model_name-$model_type.gguf."
    python3 $BUILD_DIR/convert_hf_to_gguf.py $GGUF_DIR \
        --outfile $GGUF_DIR/$GGUF_FILE \
        --outtype $model_type

    if [ -f $GGUF_DIR/$GGUF_FILE ] && [ -d "$MODELS_DIR" ]; then
        echo ""
        echo "Copying to $MODELS_DIR."
        rsync -ah --progress $GGUF_DIR/$GGUF_FILE $MODELS_DIR

        if ! grep -q "$GGUF_FILE" "$MODEL_MAP"; then
cat << EOF >> $MODEL_MAP
$GGUF_FILE $model_mnemonic
EOF
        fi        
    fi

fi

cd $HOME

printf "\n$STARS\n*\n* FINISHED: $SCRIPT_NAME $1 $2 $3 $4.\n*\n$STARS\n\n"

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
