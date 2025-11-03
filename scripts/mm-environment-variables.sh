# Environment Variables for preparing the build environment, building, and packaging.
# run this with: ". mm-environment-variables.sh"

cd $HOME
export MODELS_DIR="$HOME/302-MODELS"
export BUILD_COSMOPOLITAN_DIR="$HOME/303-BUILD-cosmopolitan"
export COSMOCC_DIR="$HOME/$BUILD_COSMOPOLITAN_DIR/cosmocc"
export BUILD_LLAMAFILE_DIR="$HOME/304-BUILD-llamafile"
export BUILD_OPENSSSL_DIR="$HOME/305-BUILD-openssl"
export BUILD_VULKAN_DIR="$HOME/306-BUILD-vulkan"

export BUILD_LLAMA_CPP_DIR="$HOME/400-BUILD-lamma-cpp"
export MMOJO_SERVER_DIR="$BUILD_LLAMA_CPP_DIR/mmojo-server"

if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi
printf "\n**********\n*\n* FINISHED: mm-environment-variables.\n*\n**********\n\n"
