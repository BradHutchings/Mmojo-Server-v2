## 101. Clone Mmojo Server Repo

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step
Let's get started by cloning the Mmojo Server Repo, so we have scripts available to do all the documented steps.

As we work, we will update our local copy of the repo before performing each step.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Environment Variables
Copy this script and paste it into your terminal to set environment variables.
```
cd $HOME
export MMOJO_SERVER_DIR="$HOME/101-mmojo-server"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"
```

---
### Clone the Mmojo Server Repo

Clone the Mmojo Server repo:
```
cd $HOME
if [ ! -d "$MMOJO_SERVER_DIR" ]; then
  mkdir -p $MMOJO_SERVER_DIR
  git clone https://github.com/BradHutchings/mmojo-server-v2.git $MMOJO_SERVER_DIR
fi
printf "\n**********\n*\n* FINISHED: Clone the Mmojo Server Repo.\n*\n**********\n\n"
```

#### Optional: Use the work-in-progress branch.
The **work-in-progress** branch is where I implement and test my own changes and where I test upstream changes from **llama.cpp**.

This script switches to the **work-in-progress** branch:
- View script: <a href="../scripts/101-work-in-progress-branch.sh" target="_blank">101-work-in-progress-branch.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script:
  ```
  bash $MMOJO_SERVER_SCRIPTS/101-work-in-progress-branch.sh
  ```

<!--
This script switches to the **work-in-progress** branch:
```
cd $MMOJO_SERVER_DIR
git checkout work-in-progress
cd $HOME
printf "\n**********\n*\n* FINISHED: Checkout work-in-progress.\n*\n**********\n\n"
```
-->
---
### Proceed
- **Next:** [102. Set Timezone](102-Set-Timezone.md)
- **Previous:** This is the first article in this section.
- **Up:** [100. Prepare Build Environment](100-Prepare-Build-Environment.md)
