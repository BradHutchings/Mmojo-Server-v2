#!/bin/bash

################################################################################
# This script installs dependencies needed for building Mmojo Server.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

sudo apt install -y \
    bison build-essential clang-format cmake g++ \
    gcc git libbz2-dev libffi-dev libglm-dev \
    liblz4-dev liblzma-dev libpciaccess0 libpng-dev libreadline-dev \
    libsqlite3-dev libssl-dev libwayland-dev libx11-dev libx11-xcb-dev \
    libxcb-cursor-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-ewmh-dev libxcb-keysyms1-dev \
    libxcb-present0 libxcb-randr0-dev libxcb-xinerama0 libxcb-xinput0 libxml2-dev \
    libxrandr-dev libzstd-dev ninja-build npm ocaml-core \
    pkg-config python3 python3-pip python3-tk qt5-qmake \
    qtbase5-dev qtbase5-dev-tools qtcreator tk-dev wayland-protocols \
    xz-utils zip zlib1g-dev 

printf "\n**********\n*\n* FINISHED: $SCRIPT_NAME.\n*\n**********\n\n"

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
