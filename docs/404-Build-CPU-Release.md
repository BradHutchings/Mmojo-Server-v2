## 404. Build CPU Release
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your native build environment platform with CPU optimizations enabled, but no GPU support.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Build CPU Release Mmojo Server for Native Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/404-Build-CPU-Release.sh" target="_blank">404-Build-CPU-Release.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/404-Build-CPU-Release.sh
  ```

---
### OPTIONAL: Test the Build
Requires previously downloaded model to the `$MODELS_DIR` directory. We test with command-line arguments.
- View the script: <a href="../scripts/404-Test-CPU-Release.sh" target="_blank">404-Test-CPU-Release.sh</a>.
- Run the script.
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/404-Test-CPU-Release.sh
  ```

---
### OPTIONAL: Remove Test Directories
- View the script: <a href="../scripts/404-Delete-CPU-Release-Tests.sh" target="_blank">404-Delete-CPU-Release-Tests.sh</a>.
- Run the script.
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/404-Delete-CPU-Release-Tests.sh
  ```
  
---
### Proceed
- **Next:** [405. Build APE](405-Build-APE.md)
- **Previous:** [403. Build CPU Debug](403-Build-CPU-Debug.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
