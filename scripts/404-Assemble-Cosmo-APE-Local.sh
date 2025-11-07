#!/bin/bash

cd $BUILD_LLAMA_CPP_DIR

mkdir -p $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
apelink \
	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mmojo-server-ape \
    $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_X86_64/bin/mmojo-server \
    $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64/bin/mmojo-server
export PATH=$SAVE_PATH

cd $HOME

printf "\n**********\n*\n* FINISHED: 404-Assemble-Cosmo-APE-Local.sh.\n*\n**********\n\n"
