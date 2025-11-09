#!/bin/bash

################################################################################
# This script downloads a model map file from Hugging Face. The model map file
# identifies models we might want to download, and suggest names for their
# self-contaned APE files we will package later.
#
# See licensing note at end.
################################################################################

MODEL_MAP_URL="https://huggingface.co/bradhutchings/Mmojo-Server/resolve/main/model-map.txt"
wget $MODEL_MAP_URL --quiet -O $MODEL_MAP

printf "\n**********\n*\n* FINISHED: 302-Download-Model-Map.sh.\n*\n**********\n\n"

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
