#!/bin/bash

################################################################################
# This script rebuilds the chat web UI so that it can be customized and used 
# with Mmojo Server.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

cd $BUILD_DIR

APP_NAME='Mmojo Chat'
sed -i -e "s/>llama.cpp<\/h1>/>$APP_NAME<\/h1>/g" tools/server/webui/src/lib/components/app/chat/ChatScreen/ChatScreen.svelte
sed -i -e "s/>llama.cpp<\/h1>/>$APP_NAME<\/h1>/g" tools/server/webui/src/lib/components/app/chat/ChatSidebar/ChatSidebar.svelte
cp tools/server/public/loading-mmojo.html ./loading-mmojo.html
SAVE_WD=$(pwd)
cd tools/server/webui
npm i
npm run build
cd $SAVE_WD
mv loading-mmojo.html tools/server/public/loading-mmojo.html

TODAY=$(date +%Y-%m-%d)
cp -r Mmojo-Complete Mmojo-Complete-original
sed -i -e "s/\[\[UPDATED\]\]/$TODAY/g" Mmojo-Complete/scripts.js
sed -i -e "s/\[\[UPDATED\]\]/$TODAY/g" Mmojo-Complete/bookmark-scripts.js

cd $HOME

printf "\n**********\n*\n* FINISHED: $SCRIPT_NAME.\n*\n**********\n\n"

################################################################################
#  This is an original script for the Mmojo Server repo. It is covered by
#  the repo's MIT-style LICENSE:
#
#  https://github.com/BradHutchings/Mmojo-Server/blob/main/LICENSE
#
#  Copyright (c) 2025 Brad Hutchings.
#  --
#  Brad Hutchings
#  brad@bradhutchings.com
################################################################################
