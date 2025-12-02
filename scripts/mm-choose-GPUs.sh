#!/bin/bash

################################################################################
# This script lets the user choose which GPU support to include in a build.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: mm-choose-build.sh.\n*\n**********\n\n"

unset CHOSEN_GPUS

gpu_combos=()
has_cuda=0
has_hip=0
has_vulkan=0

if command -v nvcc >/dev/null 2>&1;; then
    has_cuda=1
fi
if command -v hipconfig >/dev/null 2>&1;; then
    has_hip=1
fi
if command -v vulkaninfo >/dev/null 2>&1;; then
    has_vulkan=1
fi

if (( has_cuda == 1 )); then                                     gpu_combos+="CUDA"
if (( has_cuda == 1 && has_hip == 1 )); then                     gpu_combos+="CUDA + HIP"
if (( has_cuda == 1 && has_hip == 1 && has_vulkan == 1 )); then  gpu_combos+="CUDA + HIP + VULKAN"
if (( has_cuda == 1 && has_vulkan == 1 )); then                  gpu_combos+="CUDA + VULKAN"
if (( has_hip == 1 )); then                                      gpu_combos+="HIP"
if (( has_hip == 1 && has_vulkan == 1 )); then                   gpu_combos+="HIP + VULKAN"
if (( has_vulkan == 1 )); then                                   gpu_combos+="VULKAN"

if [ ${#gpu_combos[@]} > 0 ]; then
    echo "Please pick the GPU combination you want your build to support:"
    select choice in "${gpu_combos[@]}"; do
        echo "You chose: $coice"
        break
    done
else
    echo "Could not find dev kits for CUDA, HIP, or VULKAN."
fi

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
