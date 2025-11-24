## 407. Build CUDA
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your build environment platform with CPU optimizations enabled and CUDA GPU support enabled.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

**Shortcut:** [Scroll down](#shortcut-build-cuda-copy-to-mmojo-share-test).

**Note:** Compiler may complain about `-arch=native` in a Linux VM.

<!--
**Note:** This should be in the CUDA Toolkit step, maybe?!?
```
# Need to set this variable -OR- add "/usr/local/cuda-13.0/bin" to $PATH
export $CUDACXX="/usr/local/cuda-13.0/bin/nvcc"
```
-->

---
<details>
  <summary><b>Update Local Mmojo Server Repo</b> &mdash; Expand if you haven't today.</summary>
  
Have you updated your local clone of the Mmojo Server Repo today? If not, run this first:
```
mm-update-local-mmojo-server-repo.sh
. mm-environment-variables.sh
```
</details>

---
### Build CUDA Mmojo Server for Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/407-Build-CUDA.sh" target="_blank">407-Build-CUDA.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/407-Build-CUDA.sh
  ```

---
### Test the Build
Requires previously downloaded model to the `$MODELS_DIR` directory. We test with command-line arguments.
- View the script: <a href="../scripts/407-Test-CUDA.sh" target="_blank">407-Test-CUDA.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/407-Test-CUDA.sh
  ```

---
<details>
  <summary><b>Optional: Copy CUDA Build to Mmojo Share.</b></summary>

Copy this build to your Mmojo Share for packaging later. 
- View the script: <a href="../scripts/407-Copy-CUDA-Build-to-Mmojo-Share.sh" target="_blank">407-Copy-CUDA-Build-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/407-Copy-CUDA-Build-to-Mmojo-Share.sh
  ```
</details>

---
### SHORTCUT: Build CUDA, Copy to Mmojo Share, Test
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
$MMOJO_SERVER_SCRIPTS/407-Build-CUDA.sh
$MMOJO_SERVER_SCRIPTS/407-Copy-CUDA-Build-to-Mmojo-Share.sh
$MMOJO_SERVER_SCRIPTS/407-Test-CUDA.sh
```

---
### Proceed
- **Next:** [408. Build Vulkan](408-Build-Vulkan.md)
- **Previous:** [406. Build CPU (Native)](406-Build-CPU-Native.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
