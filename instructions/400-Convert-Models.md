## 400. Build gguf Models
### About this Section
Let's use llama.cpp and Hugging Face to build some .gguf models we can use with Mmojo Server. This is experimental right now, and will be turned into a proper section soon.

TO-DO:
- Each model should be its own page. If it makes it in here, it's qualified. We'll also have a page of models to do or known to not work (and why).
- There should be a script with better error handling that each model uses.
- The script needs to add the model to the model map after copying. That will let us use the model in packaging.

---
### Before You Get Started
Before you can clone Hugging Face Repos and convert them into .gguf models, you need to have the llama.cpp Github repo cloned.

This script clones the llama.cpp repo and repos upon which it depends into the `$CONVERT_MODELS_DIR` directory:
- View the script: <a href="../scripts/401-Clone-Repo.sh" target="_blank">401-Clone-Repo.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/401-Clone-Repo.sh
  ```

---
### Mistal AI's Ministral 3 3B Reasoning 2512
It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.
```
MODEL_NAME='Mistral-AI-Ministral-3B-Reasoning-v3-2512'
MODEL_MNEMONIC="mis-min-3B-rea-v3-2512"
MODEL_TYPE='q8_0'
MODEL_REPO="https://huggingface.co/mistralai/Ministral-3-3B-Reasoning-2512.git"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```
<!--
```
GGUF_DIR="$CONVERT_MODELS_DIR/$MODEL_NAME-$MODEL_TYPE"

mkdir -p $CONVERT_MODELS_DIR
if [ ! -d $GGUF_DIR ]; then
    git clone $MODEL_GIT $GGUF_DIR
fi
python3 $BUILD_DIR/convert_hf_to_gguf.py $GGUF_DIR \
    --outfile $GGUF_DIR/$MODEL_NAME-$MODEL_TYPE.gguf \
    --outtype $MODEL_TYPE

cp $GGUF_DIR/$MODEL_NAME-$MODEL_TYPE.gguf $MODELS_DIR
```
-->

---
### Google's Gemma E2B Instruct v3n
This is a gated LLM. You will need to request permission to access it:

https://huggingface.co/google/gemma-3n-E2B-it

While you are on the Hugging Face site and awaiting permission from Google, get an API key for your acoount. You will be asked to enter your account name and API key twice when cloning this repo.

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Google-Gemma-E2B-Instruct-v3n"
MODEL_MNEMONIC="goo-gem-E2B-ins-v3n"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/google/gemma-3n-E2B-it.git"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```

<!--
```
GGUF_DIR="$CONVERT_MODELS_DIR/$MODEL_NAME-$MODEL_TYPE"

mkdir -p $CONVERT_MODELS_DIR
if [ ! -d $GGUF_DIR ]; then
    git clone $MODEL_GIT $GGUF_DIR
fi
python3 $BUILD_DIR/convert_hf_to_gguf.py $GGUF_DIR \
    --outfile $GGUF_DIR/$MODEL_NAME-$MODEL_TYPE.gguf \
    --outtype $MODEL_TYPE

cp $GGUF_DIR/$MODEL_NAME-$MODEL_TYPE.gguf $MODELS_DIR
```
-->

<!--
---
### Mistal AI's Ministral 3 3B Instruct 2512
This isn't supported by llama.cpp because of FP8 weights.
```
MODEL_NAME='Mistral-AI-Ministral-3B-Instruct-v3-2512'
MODEL_EXTENSION="mis-min-3B-ins-v3-2512"
MODEL_TYPE='q8_0'
MODEL_GIT="https://huggingface.co/mistralai/Ministral-3-3B-Instruct-2512.git"
GGUF_DIR="$CONVERT_MODELS_DIR/$MODEL_NAME-$MODEL_TYPE"

mkdir -p $CONVERT_MODELS_DIR
if [ ! -d $GGUF_DIR ]; then
    git clone $MODEL_GIT $GGUF_DIR
fi
python3 $BUILD_DIR/convert_hf_to_gguf.py $GGUF_DIR \
    --outfile $GGUF_DIR/$MODEL_NAME-$MODEL_TYPE.gguf \
    --outtype $MODEL_TYPE

cp $GGUF_DIR/$MODEL_NAME-$MODEL_TYPE.gguf $MODELS_DIR
```
-->
---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
