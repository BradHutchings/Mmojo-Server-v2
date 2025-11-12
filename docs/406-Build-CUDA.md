## 406. Build CUDA
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your build environment platform with CPU optimizations enabled and CUDA GPU support enabled.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Build CUDA Mmojo Server for Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/406-Build-CUDA.sh" target="_blank">406-Build-CUDA.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/406-Build-CUDA.sh
  ```

#### Optional: Copy CUDA Build to Your Mmojo Share
Copy this build to your Mmojo Share for packaging later. 
- View the script: <a href="../scripts/406-Copy-CUDA-Build-to-Mmojo-Share.sh" target="_blank">406-Copy-CUDA-Build-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/406-Copy-CUDA-Build-to-Mmojo-Share.sh
  ```

---
### OPTIONAL: Test the Build
Requires previously downloaded model to the `$MODELS_DIR` directory. We test with command-line arguments.
- View the script: <a href="../scripts/406-Test-CUDA.sh" target="_blank">406-Test-CUDA.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/406-Test-CUDA.sh
  ```
  
---
### Proceed
- **Next:** [407. Build Vulkan](407-Build-Vulkan.md)
- **Previous:** [405. Build CPU](405-Build-CPU.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
