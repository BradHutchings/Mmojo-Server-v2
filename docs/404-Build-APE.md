## 404. Build APE

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step

In this step, we will build Mmojo Server (`mmojo-server-ape`) for x86_64 and arm64. We will then package them in an Actual Portable Executable (APE) file which can run cross platform and cross artchitecture. 

The APE will run on x86 and ARM CPUs, and Windows, Linux, and macOS operating systems. As a zip file, the APE can also hold configuration files and .gguf models. The APE will not perform as well as platform-specifc builds. It does not have the most optimized GGML CPU code and does not use GGML GPU options. Tradeoffs.

**Where:** Perform this step in either or both your x86_64 and your aarch64 (arm64) build environments. The resulting APE file will be copied to your Mmojo SMB share.

---
### Build Mmojo Server for x86_64
This script uses cmake CMake to build Mmojo Server with `cosmocc` for x86_64. Note that we make a temporary change to `common/CMakeLists.txt` to statically link with OpenSSL libraries.
- View script: <a href="../scripts/404-Build-Cosmo-x86_64.sh" target="_blank">404-Build-Cosmo-x86_64.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/404-Build-Cosmo-x86_64.sh
  ```

#### Optional: Test the x86_64 Build
If you're build enviornment is x86_64, you can test this build. Requires previously downloaded model to the `$MODELS_DIR` directory.
- View script: <a href="../scripts/404-Test-Cosmo-x86_64.sh" target="_blank">404-Test-Cosmo-x86_64.sh</a>.
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/404-Test-Cosmo-x86_64.sh
  ```

#### Optional: Copy to Your Mmojo Share
Copy this build to your Mmojo share for assembly into an APE later. This is particularly useful if you're building the x86_64 and aarch64 binaries in different build environments.
```
mm-mount-mmojo-share.sh
sudo mkdir -p /mnt/mmojo/builds
sudo mkdir -p /mnt/mmojo/builds/ape
sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_X86_64/bin/mmojo-server /mnt/mmojo/builds/ape/mmojo-server-x86_64
```

---
### Build Mmojo Server for aarch64 (arm64)
This script uses cmake CMake to build Mmojo Server with `cosmocc` for aarch64 (arm64). Note that we make a temporary change to `common/CMakeLists.txt` to statically link with OpenSSL libraries.
- View script: <a href="../scripts/404-Build-Cosmo-aarch64.sh" target="_blank">404-Build-Cosmo-aarch64.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/404-Build-Cosmo-aarch64.sh
  ```

#### Optional: Test the aarch64 (arm64) Build
If you're build enviornment is x86_64, you can test this build. Requires previously downloaded model to the `$MODELS_DIR` directory.
- View script: <a href="../scripts/404-Test-Cosmo-aarch64.sh" target="_blank">404-Test-Cosmo-aarch64.sh</a>.
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/404-Test-Cosmo-aarch64.sh
  ```

#### Optional: Copy to Your Mmojo Share
Copy this build to your Mmojo share for assembly into an APE later. This is particularly useful if you're building the x86_64 and aarch64 binaries in different build environments.
```
mm-mount-mmojo-share.sh
sudo mkdir -p /mnt/mmojo/builds
sudo mkdir -p /mnt/mmojo/builds/ape
sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64/bin/mmojo-server /mnt/mmojo/builds/ape/mmojo-server-aarch64
```

---
### Build mmojo-server Actual Portable Executable (APE)
Now that we have x86_64 and aarch64 (ARM64) builds, we can combine them into an Actual Portable Executable (APE) file.

#### Option 1: Assemble from Local Copies
Do this if you built both x86_64 and aarch64/arm64 in the same build environment.
```
# THIS DOES NOT WORK, NEEDS TO BE A SCRIPT
cd ~/$BUILD_MMOJO_SERVER_DIR
mkdir -p ~/$BUILD_MMOJO_SERVER_DIR/$BUILD_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
apelink \
	-l ~/$BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l ~/$BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_APE/mmojo-server-ape \
    $BUILD_COSMO_AMD64/bin/mmojo-server \
    $BUILD_COSMO_AARCH64/bin/mmojo-server
export PATH=$SAVE_PATH
printf "\n**********\n*\n* FINISHED: Build mmojo-server Actual Portable Executable (APE).\n*\n**********\n\n"
```

