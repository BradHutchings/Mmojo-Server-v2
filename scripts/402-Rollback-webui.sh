#!/bin/bash

# This script rolls back the webui directory to the commit before the new Svelte based webui was introduced.
# Rolling back ensures we can run the chat web UI on a non-root endpoint.
# -Brad

cd $BUILD_LLAMA_CPP_DIR

rm -r -f tools/server/webui
git checkout 6c019cb04e86e2dacfe62ce7666c64e9717dde1f tools/server/webui/

APP_NAME='Mmojo Chat'
sed -i -e "s/>.*llama.cpp.*</>$APP_NAME</g" tools/server/webui/index.html
sed -i -e "s/>.*llama.cpp.*</>$APP_NAME</g" tools/server/webui/src/components/Header.tsx

cd $HOME

printf "\n**********\n*\n* FINISHED: 402-Rollback-webui.sh.\n*\n**********\n\n"
