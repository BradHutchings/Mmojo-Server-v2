#!/bin/bash

################################################################################
# This script downloads models from Hugging Face.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

DownloadModel() {
  MODEL_FILE=$1
  URL="https://huggingface.co/bradhutchings/Mmojo-Server/resolve/main/models/$MODEL_FILE?download=true"
  if [ ! -f $MODEL_FILE ]; then wget $URL --show-progress --quiet -O $MODEL_FILE ; fi
}

cd $LOCAL_MODELS_DIR
unset mnemonics
declare -A mnemonics

while IFS=$' ' read -r gguf mnemonic ; do
  if [[ "$gguf" != "#" ]] && [[ -n "$gguf" ]]; then
    mnemonics["${gguf}"]="${mnemonic}"
  fi
done < "$LOCAL_MODEL_MAP"

for key in "${!mnemonics[@]}"; do
  DownloadModel $key 
done

cd $HOME

echo -e "\nLocal models directory:"
ls -al $LOCAL_MODELS_DIR/*.gguf

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
