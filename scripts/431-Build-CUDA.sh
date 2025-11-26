#!/bin/bash

################################################################################
# This script builds llama.cpp with Mmojo Server extensions for the CPU of the
# build environment machine and CUDA GPU support. Thank you to Georgi Gerganov 
# and his team for llama.cpp!
#
# https://github.com/ggml-org/llama.cpp
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

cd $BUILD_DIR

if [ "$BUILD_PROFILE" ]; then
    export CC="cc -pg "
    export CXX="c++ -pg "
fi

# TO-DO: Some way to add -DCMAKE_VERBOSE_MAKEFILE=ON  on the fly to all these.

rm -r -f $BUILD_DIR/$BUILD_CUDA
cmake -B $BUILD_CUDA -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_BUILD_TYPE=Release -DGGML_NATIVE=ON -DGGML_CUDA=ON # -DCMAKE_VERBOSE_MAKEFILE=ON 
cmake --build $BUILD_CUDA

# Show off what we built
printf "\nBuild of llama.cpp with CUDA support is complete.\n\n"
printf "\$ ls -al $BUILD_DIR/$BUILD_CUDA/bin/\n"
ls -al $BUILD_DIR/$BUILD_CUDA/bin
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
