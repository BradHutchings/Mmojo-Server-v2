## 24. Build OpenSSL

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step - DO THIS ONCE
We need to build our own `libssl.a` and `libcrypto.a` becuase:
1. Actual Portable Executable (APE) does not support dynamic loading of libraries.
2. The `libssl.a` and `libcrypto.a` we get by installing `libssl-dev` is built with `_FORTIFY_SOURCE` and will not link against Cosmo's `libc.a`.

This is how I understand the problem. My understanding might be incorrect, but it bears out in trying to find workarounds.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### OPTIONAL: Update from Mmojo Server Repo
(Instructions here to update your locally cloned repo. Run a script in the repo.)

---
### Environment Variables

Let's define some environment variables:
```
cd ~
DOWNLOAD_DIR="21-DOWNLOAD"
BUILD_COSMOPOLITAN_DIR="22-BUILD-cosmopolitan"
BUILD_LLAMAFILE_DIR="23-BUILD-llamafile"
BUILD_OPENSSSL_DIR="24-BUILD-openssl"
COSMO_DIR="$BUILD_COSMOPOLITAN_DIR/cosmocc"
EXTRA_FLAGS=""
if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
```

_Note that if you copy each code block from the guide and paste it into your terminal, each block ends with a message so you won't lose your place in this guide._

<!--
**Optional:** Set `$EXTRA_FLAGS` for profiling.
```
EXTRA_FLAGS=" -pg "
```
-->

---
### Create Build OpenSSL Directory
```
mkdir -p ~/$BUILD_OPENSSSL_DIR
cd ~/$BUILD_OPENSSSL_DIR
cp -r ~/$COSMO_DIR .
printf "\n**********\n*\n* FINISHED: Create Build Directory.\n*\n**********\n\n"
```

---
### Build OpenSSL with Cosmo
We need cross-architectire `libssl.a` and `libcrypto.a` static libraries to support SSL in Cosmo builds of `mmojo-server`.
```
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
export CC="cosmocc -I$(pwd)/cosmocc/include -L$(pwd)/cosmocc/lib -O3 $EXTRA_FLAGS "
export CXX="cosmocc -I$(pwd)/cosmocc/include \
    -I$(pwd)/cosmocc/include/third_party/libcxx \
    -L$(pwd)/cosmocc/lib -L$(pwd)/openssl -O3 $EXTRA_FLAGS"
export AR="cosmoar"
cd ~/$BUILD_OPENSSSL_DIR
cp -r /usr/include/openssl/ ./cosmocc/include/
cp -r /usr/include/x86_64-linux-gnu/openssl/* ./cosmocc/include/openssl
cp -r /usr/include/aarch64-linux-gnu/openssl/* ./cosmocc/include/openssl
git clone https://github.com/openssl/openssl.git
cd ~/$BUILD_OPENSSSL_DIR/openssl
./Configure no-asm no-dso no-afalgeng no-shared no-pinshared no-apps
make
cd ~/$BUILD_OPENSSSL_DIR
export PATH=$SAVE_PATH
printf "\n**********\n*\n* FINISHED: Build openssl with Cosmo.\n*\n**********\n\n"
```

---
### Proceed
- **Next:** [25. Build Vulkan](25-Build-Vulkan.md)
- **Previous:** [23. Build llamafile](23-Build-llamafile.md)
- **Up:** [20. Gather Build Pieces](20-Gather-Build-Pieces.md)
