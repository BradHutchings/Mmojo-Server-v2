#!/bin/bash

mm-mount-mmojo-share.sh
sudo mkdir -p MMOJO_SHARE_BUILDS
sudo mkdir -p MMOJO_SHARE_BUILDS_APE
sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_X86_64/bin/mmojo-server $MMOJO_SHARE_BUILDS_APE/mmojo-server-x86_64

printf "\n**********\n*\n* FINISHED: 404-Copy-Cosmo-x86_64-to-Mmojo-Share.sh.\n*\n**********\n\n"
