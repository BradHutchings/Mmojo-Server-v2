## 203. Clone Mmojo Server Repo
### About this Step
Let's get started by cloning the Mmojo Server repository from Github, so we have scripts available to do all the documented steps.

As we work, we will update our local copy of the repo at the start of each section.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Clone the Mmojo Server Repo

Clone the Mmojo Server repo:
```
export MMOJO_SERVER_DIR="$HOME/200-mmojo-server"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"
cd $HOME
if [ "$MMOJO_SERVER_DIR" ]; then
  rm -r -f $MMOJO_SERVER_DIR
fi
mkdir -p $MMOJO_SERVER_DIR
git clone https://github.com/BradHutchings/mmojo-server-v2.git $MMOJO_SERVER_DIR
. $MMOJO_SERVER_SCRIPTS/mm-update-local-mmojo-server-repo.sh
. mm-environment-variables.sh
printf "\n**********\n*\n* FINISHED: Clone the Mmojo Server Repo.\n*\n**********\n\n"
```

---
### Proceed
- **Next:** [204. Set Timezone](204-Set-Timezone.md)
- **Previous:** [202. Create Scripts and Tools Directories](202-Create-Scripts-and-Tools-Directories.md)
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
