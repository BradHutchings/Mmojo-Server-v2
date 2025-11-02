# Environment Variables corresponding to the "300. Build Mmojo Server" section. 

cd $HOME
export MODELS_DIR="$HOME/302-MODELS"
export BUILD_COSMOPOLITAN_DIR="$HOME/303-BUILD-cosmopolitan"
export COSMOCC_DIR="$HOME/$BUILD_COSMOPOLITAN_DIR/cosmocc"
export BUILD_LLAMAFILE_DIR="$HOME/304-BUILD-llamafile"
export BUILD_OPENSSSL_DIR="$HOME/305-BUILD-openssl"
export BUILD_VULKAN_DIR="$HOME/306-BUILD-openssl"
if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