#### Option 2: Assemble from Your Mmojo Share
Do this if you built both x86_64 and aarch64/arm64 in different build environments and copied them to your Mmojo share.
```
# THIS DOES NOT WORK, NEEDS TO BE A SCRIPT
mount-mmojo-share.sh
cd ~/$BUILD_MMOJO_SERVER_DIR
mkdir -p ~/$BUILD_MMOJO_SERVER_DIR/$BUILD_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
apelink \
	-l ~/$BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l ~/$BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_APE/mmojo-server-ape \
    /mnt/mmojo/builds/ape/mmojo-server-x86_64 \
    /mnt/mmojo/builds/ape/mmojo-server-aarch64
export PATH=$SAVE_PATH
printf "\n**********\n*\n* FINISHED: Build mmojo-server Actual Portable Executable (APE).\n*\n**********\n\n"
```

---
#### Optional: Copy to Your Mmojo Share
Copy this build to your Mmojo share for assembly into an APE later. This is particularly useful if you're building the x86_64 and aarch64 binaries in different build environments.
```
mm-mount-mmojo-share.sh
sudo mkdir -p /mnt/mmojo/builds
sudo mkdir -p /mnt/mmojo/builds/ape
sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_APE/mmojo-server-ape /mnt/mmojo/builds/ape/mmojo-server-ape
```

<!--
```
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
export CC="x86_64-unknown-cosmo-cc -I$(pwd)/cosmocc/include -L$(pwd)/cosmocc/lib \
    -DCOSMOCC=1 -nostdinc -O3 $EXTRA_FLAGS "
export CXX="x86_64-unknown-cosmo-c++ -I$(pwd)/cosmocc/include \
    -DCOSMOCC=1 -nostdinc -nostdinc++ -O3 -Wno-format-truncation $EXTRA_FLAGS \
    -I$(pwd)/cosmocc/include/third_party/libcxx \
    -I$(pwd)/openssl/include \
    -L$(pwd)/cosmocc/lib -L$(pwd)/openssl"
export AR="cosmoar"
cp common/CMakeLists.txt common/CMakeLists-orig.txt
sed -i -e 's/PUBLIC OpenSSL::SSL OpenSSL::Crypto/PUBLIC libssl.a libcrypto.a/g' common/CMakeLists.txt
cmake -B $BUILD_COSMO_AMD64 -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_SYSTEM_PROCESSOR=x86_64
mv common/CMakeLists-orig.txt common/CMakeLists.txt
cmake --build $BUILD_COSMO_AMD64 --config Release
export PATH=$SAVE_PATH

printf "\n**********\n*\n* FINISHED: Build Mmojo Server for x86_64.\n*\n**********\n\n"
```
-->

<!--
---
### Environment Variables

Let's define some environment variables:
```
DOWNLOAD_DIR="21-DOWNLOAD"
BUILD_COSMOPOLITAN_DIR="22-BUILD-cosmopolitan"
BUILD_LLAMAFILE_DIR="23-BUILD-llamafile"
BUILD_OPENSSSL_DIR="24-BUILD-openssl"
BUILD_MMOJO_SERVER_DIR="40-BUILD-mmojo"
COSMO_DIR="$BUILD_COSMOPOLITAN_DIR/cosmocc"
BUILD_COSMO_AMD64="build-cosmo-amd64"
BUILD_COSMO_AARCH64="build-cosmo-aarch"
BUILD_APE="build-ape"
EXTRA_FLAGS=""
if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi
cd ~/$BUILD_MMOJO_SERVER_DIR
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
```

