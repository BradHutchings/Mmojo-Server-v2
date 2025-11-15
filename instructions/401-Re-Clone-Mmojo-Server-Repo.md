## 401. Re-Clone Local Mmojo Server Repo
### About this Step
Before gathering build pieces, let's make sure our local copy of the Mmojo Server repo is up to date with the latest instructions and scripts. We'll re-clone the repo for simplicity. You don't need to do this if you've created your build environment today.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Clone the Mmojo Server Repo

Clone the Mmojo Server repo:
```
export MMOJO_SERVER_DIR="$HOME/200-mmojo-server"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"
export HOME_SCRIPTS="$HOME/scripts"
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

<!--
I am the the only one who should be using this. It just complicated and confuses things to add into the mix. -Brad

#### Optional: Use the work-in-progress branch.
The **work-in-progress** branch is where I implement and test my own changes and where I test upstream changes from **llama.cpp**.

This script switches to the **work-in-progress** branch:
- View script: <a href="../scripts/mm-work-in-progress-branch.sh" target="_blank">mm-work-in-progress-branch.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  mm-work-in-progress-branch.sh
  . mm-environment-variables.sh
  ```
-->

---
### Proceed
- **Next:** [402. Prepare to Build](402-Prepare-to-Build.md)
- **Previous:** This is the first step in this section.
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
