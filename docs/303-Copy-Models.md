## 302. Copy Models

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step - DO THIS ONCE
In this step, we will copy models from the Mmojo Share.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Create Models Directory
This script creates the `$MODELS_DIR` and adds a simple model map to it:
- View the script: <a href="../scripts/303-Create-Models-Directory.sh" target="_blank">303-Create-Models-Directory.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/303-Create-Models-Directory.sh
  ```

---
### OPTIONAL: Download Model Map
If you plan to create `mmojo-server-one` Actual Portable Executables (APEs) with embedded models, you should download some models that are tested to work with `mmojo-server`. We'll download a model map from Hugging Face.

This script downloads the model map from Hugging Face:
- View the script: <a href="../scripts/303-Download-Model-Map.sh" target="_blank">303-Download-Model-Map.sh</a>.
- Run the script.
  ```
  . $MMOJO_SERVER_SCRIPTS/303-Download-Model-Map.sh
  ```

#### OPTIONAL: Edit the Model Map
All these models will take a long time to download, so you can edit the model map and remove models you don't want.
```
nano $MODEL_MAP
```

---
### Copy Models from Mmojo Share
If you've created a Mmojo share on your network, copying from that share is much faster than downloading from Hugging Face.

Copy the models:
```
CopyModel() {
  MODEL_FILE=$1
  if [ ! -f $MODEL_FILE ]; then 
    echo "Copying $MODEL_FILE.\n"
    cp -v /mnt/mmojo/models/$MODEL_FILE .
    chmod a-x $MODEL_FILE
  fi
}

mm-mount-mmojo-share.sh
unset apefiles
declare -A apefiles

while IFS=$' ' read -r gguf apefile ; do
  if [[ "$gguf" != "#" ]] && [[ -n "$gguf" ]]; then
    apefiles["${gguf}"]="${apefile}"
  fi
done < "$MODEL_MAP"

for key in "${!apefiles[@]}"; do
  CopyModel $key 
done
printf "\n**********\n*\n* FINISHED: Copy Models from Mmojo Share.\n*\n**********\n\n"
```

---
### Proceed
- **Next:** [304. Build Cosmopolitan](304-Build-Cosmopolitan.md)
- **Previous:** [302. Download Models](302-Download-Models.md)
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)