_Note that if you copy each code block from the guide and paste it into your terminal, each block ends with a message so you won't lose your place in this guide._

---
### Build Mmojo Server for x86_64.
We now use CMake to build Mmojo Server for x86_64. Note that we make a temporary change to `common/CMakeLists.txt` to statically link with OpenSSL libraries.
```
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
export CC="x86_64-unknown-cosmo-cc -I$(pwd)/cosmocc/include -L$(pwd)/cosmocc/lib \
    -DCOSMOCC=1 -nostdinc -O3 $EXTRA_FLAGS "
export CXX="x86_64-unknown-cosmo-c++ -I$(pwd)/cosmocc/include \
    -DCOSMOCC=1 -nostdinc -nostdinc++ -O3 -Wno-format-truncation $EXTRA_FLAGS \
    -I$(pwd)/cosmocc/include/third_party/libcxx \
    -I$(pwd)/openssl/include \
    -L$(pwd)/cosmocc/lib -L$(pwd)/openssl"
export AR="cosmoar"
cp common/CMakeLists.txt common/CMakeLists-orig.txt
sed -i -e 's/PUBLIC OpenSSL::SSL OpenSSL::Crypto/PUBLIC libssl.a libcrypto.a/g' common/CMakeLists.txt
cmake -B $BUILD_COSMO_AMD64 -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_SYSTEM_PROCESSOR=x86_64
mv common/CMakeLists-orig.txt common/CMakeLists.txt
cmake --build $BUILD_COSMO_AMD64 --config Release
export PATH=$SAVE_PATH

printf "\n**********\n*\n* FINISHED: Build Mmojo Server for x86_64.\n*\n**********\n\n"
```

#### Optional: Test the build if you're building on an x86 system.
If you've previously downloaded a model to the `1-DOWNLOAD` folder, you can test the build.
```
rm -f mmojo-server-args
rm -r -f mmojo-server-support
./$BUILD_COSMO_AMD64/bin/mmojo-server --model ~/$DOWNLOAD_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf \
    --path completion-ui/ --default-ui-endpoint "chat" --host 0.0.0.0 --port 8080 --batch-size 64 \
    --threads-http 8 --ctx-size 0 --mlock
```

#### Optional: Copy to Your Mmojo Share
Copy this build to your Mmojo share for assembly into an APE later. This is particularly useful if you're building the x86_64 and aarch64 binaries in different build environments.
```
mount-mmojo-share.sh
sudo mkdir -p /mnt/mmojo/builds
sudo mkdir -p /mnt/mmojo/builds/ape
sudo cp -f ./$BUILD_COSMO_AMD64/bin/mmojo-server /mnt/mmojo/builds/ape/mmojo-server-x86_64
```

---
### Build Mmojo Server for ARM64.
We now use CMake to build Mmojo Server for ARM64. Note that we make a temporary change to `common/CMakeLists.txt` to statically link with OpenSSL libraries.
```
cd ~/$BUILD_MMOJO_SERVER_DIR
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
export CC="aarch64-unknown-cosmo-cc -I$(pwd)/cosmocc/include -L$(pwd)/cosmocc/lib \
    -DCOSMOCC=1 -nostdinc -O3 $EXTRA_FLAGS "
export CXX="aarch64-unknown-cosmo-c++ -I$(pwd)/cosmocc/include \
    -DCOSMOCC=1 -nostdinc -nostdinc++ -O3 -Wno-format-truncation $EXTRA_FLAGS \
    -I$(pwd)/cosmocc/include/third_party/libcxx \
    -I$(pwd)/openssl/include \
    -L$(pwd)/cosmocc/lib -L$(pwd)/openssl/.aarch64/"
export AR="cosmoar"
cp common/CMakeLists.txt common/CMakeLists-orig.txt
sed -i -e 's/PUBLIC OpenSSL::SSL OpenSSL::Crypto/PUBLIC libssl.a libcrypto.a/g' common/CMakeLists.txt
cmake -B $BUILD_COSMO_AARCH64 -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_SYSTEM_PROCESSOR=aarch64
mv common/CMakeLists-orig.txt common/CMakeLists.txt
cmake --build $BUILD_COSMO_AARCH64 --config Release
export PATH=$SAVE_PATH

printf "\n**********\n*\n* FINISHED: Build Mmojo Server for ARM.\n*\n**********\n\n"
```

