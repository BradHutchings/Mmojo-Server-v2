#!/bin/bash

################################################################################
# This script lets the user choose a mmojo-server build.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
# printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

mmojo_servers=() 

ms="$BUILD_DIR/$BUILD_DEBUG/bin/mmojo-server"
if [ -f "$ms" ]; then
  echo "Adding debug."
  mmojo_servers+=($ms)
fi

ms="$BUILD_DIR/$BUILD_COSMO_APE/mmojo-server-ape"
if [ -f "$ms" ]; then
  echo "Adding ape."
  mmojo_servers+=($ms)
fi

ms="$BUILD_DIR/$BUILD_CPU/bin/mmojo-server"
if [ -f "$ms" ]; then
  echo "Adding cpu."
  mmojo_servers+=($ms)
fi

ms="$BUILD_DIR/$BUILD_CUDA/bin/mmojo-server"
if [ -f "$ms" ]; then
  echo "Adding cuda."
  mmojo_servers+=($ms)
fi

ms="$BUILD_DIR/$BUILD_VULKAN/bin/mmojo-server"
if [ -f "$ms" ]; then
  echo "Adding vulkan."
  mmojo_servers+=($ms)
fi

ms="$BUILD_DIR/$BUILD_METAL/bin/mmojo-server"
if [ -f "$ms" ]; then
  echo "Adding metal."
  mmojo_servers+=($ms)
fi

i=1
for ms in "${mmojo_servers[@]}"; do
  echo "$i. $ms"
  i=$(($i + 1))
done

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
