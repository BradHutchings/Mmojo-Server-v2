#!/bin/bash

################################################################################
# This script builds llama.cpp with Mmojo Server extensions for the CPU of the
# build environment machine. CPU optimizations are enabled. Thank you to Georgi 
# Gerganov and his team for llama.cpp!
#
# https://github.com/ggml-org/llama.cpp
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

cd $BUILD_DIR

# TO-DO: Some way to add -DCMAKE_VERBOSE_MAKEFILE=ON  on the fly to all these.

rm -r -f $BUILD_DIR/$BUILD_CPU
cmake -B $BUILD_CPU -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_BUILD_TYPE=Release # -DCMAKE_VERBOSE_MAKEFILE=ON 
cmake --build $BUILD_CPU

# Show off what we built
printf "\nBuild of CPU Test of llama.cpp is complete.\n\n"
printf "\$ ls -al $BUILD_DIR/$BUILD_CPU/bin/\n"
ls -al $BUILD_DIR/$BUILD_CPU/bin
printf "\n"

cd $HOME

printf "\n**********\n*\n* FINISHED: $SCRIPT_NAME.\n*\n**********\n\n"

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
