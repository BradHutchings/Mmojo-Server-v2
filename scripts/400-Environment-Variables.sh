# Environment Variables corresponding to the "300. Build Mmojo Server" section. 

cd $HOME
export MODELS_DIR="$HOME/301-MODELS"
export BUILD_COSMOPOLITAN_DIR="$HOME/302-BUILD-cosmopolitan"
export COSMOCC_DIR="$HOME/$BUILD_COSMOPOLITAN_DIR/cosmocc"
export BUILD_LLAMAFILE_DIR="$HOME/303-BUILD-llamafile"
export BUILD_OPENSSSL_DIR="$HOME/304-BUILD-openssl"
export BUILD_LLAMA_CPP_DIR="$HOME/400-BUILD-lamma-cpp"
export MMOJO_SERVER_DIR="$BUILD_LLAMA_CPP_DIR/mmojo-server"
if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
