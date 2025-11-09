## 202. Clone Mmojo Server Repo
### About this Step
Let's get started by cloning the Mmojo Server Repo, so we have scripts available to do all the documented steps.

As we work, we will update our local copy of the repo before performing each step.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Clone the Mmojo Server Repo

Clone the Mmojo Server repo:
```
export MMOJO_SERVER_DIR="$HOME/201-mmojo-server"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"
cd $HOME
if [ ! -d "$MMOJO_SERVER_DIR" ]; then
  mkdir -p $MMOJO_SERVER_DIR
  git clone https://github.com/BradHutchings/mmojo-server-v2.git $MMOJO_SERVER_DIR
  . $MMOJO_SERVER_SCRIPTS/mm-update-local-mmojo-server-repo.sh
fi
printf "\n**********\n*\n* FINISHED: Clone the Mmojo Server Repo.\n*\n**********\n\n"
```

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
  ```

---
### Proceed
- **Next:** [203. Set Timezone](203-Set-Timezone.md)
- **Previous:** [201. Create Scripts and Tools Directories](201-Create-Scripts-and-Tools-Directories.md)
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
