## 303. Copy Models
### About this Step - DO THIS ONCE
In this step, we will copy models from the Mmojo Share.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Create Models Directory
This script creates the `$MODELS_DIR` and adds a simple model map to it:
- View the script: <a href="../scripts/302-Create-Models-Directory.sh" target="_blank">302-Create-Models-Directory.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/302-Create-Models-Directory.sh
  ```

---
### Optional: Download Model Map
If you plan to create `mmojo-server-one` Actual Portable Executables (APEs) with embedded models, you should download some models that are tested to work with `mmojo-server`. We'll download a model map from Hugging Face.

This script downloads the model map from Hugging Face:
- View the script: <a href="../scripts/302-Download-Model-Map.sh" target="_blank">302-Download-Model-Map.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/302-Download-Model-Map.sh
  ```

#### Optional: Edit the Model Map
All these models will take a long time to download, so you can edit the model map and remove models you don't want.
```
nano $MODEL_MAP
```

---
### Copy Models from Mmojo Share
If you've created a Mmojo share on your network, copying from that share is much faster than downloading from Hugging Face.

This script downloads the models from Hugging Face:
- View the script: <a href="../scripts/303-Copy-Models.sh" target="_blank">303-Copy-Models.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/303-Copy-Models.sh
  ```

---
### SHORTCUT: Copy Tested Models
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet to copy all the models I offer on Hugging Face from your Mmojo SHare. This will take awhile and use a lot (i.e. 100 GB-ish) of disk space.
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
$MMOJO_SERVER_SCRIPTS/302-Create-Models-Directory.sh
$MMOJO_SERVER_SCRIPTS/302-Download-Model-Map.sh
$MMOJO_SERVER_SCRIPTS/303-Copy-Models.sh
```

---
### Proceed
- **Next:** [304. Build Cosmopolitan](304-Build-Cosmopolitan.md)
- **Previous:** [302. Download Models](302-Download-Models.md)
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
