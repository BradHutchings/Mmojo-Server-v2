#!/bin/bash

MODEL_MAP_URL="https://huggingface.co/bradhutchings/Mmojo-Server/resolve/main/model-map.txt"
wget $MODEL_MAP_URL --quiet -O $MODEL_MAP

printf "\n**********\n*\n* FINISHED: 302-Download-Model-Map.sh.\n*\n**********\n\n"
