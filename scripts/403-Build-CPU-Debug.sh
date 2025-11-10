#!/bin/bash

################################################################################
# This script builds llama.cpp with Mmojo Server extensions for the CPU of the
# build environment machine. Thank you to Georgi Gerganov and his team for
# llama.cpp!
#
# https://github.com/ggml-org/llama.cpp
#
# See licensing note at end.
################################################################################

cd $BUILD_LLAMA_CPP_DIR

if [ "$BUILD_PROFILE" ]; then
    export CC="cc -pg "
    export CXX="c++ -pg "
fi

# TO-DO: Some way to add -DCMAKE_VERBOSE_MAKEFILE=ON  on the fly to all these.

rm -r -f $BUILD_LLAMA_CPP_DIR/$BUILD_CPU_DEBUG
cmake -B $BUILD_CPU_DEBUG -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_BUILD_TYPE=Debug # -DCMAKE_VERBOSE_MAKEFILE=ON 
cmake --build $BUILD_CPU_DEBUG

# Show off what we built
printf "\nBuild of CPU Test of llama.cpp is complete.\n\n"
printf "\$ ls -al $BUILD_LLAMA_CPP_DIR/$BUILD_CPU_DEBUG/bin/\n"
ls -al $BUILD_LLAMA_CPP_DIR/$BUILD_CPU_DEBUG/bin
printf "\n"

cd $HOME

printf "\n**********\n*\n* FINISHED: 403-Build-CPU-Debug.sh.\n*\n**********\n\n"

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
