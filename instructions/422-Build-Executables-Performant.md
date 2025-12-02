## 422. Build Executables (Performant)
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) to run run on a narrow, modern range of x86_64 and aarch64 machines, with no GPU support.

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
### Choose GPUs to Include in Build
This script has you choose GPU support to include in the build. If you've already chosen GPUs, you do not have to choose the again.

- View the script: <a href="../scripts/mm-choose-gpus.sh" target="_blank">mm-choose-gpus.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script.
  ```
  . mm-choose-gpus.sh
  ```

*I will make this easier to navigate soon! -Brad*

---
### Build CPU Mmojo Server for Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/420-Build-Apps.sh" target="_blank">420-Build-Apps.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/420-Build-Apps.sh performant $CHOSEN_GPUS
  ```

---
### Test the Build
Requires previously downloaded model to the `$MODELS_DIR` directory. We test with command-line arguments.
- View the script: <a href="../scripts/420-Test-Apps.sh" target="_blank">420-Test-Apps.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/420-Test-Apps.sh performant $CHOSEN_GPUS
  ```

---
<details>
  <summary><b>Optional: Copy CPU Build to Mmojo Share.</b></summary>

Copy this build to your Mmojo Share for packaging later. 
- View the script: <a href="../scripts/420-Copy-CPU-Build-to-Mmojo-Share.sh" target="_blank">420-Copy-CPU-Build-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/420-Copy-CPU-Build-to-Mmojo-Share.sh performant $CHOSEN_GPUS
  ```
</details>

---
### SHORTCUT: Build CPU, Test
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
. mm-choose-gpus.sh
$MMOJO_SERVER_SCRIPTS/420-Build-Apps.sh performant $CHOSEN_GPUS
$MMOJO_SERVER_SCRIPTS/420-Test-Apps.sh performant $CHOSEN_GPUS
```

---
### SHORTCUT: Build CPU, Copy to Mmojo Share, Test
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
. mm-choose-gpus.sh
$MMOJO_SERVER_SCRIPTS/420-Build-Apps.sh performant $CHOSEN_GPUS
$MMOJO_SERVER_SCRIPTS/420-Copy-CPU-Build-to-Mmojo-Share.sh performant $CHOSEN_GPUS
$MMOJO_SERVER_SCRIPTS/420-Test-Apps.sh performant $CHOSEN_GPUS
```

---
### Proceed
- **Next:** [423. Build Executables (Native)](423-Build-Executables-Native.md)
- **Previous:** [421. Build Executables (Compatible)](421-Build-Executables-Compatible.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
