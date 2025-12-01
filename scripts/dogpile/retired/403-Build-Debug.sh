#!/bin/bash

################################################################################
# This script builds llama.cpp with Mmojo Server extensions for the CPU of the
# build environment machine. This is a debug build with no CPU optimizations.
# Thank you to Georgi Gerganov and his team for llama.cpp!
#
# https://github.com/ggml-org/llama.cpp
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

cd $DOGPILE_BUILD_DIR

# TO-DO: Some way to add -DCMAKE_VERBOSE_MAKEFILE=ON  on the fly to all these.

rm -r -f $DOGPILE_BUILD_DIR/$BUILD_DEBUG
cmake -B $BUILD_DEBUG -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_BUILD_TYPE=Debug # -DCMAKE_VERBOSE_MAKEFILE=ON 
cmake --build $BUILD_DEBUG

# Show off what we built
printf "\nBuild of debug version of llama.cpp is complete.\n\n"
printf "\$ ls -al $DOGPILE_BUILD_DIR/$BUILD_DEBUG/bin/\n"
ls -al $DOGPILE_BUILD_DIR/$BUILD_DEBUG/bin
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
