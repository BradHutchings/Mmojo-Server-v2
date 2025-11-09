## 402. Prepare to Build
### About this Step

In this step, we will clone this Mmojo-Server repo, fix problems that affect building with Cosmopolitan, and add some features for Mmojo Server.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Optional: Use `work-in-progress` Branch of Mmojo Server Repo
Use the `work-in-progress` branch where I implement and test my own changes and where I test changes from `llama.cpp`.
```
. mm-work-in-progress-branch.sh
```

---
### Clone Repos
Clone llama.cpp repo and repos upon which it depends into a `$BUILD_LLAMA_CPP_DIR` directory.

This script clones the llama.cpp repo and repos upon which it depends into the `$BUILD_LLAMA_CPP_DIR` directory:
- View the script: <a href="../scripts/402-Clone-Repos.sh" target="_blank">402-Clone-Repos.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/402-Clone-Repos.sh
  ```

---
### Patch llama.cpp Source Code and Build Code
This looks like lots of fun.
- View the script: <a href="../scripts/402-Fix-llama-cpp.sh" target="_blank">402-Fix-llama-cpp.sh</a>.
- Run the script.
  ```
  . $MMOJO_SERVER_SCRIPTS/402-Fix-llama-cpp.sh
  ```

---
### Customize WebUI
#### Suggested
Rollback the `tools/server/webui` to the pre-Svelte version. The new Svelte UI doesn't like running on non-root web server path. We'll remove this step when the new UI is fixed upstream in llama.cpp.
- View the script: <a href="../scripts/402-Rollback-webui.sh" target="_blank">402-Rollback-webui.sh</a>.
- Run the script.
  ```
  . $MMOJO_SERVER_SCRIPTS/402-Rollback-webui.sh
  ```

#### Required
Customize the web UI, rebuild all the web files. If you did the **Suggested** step above, you will see 2 `sed` errors.
- View the script: <a href="../scripts/402-Customize-webui.sh" target="_blank">402-Customize-webui.sh</a>.
- Run the script.
  ```
  . $MMOJO_SERVER_SCRIPTS/402-Customize-webui.sh
  ```
#### Uh. Oh. npm Spit Out Errors

You may have an earlier version of `npm` and `nodejs` installed on your build machine than are required
for that customization step. If you're running Linux or macOS, these steps should clean that up.

**ONLY RUN THESE IF YOU HAD PROBLEMS IN THE PREVIOUS STEP!!** Then rerun the previous step.
```
cd ~
sudo apt remove nodejs npm -y
sudo apt install nodejs npm -y
sudo npm install -g node@latest
sudo npm install -g npm@latest
cd ~/$BUILD_MMOJO_SERVER_DIR
```

---
### Proceed
- **Next:** [403. Build CPU Test](403-Build-CPU-Test.md)
- **Previous:** [401. Update Local Mmojo Server Repo](401-Update-Local-Mmojo-Server-Repo.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
