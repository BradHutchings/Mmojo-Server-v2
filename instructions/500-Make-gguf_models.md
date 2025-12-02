## 400. Make gguf Models
### About this Section
Let's use llama.cpp and Hugging Face to build some .gguf models we can use with Mmojo Server. This is experimental right now, and will be turned into a proper section soon.

---
### Mistal AI's Ministral 3 3B Instruct 2512
```
MODEL='Mistral-AI-Ministral-3B-Instruct-v3-2512'
MODEL_TYPE='q8_0'
MODEL_GIT="https://huggingface.co/mistralai/Ministral-3-3B-Instruct-2512.git"
GGUF_DIR="$BUILD_MODELS_DIR/$MODEL-$MODEL_TYPE"

mkdir -p $BUILD_MODELS_DIR
if [ ! -d $GGUF_DIR ]; then
    git clone $MODEL_GIT $GGUF_DIR
fi
python $BUILD_DIR/convert_hf_to_gguf.py $GGUF_DIR --outfile $GGUF_DIR/$MODEL-$MODEL_TYPE.gguf --outtype $MODEL_TYPE

cp $GGUF_DIR/$MODEL-$MODEL_TYPE.gguf $MODELS_DIR


---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
