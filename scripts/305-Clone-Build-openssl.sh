#!/bin/bash

mkdir -p ~/$BUILD_OPENSSSL_DIR
cd ~/$BUILD_OPENSSSL_DIR
cp -r ~/$COSMO_DIR .

export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
export CC="cosmocc -I$(pwd)/cosmocc/include -L$(pwd)/cosmocc/lib -O3 $EXTRA_FLAGS "
export CXX="cosmocc -I$(pwd)/cosmocc/include \
    -I$(pwd)/cosmocc/include/third_party/libcxx \
    -L$(pwd)/cosmocc/lib -L$(pwd)/openssl -O3 $EXTRA_FLAGS"
export AR="cosmoar"
cd ~/$BUILD_OPENSSSL_DIR
cp -r /usr/include/openssl/ ./cosmocc/include/

# Copy the right one. This might not get the right one if cross-platform build installed.
# Or, put it in mmojo-server support files and copy that instead?
cp -r /usr/include/x86_64-linux-gnu/openssl/* ./cosmocc/include/openssl
cp -r /usr/include/aarch64-linux-gnu/openssl/* ./cosmocc/include/openssl

git clone https://github.com/openssl/openssl.git
cd ~/$BUILD_OPENSSSL_DIR/openssl
./Configure no-asm no-dso no-afalgeng no-shared no-pinshared no-apps
make
cd ~/$BUILD_OPENSSSL_DIR
export PATH=$SAVE_PATH

printf "\n**********\n*\n* FINISHED: 305-Clone-Build-openssl.sh.\n*\n**********\n\n"
