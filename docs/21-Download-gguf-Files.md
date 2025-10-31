## 21. Download gguf Files

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step - DO THIS ONCE
In this step, we will download some `gguf` files we will need from Hugging Face and copy them to our Mmojo share for later use.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### OPTIONAL: Update from Mmojo Server Repo
(Instructions here to update your locally cloned repo. Run a script in the repo.)

---
### Environment Variables

Let's define some environment variables:
```
cd ~
DOWNLOAD_DIR="21-DOWNLOAD"
MODEL_MAP="model-map.txt"
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
```

_Note that if you copy each code block from the guide and paste it into your terminal, each block ends with a message so you won't lose your place in this guide._

---
### Create Download Directory
Create the `21-DOWNLOAD` directory, and add a simple model map to it.
```
mkdir -p ~/$DOWNLOAD_DIR
cd ~/$DOWNLOAD_DIR
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
### Download Models
Download the models from Hugging Face.
```
DownloadModel() {
  MODEL_FILE=$1
  URL="https://huggingface.co/bradhutchings/Mmojo-Server/resolve/main/models/$MODEL_FILE?download=true"
  if [ ! -f $MODEL_FILE ]; then wget $URL --show-progress --quiet -O $MODEL_FILE ; fi
}

unset apefiles
declare -A apefiles

while IFS=$' ' read -r gguf apefile ; do
  if [[ "$gguf" != "#" ]] && [[ -n "$gguf" ]]; then
    apefiles["${gguf}"]="${apefile}"
  fi
done < "$MODEL_MAP"

for key in "${!apefiles[@]}"; do
  DownloadModel $key 
done
printf "\n**********\n*\n* FINISHED: Download Models.\n*\n**********\n\n"
```


---
### Copy Models from Mmojo Share
If you've created a Mmojo share on your network, copying from that share is much faster than downloading from Hugging Face.

Mount the share:
```
mount-mmojo-share.sh
ls -al /mnt/mmojo
printf "\n**********\n*\n* FINISHED: Mount the share.\n*\n**********\n\n"
```

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
- **Next:** [22. Build Cosmopolitan](22-Build-Cosmopolitan.md)
- **Previous:** This is the first article in this section.
- **Up:** [20. Gather Build Pieces](20-Gather-Build-Pieces.md)
