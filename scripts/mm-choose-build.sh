#!/bin/bash

################################################################################
# This script lets the user choose a mmojo-server build.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: mm-choose-build.sh.\n*\n**********\n\n"

unset CHOSEN_BUILD
unset CHOSEN_BUILD_PATH
unset CHOSEN_BUILD_INFO

build_paths=()
build_names=()
build_paths+=("$BUILD_DIR/$BUILD_DEBUG/bin/mmojo-server")
build_paths+=("$BUILD_DIR/$BUILD_COSMO_APE/mmojo-server-ape")
build_paths+=("$BUILD_DIR/$BUILD_CPU_NATIVE/bin/mmojo-server")
build_paths+=("$BUILD_DIR/$BUILD_CUDA/bin/mmojo-server")
build_paths+=("$BUILD_DIR/$BUILD_VULKAN/bin/mmojo-server")
build_paths+=("$BUILD_DIR/$BUILD_METAL/bin/mmojo-server")

build_names+=("DEBUG")
build_names+=("APE")
build_names+=("CPU-Native")
build_names+=("CUDA")
build_names+=("VULKAN")
build_names+=("METAL")

available_build_paths=()
available_build_names=()
i=0
for build_path in "${build_paths[@]}"; do
  if [ -f "${build_path}" ]; then
    # echo "$i. $build_path -- ${build_names[$i]}"
    available_build_paths+=($build_path)
    available_build_names+=(${build_names[$i]})
  fi
  i=$((i+1))
done

# List the available builds and their paths.
if false; then
  i=0
  for build_path in "${available_build_paths[@]}"; do
    echo "$i. ${available_build_names[$i]} -- $build_path"
    i=$((i+1))
  done
fi

echo "These builds are available to package:"

PS3="Please choose a build:"
select choice in "${available_build_names[@]}"; do
  export CHOSEN_BUILD=$choice
  echo "\$choice: $choice."
  case $choice in
    "DEBUG")
      export CHOSEN_BUILD_PATH=${build_paths[0]}
      ;;
    "APE")
      export CHOSEN_BUILD_PATH=${build_paths[1]}
      ;;
    "CPU-Native")
      export CHOSEN_BUILD_PATH=${build_paths[2]}
      ;;
    "CUDA")
      export CHOSEN_BUILD_PATH=${build_paths[3]}
      ;;
    "VULKAN")
      export CHOSEN_BUILD_PATH=${build_paths[4]}
      ;;
    "METAL")
      export CHOSEN_BUILD_PATH=${build_paths[5]}
      ;;
    *)
      unset CHOSEN_BUILD
      unset CHOSEN_BUILD_PATH
      unset CHOSEN_BUILD_INFO
      ;;
  esac
done

if [ -v CHOSEN_BUILD ]; then
    cbi=$CHOSEN_BUILD
    if [ "$cbi" != "APE" ]; then
        cbi+="-$(uname -m)-$(uname -s)"
    fi
    export CHOSEN_BUILD_INFO=$cbi
fi

echo ""
echo "Your chosen build, build info, build path:"
echo "$CHOSEN_BUILD - $CHOSEN_BUILD_INFO - $CHOSEN_BUILD_PATH"

cd $HOME

printf "\n**********\n*\n* FINISHED: mm-choose-build.sh.\n*\n**********\n\n"

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
