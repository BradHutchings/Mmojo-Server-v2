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
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1 $2.\n*\n$STARS\n\n"

$processor=$(uname -p)
variation=$1
branding=$2

if [ "$processor" == "arm64" ]; then
    processor="aarch64"
fi

if [ "$processor" != "x86_64" ] && [ "$processor" != "aarch64" ]; then
    processor="x86_64"
fi

if [ "$variation" != "compatible" ] && [ "$variation" != "performant" ] && [ "$variation" != "native" ]; then
    variation="native"
fi

if [ "$branding" != "dogpile" ]; then
    branding=""
fi

THIS_BUILD_DIR=$BUILD_DIR
if [ "$branding" == "dogpile" ]; then
    THIS_BUILD_DIR=$DOGPILE_BUILD_DIR
fi

ARCH_LEVEL_PARAM=""
BUILD_SUBDIRECTORY=""
if [ $processor == "x86_64" ]; then
    BUILD_SUBDIRECTORY="$BUILD_CPU_COMPATIBLE_X86_64"
    ARCH_LEVEL_PARAM=" -march=$ARCH_X86_64_COMPATIBLE "
    ARCH_LEVEL_PARAM=" -march=x86-64-v1 "
    if [ $variation == "performant" ]; then
        BUILD_SUBDIRECTORY="$BUILD_CPU_PERFORMANT_X86_64"
        ARCH_LEVEL_PARAM=" -march=$ARCH_X86_64_PERFORMANT  "
    elif [ $variation == "native" ]; then
        BUILD_SUBDIRECTORY="$BUILD_CPU_NATIVE_X86_64"
        ARCH_LEVEL_PARAM=" -march=$ARCH_X86_64_NATIVE  "
    fi
fi
if [ $processor == "aarch64" ]; then
    BUILD_SUBDIRECTORY="$BUILD_CPU_COMPATIBLE_AARCH64"
    ARCH_LEVEL_PARAM=" -march=$ARCH_AARCH64_COMPATIBLE "
    if [ $variation == "performant" ]; then
        BUILD_SUBDIRECTORY="$BUILD_CPU_PERFORMANT_AARCH64"
        ARCH_LEVEL_PARAM=" -march=$ARCH_AARCH64_PERFORMANT  "
    elif [ $variation == "native" ]; then
        BUILD_SUBDIRECTORY="$BUILD_CPU_NATIVE_AARCH64"
        ARCH_LEVEL_PARAM=" -march=$ARCH_AARCH64_PERFORMANT  "
    fi
fi

echo "   Processor: $processor"
echo "   Variation: $variation"
echo "    Branding: $branding"
echo "  arch param: $ARCH_LEVEL_PARAM"
echo "subdirectory: $BUILD_SUBDIRECTORY"
echo " building in: $THIS_BUILD_DIR/$BUILD_SUBDIRECTORY"
echo ""

if [ -d "$THIS_BUILD_DIR" ] && [ "$BUILD_SUBDIRECTORY" != "" ]; then
    cd $THIS_BUILD_DIR

    # TO-DO: Some way to add -DCMAKE_VERBOSE_MAKEFILE=ON  on the fly to all these.

    # TO-DO: Where does $ARCH_LEVEL_PARAM go?

    # This is dangerous if $BUILD_SUBDIRECTORY is ""! See "if" statement above.
    # -DGGML_NATIVE=ON
    rm -r -f $THIS_BUILD_DIR/$BUILD_SUBDIRECTORY
    cmake -B $BUILD_SUBDIRECTORY -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="$ARCH_LEVEL_PARAM" -DCMAKE_CXX_FLAGS="$ARCH_LEVEL_PARAM" \
        -DCMAKE_VERBOSE_MAKEFILE=ON 
    cmake --build $BUILD_SUBDIRECTORY

    # Show off what we built
    printf "\nBuild of CPU Test of llama.cpp is complete.\n\n"
    printf "\$ ls -al $THIS_BUILD_DIR/$BUILD_SUBDIRECTORY/bin/\n"
    ls -al $THIS_BUILD_DIR/$BUILD_SUBDIRECTORY/bin
    printf "\n"
fi

cd $HOME

printf "\n$STARS\n*\n* FINISHED: $SCRIPT_NAME $1 $2.\n*\n$STARS\n\n"

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
