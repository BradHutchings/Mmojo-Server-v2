#!/bin/bash

WD=$(pwd)
cd $MMOJO_SERVER_DIR
git pull
cd $WD
printf "\n**********\n*\n* FINISHED: mmojo-update-local-repo.\n*\n**********\n\n"
