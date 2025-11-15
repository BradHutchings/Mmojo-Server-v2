## 407. Build Vulkan
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your build environment platform with CPU optimizations enabled and Vulkan GPU support enabled.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
<details>
  <summary>Update Local Mmojo Server Repo &mdash; Expand if you haven't today.</summary>
  
### Update Local Mmojo Server Repo
Have you updated your local clone of the Mmojo Server Repo today? If not, run this first:
```
mm-update-local-mmojo-server-repo.sh
. mm-environment-variables.sh
```
</details>

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

#### Optional: Copy Vulkan Build to Mmojo Share
Copy this build to your Mmojo Share for packaging later. 
- View the script: <a href="../scripts/407-Copy-Vulkan-Build-to-Mmojo-Share.sh" target="_blank">407-Copy-Vulkan-Build-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/407-Copy-Vulkan-Build-to-Mmojo-Share.sh
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
### SHORTCUT: Build Vulkan, Copy to Mmojo Share, Test
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
$MMOJO_SERVER_SCRIPTS/407-Build-Vulkan.sh
$MMOJO_SERVER_SCRIPTS/407-Copy-Vulkan-Build-to-Mmojo-Share.sh
$MMOJO_SERVER_SCRIPTS/407-Test-Vulkan.sh
```

---
### Proceed
- **Next:** This is the last step in this section.
- **Previous:** [406. Build CUDA](406-Build-CUDA.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
### Next Section
- **Next Section:** [500. Package Mmojo Server](500-Package-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
