## 403. Build CPU Only
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your native build environment platform without any GPU support. Even if you're more interested in APE builds or Vulkan builds, you can and should use this build to test and debug features of Mmojo Server that are not specific to any particular build.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Profiling
If you do not want to profile code for the test build, copy this snippet and paste into your terminal:
```
unset BUILD_PROFILE
```

If you want to profile code for the test build, copy this snippet copy this snippet and paste into your terminal:
```
export BUILD_PROFILE=1
```

---
### Build CPU Only Mmojo Server for Native Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/403-Build-CPU-Only.sh" target="_blank">403-Build-CPU-Only.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/403-Build-CPU-Only.sh
  ```

---
### OPTIONAL: Test the Build - Command-Line Arguments
Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/403-Test-CPU-Only-Command-Line.sh" target="_blank">403-Test-CPU-Only-Command-Line.sh</a>.
- Run the script.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/403-Test-CPU-Only-Command-Line.sh
  ```

---
### OPTIONAL: Test the Build - `mmojo-server-args` File
Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/403-Test-CPU-Only-mmojo-server-args.sh" target="_blank">403-Test-CPU-Only-mmojo-server-args.sh</a>.
- Run the script.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/403-Test-CPU-Only-mmojo-server-args.sh
  ```

---
### OPTIONAL: Test the Build - `mmojo-server-support` Directory
Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/403-Test-CPU-Only-mmojo-server-support.sh" target="_blank">403-Test-CPU-Only-mmojo-server-support.sh</a>.
- Run the script.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/403-Test-CPU-Only-mmojo-server-support.sh
  ```

---
### OPTIONAL: Remove Test Directories
- View the script: <a href="../scripts/403-Delete-CPU-Only-Tests.sh" target="_blank">403-Delete-CPU-Only-Tests.sh</a>.
- Run the script.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/403-Delete-CPU-Only-Tests.sh
  ```
  
---
### Proceed
- **Next:** [404. Build APE](404-Build-APE.md)
- **Previous:** [402. Prepare to Build](402-Prepare-to-Build.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
