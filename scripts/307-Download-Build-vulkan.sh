#!/bin/sh

mkdir $BUILD_VULKAN_DIR
cd $BUILD_VULKAN_DIR
wget https://sdk.lunarg.com/sdk/download/$VULKAN_VERSION/linux/vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.xz
tar xf vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.xz
cd $VULKAN_VERSION/
source setup-env.sh 

# unset CC; export CC
# unset CXX; export CXX
sed -i -e 's/apt-get update/apt-get update || true/g' vulkansdk

SIMULTANEOUS_COMPILES=$VULKAN_SIMULTANEOUS_COMPILES
if [[ -z "${SIMULTANEOUS_COMPILES}" ]]; then
  SIMULTANEOUS_COMPILES=4
fi
./vulkansdk -j $SIMULTANEOUS_COMPILES

printf "\n**********\n*\n* FINISHED: 307-Download-Build-vulkan.sh.\n*\n**********\n\n"
