#!/bin/bash

cd $BUILD_LLAMA_CPP_DIR

mm-mount-mmojo-share.sh
sudo mkdir -p $MMOJO_SHARE_BUILDS
sudo mkdir -p $MMOJO_SHARE_BUILDS_APE

mkdir -p $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
apelink \
	-l $BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l $BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mmojo-server-ape \
    $MMOJO_SHARE_BUILDS_APE/mmojo-server-x86_64  \
    $MMOJO_SHARE_BUILDS_APE/mmojo-server-aarch64
    
export PATH=$SAVE_PATH

cd $HOME

printf "\n**********\n*\n* FINISHED: 404-Assemble-Cosmo-APE-Mmojo-Share.sh.\n*\n**********\n\n"
