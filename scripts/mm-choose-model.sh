#!/bin/bash

################################################################################
# This script adds certs from the Mmojo Share to the mmojo-server.zip packaging
# file.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
# printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

unset CHOSEN_MODEL
unset CHOSEN_MODEL_SHORT_NAME

cd $MODELS_DIR
select filename in *.gguf; do
  case $filename in
    "")
      echo "That was not a valid choice. \$CHOSEN_MODEL has been unset."
      break
      ;;
    *)
      echo $filename
      export CHOSEN_MODEL=$filename
      break
      ;;
  esac
done

if [ -v CHOSEN_MODEL ]; then
  export CHOSEN_MODEL_SHORT_NAME=$(grep $CHOSEN_MODEL $MODEL_MAP | awk '{print $2}')
fi

cd $HOME

# printf "\n**********\n*\n* FINISHED: $SCRIPT_NAME.\n*\n**********\n\n"

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
