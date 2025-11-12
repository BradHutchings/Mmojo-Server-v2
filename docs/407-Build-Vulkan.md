## 407. Build Vulkan
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your build environment platform with CPU optimizations enabled and Vulkan GPU support enabled.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Build Vulkan Mmojo Server for Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/407-Build-Vulkan.sh" target="_blank">407-Build-Vulkan.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/407-Build-Vulkan.sh
  ```

---
### OPTIONAL: Test the Build
Requires previously downloaded model to the `$MODELS_DIR` directory. We test with command-line arguments.
- View the script: <a href="../scripts/407-Test-Vulkan.sh" target="_blank">407-Test-Vulkan.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/407-Test-Vulkan.sh
  ```
  
---
### Proceed
- **Next:** This is the last step in this section.
- **Previous:** [406. Build CUDA](406-Build-CUDA.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
