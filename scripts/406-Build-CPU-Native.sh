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
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

cd $BUILD_DIR

# TO-DO: Some way to add -DCMAKE_VERBOSE_MAKEFILE=ON  on the fly to all these.

rm -r -f $BUILD_DIR/$BUILD_CPU_NATIVE
cmake -B $BUILD_CPU_NATIVE -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_BUILD_TYPE=Release -DGGML_NATIVE # -DCMAKE_VERBOSE_MAKEFILE=ON 
cmake --build $BUILD_CPU_NATIVE

# Show off what we built
printf "\nBuild of CPU Test of llama.cpp is complete.\n\n"
printf "\$ ls -al $BUILD_DIR/$BUILD_CPU_NATIVE/bin/\n"
ls -al $BUILD_DIR/$BUILD_CPU_NATIVE/bin
printf "\n"

cd $HOME

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
