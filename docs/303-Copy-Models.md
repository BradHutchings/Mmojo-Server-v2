## 302. Copy Models

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step - DO THIS ONCE
In this step, we will copy models from the Mmojo Share.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Environment Variables
This script sets environment variables:
- View script: <a href="../scripts/mm-environment-variables.sh" target="_blank">mm-environment-variables.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script, which is linked into your `$HOME/scripts` directory. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  ```

_Note that if you copy each code block from the guide and paste it into your terminal, each block ends with a message so you won't lose your place in this guide._

---
### Create Models Directory
Create the $MODELS_DIR directory, and add a simple model map to it.
```
mkdir -p $MODELS_DIR
cd $MODELS_DIR
cat << EOF > $MODEL_MAP
Google-Gemma-1B-Instruct-v3-q8_0.gguf mmojo-server-Google-Gemma-1B-Instruct-v3
EOF
printf "\n**********\n*\n* FINISHED: Create Download Directory.\n*\n**********\n\n"
```

---
### OPTIONAL: Download Model Map
If you plan to create `mmojo-server-one` Actual Portable Executables (APEs) with embedded models, you should download some models that are tested to work with `mmojo-server`. We'll download a model map from Hugging Face.
```
MODEL_MAP_URL="https://huggingface.co/bradhutchings/Mmojo-Server/resolve/main/model-map.txt"
wget $MODEL_MAP_URL --quiet -O $MODEL_MAP
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

mount-mmojo-share.sh
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
