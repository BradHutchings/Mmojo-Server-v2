## 11. Clone Mmojo Server Repo

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step
Let's get started by cloning the Mmojo Server Repo, so we have scripts available to do all the documented steps.

As we work, we will update our local copy of the repo before performing each step.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Clone the Mmojo Server Repo

Clone the Mmojo Server repo:
```
cd $HOME
export MMOJO_SERVER_DIR="$HOME/11-mmojo-server"
if [ ! -d "$MMOJO_SERVER_DIR" ]; then
  mkdir -p $MMOJO_SERVER_DIR
  git clone https://github.com/BradHutchings/mmojo-server-v2.git $MMOJO_SERVER_DIR
fi
printf "\n**********\n*\n* FINISHED: Clone the Mmojo Server Repo.\n*\n**********\n\n"
```

#### Optional: Use the `work-in-progress` branch where I implement and test my own changes and where I test upstream changes from `llama.cpp`.

*This SHOULD be a script in the repo. We show the script optionally.*

```
cd $MMOJO_SERVER_DIR
git checkout work-in-progress
cd $HOME
printf "\n**********\n*\n* FINISHED: Checkout work-in-progress.\n*\n**********\n\n"
```

---
### Proceed
- **Next:** [12. Set Timezone](12-Set-Timezone.md)
- **Previous:** This is the first article in this section.
- **Up:** [10. Prepare Build Environment](10-Prepare-Build-Environment.md)
