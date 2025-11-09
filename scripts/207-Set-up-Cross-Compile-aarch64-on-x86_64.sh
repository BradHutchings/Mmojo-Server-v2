#!/bin/bash

sudo dpkg --add-architecture arm64
sudo cat << EOF > ubuntu-arm64.sources
Types: deb
URIs: http://ports.ubuntu.com/ubuntu-ports/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Architectures: arm64
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF
sudo mv ubuntu-arm64.sources /etc/apt/sources.list.d/ubuntu-arm64.sources
sudo apt update
sudo apt install -y libssl-dev:arm64
sudo apt install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu binutils-aarch64-linux-gnu

printf "\n**********\n*\n* FINISHED: 207-Set-up-Cross-Compile-aarch64-on-x86_64.sh.\n*\n**********\n\n"
