## 423. Build CPU (Native)
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your build environment platform with native CPU optimizations enabled, but no GPU support.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

**Shortcut:** [Scroll down](#shortcut-build-cpu-test).

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
### Build CPU Mmojo Server for Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/420-Build-CPU.sh" target="_blank">420-Build-CPU.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/420-Build-CPU.sh native
  ```

---
### Test the Build
Requires previously downloaded model to the `$MODELS_DIR` directory. We test with command-line arguments.
- View the script: <a href="../scripts/420-Test-CPU.sh" target="_blank">420-Test-CPU.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/420-Test-CPU.sh native
  ```

---
<details>
  <summary><b>Optional: Copy CPU Build to Mmojo Share.</b></summary>

Copy this build to your Mmojo Share for packaging later. 
- View the script: <a href="../scripts/420-Copy-CPU-Build-to-Mmojo-Share.sh" target="_blank">420-Copy-CPU-Build-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/420-Copy-CPU-Build-to-Mmojo-Share.sh native
  ```
</details>

---
### SHORTCUT: Build CPU, Test
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
$MMOJO_SERVER_SCRIPTS/420-Build-CPU.sh native
$MMOJO_SERVER_SCRIPTS/420-Test-CPU.sh native
```

---
### SHORTCUT: Build CPU, Copy to Mmojo Share, Test
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
$MMOJO_SERVER_SCRIPTS/420-Build-CPU.sh performant
$MMOJO_SERVER_SCRIPTS/420-Copy-CPU-Build-to-Mmojo-Share.sh performant
$MMOJO_SERVER_SCRIPTS/420-Test-CPU.sh performant
```

---
### Proceed
- **Next:** [431. Build CUDA](431-Build-CUDA.md)
- **Previous:** [422. Build CPU (Performant)](422-Build-CPU-Performant.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
