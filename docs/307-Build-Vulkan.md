## 307. Build Vulkan

Brad Hutchings<br/>
brad@bradhutchings.com

### About this Step
Vulkan is a newer industry standard API to help applications work seamlessly with GPUs from different vendors. GPU vendors provide Vulkan interfaces for their GPUs, which are loaded dynamically by applications which use the Vulkan API. It should be the easiest way to add GPU support to your builds for any particular device you have. However:

- Metal support on Mac M* chips is provided through a third-party open source project.
- Many systems with small GPUs do not support a large enough `maxComputeSharedMemorySize` in Vulkan for llama.cpp to work with it. Such systems include Raspberry Pi 5 and Intel Iris Xe built-in graphics.
- Since Vulkan interfaces with a dynamic library, we can't link to it with cross-platform and cross-architecture Cosmo builds.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Environment Variables
```
cd ~
BUILD_VULKAN_DIR="25-BUILD-vulkan"
VULKAN_VERSION="1.4.328.1"
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
```

---
### Create Vulkan Directory
```
mkdir ~/$BUILD_VULKAN_DIR
cd ~/$BUILD_VULKAN_DIR
printf "\n**********\n*\n* FINISHED: Create Vulkan Directory.\n*\n**********\n\n"
```

---
### Build Vulkan
```
cd ~/$BUILD_VULKAN_DIR
wget https://sdk.lunarg.com/sdk/download/$VULKAN_VERSION/linux/vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.xz
tar xf vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.xz
cd $VULKAN_VERSION/
source setup-env.sh 
unset CC; export CC
unset CXX; export CXX
sed -i -e 's/apt-get update/apt-get update || true/g' vulkansdk
printf "\n**********\n*\n* FINISHED: Prepare to Build Vulkan.\n*\n**********\n\n"
```

```
./vulkansdk -j 8
printf "\n**********\n*\n* FINISHED: Build Vulkan.\n*\n**********\n\n"
```

```
./vulkansdk -j 4
printf "\n**********\n*\n* FINISHED: Build Vulkan.\n*\n**********\n\n"
```

---
### Make Script for Using Vulkan
```
cat << EOF > ~/scripts/Setup-Vulkan-Env.sh
source ~/$BUILD_VULKAN_DIR/$VULKAN_VERSION/setup-env.sh
EOF
chmod a+x ~/scripts/Setup-Vulkan-Env.sh
```

---
### Proceed
- **Next:** This is the last article in this section.
- **Previous:** [306. Build OpenSSL](306-Build-OpenSSL.md)
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
### Next Section
- **Next Section:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)
