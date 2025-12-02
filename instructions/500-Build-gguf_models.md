## 500. Build gguf Models
### About this Section
Let's use llama.cpp and Hugging Face to build some .gguf models we can use with Mmojo Server. This is experimental right now, and will be turned into a proper section soon.

---
### Google's Gemma E3B Instruct v3n
This is a gated LLM. You will need to request permission to access it:

https://huggingface.co/google/gemma-3n-E2B-it

While you are on the Hugging Face site and awaiting permission from Google, get an API key for your acoount. You will be asked to enter your account name and API key twice when cloning this repo.

```
MODEL="Google-Gemma-E3B-Instruct-v3n"
MODEL_TYPE="q8_0"
MODEL_GIT="https://huggingface.co/google/gemma-3n-E2B-it.git"
GGUF_DIR="$BUILD_MODELS_DIR/$MODEL-$MODEL_TYPE"

mkdir -p $BUILD_MODELS_DIR
if [ ! -d $GGUF_DIR ]; then
    git clone $MODEL_GIT $GGUF_DIR
fi
python3 $BUILD_DIR/convert_hf_to_gguf.py $GGUF_DIR \
    --outfile $GGUF_DIR/$MODEL-$MODEL_TYPE.gguf \
    --outtype $MODEL_TYPE

cp $GGUF_DIR/$MODEL-$MODEL_TYPE.gguf $MODELS_DIR
```

---
### Mistal AI's Ministral 3 3B Instruct 2512
This might work!
```
MODEL='Mistral-AI-Ministral-3B-Reasoning-v3-2512'
MODEL_TYPE='q8_0'
MODEL_GIT="https://huggingface.co/mistralai/Ministral-3-3B-Reasoning-2512.git"
GGUF_DIR="$BUILD_MODELS_DIR/$MODEL-$MODEL_TYPE"

mkdir -p $BUILD_MODELS_DIR
if [ ! -d $GGUF_DIR ]; then
    git clone $MODEL_GIT $GGUF_DIR
fi
python3 $BUILD_DIR/convert_hf_to_gguf.py $GGUF_DIR \
    --outfile $GGUF_DIR/$MODEL-$MODEL_TYPE.gguf \
    --outtype $MODEL_TYPE

cp $GGUF_DIR/$MODEL-$MODEL_TYPE.gguf $MODELS_DIR
```

---
### Mistal AI's Ministral 3 3B Instruct 2512
This isn't supported by llama.cpp because of FP8 weights.
```
MODEL='Mistral-AI-Ministral-3B-Instruct-v3-2512'
MODEL_TYPE='q8_0'
MODEL_GIT="https://huggingface.co/mistralai/Ministral-3-3B-Instruct-2512.git"
GGUF_DIR="$BUILD_MODELS_DIR/$MODEL-$MODEL_TYPE"

mkdir -p $BUILD_MODELS_DIR
if [ ! -d $GGUF_DIR ]; then
    git clone $MODEL_GIT $GGUF_DIR
fi
python3 $BUILD_DIR/convert_hf_to_gguf.py $GGUF_DIR \
    --outfile $GGUF_DIR/$MODEL-$MODEL_TYPE.gguf \
    --outtype $MODEL_TYPE

cp $GGUF_DIR/$MODEL-$MODEL_TYPE.gguf $MODELS_DIR
```

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
