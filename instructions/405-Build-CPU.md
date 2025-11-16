## 405. Build CPU
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your build environment platform with CPU optimizations enabled, but no GPU support.

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
### Build CPU Mmojo Server for Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/405-Build-CPU.sh" target="_blank">405-Build-CPU.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/405-Build-CPU.sh
  ```

<details>
  <summary>Optional: Test the Build.</summary>

#### Optional: Test the Build
Requires previously downloaded model to the `$MODELS_DIR` directory. We test with command-line arguments.
- View the script: <a href="../scripts/405-Test-CPU.sh" target="_blank">405-Test-CPU.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/405-Test-CPU.sh
  ```
</details>

<details>
  <summary>Optional: Copy CPU Build to Mmojo Share.</summary>

#### Optional: Copy CPU Build to Mmojo Share
Copy this build to your Mmojo Share for packaging later. 
- View the script: <a href="../scripts/405-Copy-CPU-Build-to-Mmojo-Share.sh" target="_blank">405-Copy-CPU-Build-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/405-Copy-CPU-Build-to-Mmojo-Share.sh
  ```
</details>

---
### SHORTCUT: Build CPU, Copy to Mmojo Share, Test
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
$MMOJO_SERVER_SCRIPTS/405-Build-CPU.sh
$MMOJO_SERVER_SCRIPTS/405-Copy-CPU-Build-to-Mmojo-Share.sh
$MMOJO_SERVER_SCRIPTS/405-Test-CPU.sh
```

---
### Proceed
- **Next:** [406. Build CUDA](406-Build-CUDA.md)
- **Previous:** [404. Build APE](404-Build-APE.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
