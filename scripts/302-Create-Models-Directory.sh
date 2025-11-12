#!/bin/bash

################################################################################
# This script... DESCRIPTION HERE.
#
# See licensing note at end.
################################################################################

mkdir -p $MODELS_DIR
cd $MODELS_DIR

cat << EOF > $MODEL_MAP
Google-Gemma-1B-Instruct-v3-q8_0.gguf mmojo-server-Google-Gemma-1B-Instruct-v3
Google-Gemma-4B-Instruct-v3-q8_0.gguf mmojo-server-Google-Gemma-4B-Instruct-v3
EOF

cd $HOME

printf "\n**********\n*\n* FINISHED: 302-Create-Models-Directory.sh.\n*\n**********\n\n"

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
