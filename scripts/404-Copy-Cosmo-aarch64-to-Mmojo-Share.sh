#!/bin/bash

mm-mount-mmojo-share.sh
sudo mkdir -p $MMOJO_SHARE_BUILDS
sudo mkdir -p $MMOJO_SHARE_BUILDS_APE
sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64/bin/mmojo-server $MMOJO_SHARE_BUILDS_APE/mmojo-server-aarch64

printf "\n**********\n*\n* FINISHED: 404-Copy-Cosmo-aarch64-to-Mmojo-Share.sh.\n*\n**********\n\n"