#### Optional: Test the build if you're building on an aarch64/arm64 system.
If you've previously downloaded a model to the `1-DOWNLOAD` folder, you can test the build.
```
rm -f mmojo-server-args
rm -r -f mmojo-server-support
./$BUILD_COSMO_AARCH64/bin/mmojo-server --model ~/$DOWNLOAD_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf \
    --path completion-ui/ --default-ui-endpoint "chat" --host 0.0.0.0 --port 8080 --batch-size 64 \
    --threads-http 8 --ctx-size 0 --mlock
```

#### Optional: Copy to Your Mmojo Share
Copy this build to your Mmojo share for assembly into an APE later. This is particularly useful if you're building the x86_64 and aarch64 binaries in different build environments.
```
mount-mmojo-share.sh
sudo mkdir -p /mnt/mmojo/builds
sudo mkdir -p /mnt/mmojo/builds/ape
sudo cp -f ./$BUILD_COSMO_AARCH64/bin/mmojo-server /mnt/mmojo/builds/ape/mmojo-server-aarch64
```

---
### Build mmojo-server Actual Portable Executable (APE)
Now that we have amd64 (x86) and aarch64 (ARM) builds, we can combine them into an Actual Portable Executable (APE) file.

#### Option 1: Assemble from Local Copies
Do this if you built both x86_64 and aarch64/arm64 in the same build environment.
```
cd ~/$BUILD_MMOJO_SERVER_DIR
mkdir -p ~/$BUILD_MMOJO_SERVER_DIR/$BUILD_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
apelink \
	-l ~/$BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l ~/$BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_APE/mmojo-server-ape \
    $BUILD_COSMO_AMD64/bin/mmojo-server \
    $BUILD_COSMO_AARCH64/bin/mmojo-server
export PATH=$SAVE_PATH
printf "\n**********\n*\n* FINISHED: Build mmojo-server Actual Portable Executable (APE).\n*\n**********\n\n"
```

#### Option 2: Assemble from Your Mmojo Share
Do this if you built both x86_64 and aarch64/arm64 in different build environments and copied them to your Mmojo share.
```
mount-mmojo-share.sh
cd ~/$BUILD_MMOJO_SERVER_DIR
mkdir -p ~/$BUILD_MMOJO_SERVER_DIR/$BUILD_APE
export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
apelink \
	-l ~/$BUILD_COSMOPOLITAN_DIR/o/x86_64/ape/ape.elf \
	-l ~/$BUILD_COSMOPOLITAN_DIR/o/aarch64/ape/ape.elf \
	-o $BUILD_APE/mmojo-server-ape \
    /mnt/mmojo/builds/ape/mmojo-server-x86_64 \
    /mnt/mmojo/builds/ape/mmojo-server-aarch64
export PATH=$SAVE_PATH
printf "\n**********\n*\n* FINISHED: Build mmojo-server Actual Portable Executable (APE).\n*\n**********\n\n"
```

#### Optional: Test the APE.
Let's test our combined build:
```
rm -f mmojo-server-args
rm -r -f mmojo-server-support
./$BUILD_APE/mmojo-server-ape --model ~/$DOWNLOAD_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf \
    --path completion-ui/ --default-ui-endpoint "chat" --host 0.0.0.0 --port 8080 --batch-size 64 \
    --threads-http 8 --ctx-size 0 --mlock
```
-->


---
### Proceed
- **Next:** [405. Build linux x86_64](405-Build-linux-x86_64.md)
- **Previous:** [403. Build Test](403-Build-Test.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)
