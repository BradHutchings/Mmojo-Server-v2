## 406. Build CPU
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your build environment platform with CPU optimizations enabled, but no GPU support.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Build CPU Mmojo Server for Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/406-Build-CPU.sh" target="_blank">406-Build-CPU.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/406-Build-CPU.sh
  ```

#### Optional: Copy CPU Build to Mmojo Share
Copy this build to your Mmojo Share for packaging later. 
- View the script: <a href="../scripts/406-Copy-CPU-Build-to-Mmojo-Share.sh" target="_blank">406-Copy-CPU-Build-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/406-Copy-CPU-Build-to-Mmojo-Share.sh
  ```

---
### Optional: Test the Build
Requires previously downloaded model to the `$MODELS_DIR` directory. We test with command-line arguments.
- View the script: <a href="../scripts/406-Test-CPU.sh" target="_blank">406-Test-CPU.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/406-Test-CPU.sh
  ```

---
### SHORTCUT: Build CPU, Copy to Mmojo Share, Test
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
$MMOJO_SERVER_SCRIPTS/406-Build-CPU.sh
$MMOJO_SERVER_SCRIPTS/406-Copy-CPU-Build-to-Mmojo-Share.sh
$MMOJO_SERVER_SCRIPTS/406-Test-CPU.sh
```

---
### Proceed
- **Next:** [407. Build CUDA](407-Build-CUDA.md)
- **Previous:** [405. Build APE](405-Build-APE.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
