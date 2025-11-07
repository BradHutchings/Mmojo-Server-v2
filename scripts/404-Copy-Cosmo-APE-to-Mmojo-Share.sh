#!/bin/bash

mm-mount-mmojo-share.sh
sudo mkdir -p MMOJO_SHARE_BUILDS
sudo mkdir -p MMOJO_SHARE_BUILDS_APE
sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/bin/mmojo-server-ape $MMOJO_SHARE_BUILDS_APE/mmojo-server-ape

printf "\n**********\n*\n* FINISHED: 404-Copy-Cosmo-APE-to-Mmojo-Share.sh.\n*\n**********\n\n"
