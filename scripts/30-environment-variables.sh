# Environment Variables corresponding to the "30. Build Mmojo Server" section. 

cd ~
export DOWNLOAD_DIR="$HOME/21-DOWNLOAD"
export BUILD_COSMOPOLITAN_DIR="$HOME/22-BUILD-cosmopolitan"
export COSMOCC_DIR="$HOME/$BUILD_COSMOPOLITAN_DIR/cosmocc"
export BUILD_LLAMAFILE_DIR="$HOME/23-BUILD-llamafile"
export BUILD_OPENSSSL_DIR="$HOME/24-BUILD-openssl"
export BUILD_LLAMA_CPP_DIR="$HOME/30-BUILD-lamma-cpp"
export MMOJO_SERVER_DIR="$BUILD_LLAMA_CPP_DIR/mmojo-server"
if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
