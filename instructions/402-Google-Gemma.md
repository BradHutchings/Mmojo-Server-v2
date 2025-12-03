## 402. Google Gemma
### About this Section
Let's download and convert Google's Gemma models from Hugging Face.

We will be using this script to clone each repo, convert the model, copy the model your `$MODELS_DIR` directory, and update the model map at `$MODELS_MAP`.
- View the script: <a href="../scripts/400-Convert-HF-to-gguf-Model.sh" target="_blank">400-Convert-HF-to-gguf-Model.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>

In the future, this script will also copy your converted model to your Mmojo Share if it is mounted.

---
### Hugging Face Account
Google requires that you have a Hugging Face account and that your account has permission to download their gated models. Please:
- Create an account on Hugging Face.
- Create an API key with read access.
- Request permission through one of the Google models.

You will need your account id and your API key handy each time you clone a model repo. In fact, you will be asked for them twice each time you clone.

---
### Google's Gemma E2B Instruct v3n
**Hugging Face Repo:** https://huggingface.co/google/gemma-3n-E2B-it

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Google-Gemma-E2B-Instruct-v3n"
MODEL_MNEMONIC="goo-gem-E2B-ins-v3n"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/google/gemma-3n-E2B-it.git"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```

---
### Google's Gemma E4B Instruct v3n
**Hugging Face Repo:** https://huggingface.co/google/gemma-3n-E4B-it

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Google-Gemma-E4B-Instruct-v3n"
MODEL_MNEMONIC="goo-gem-E4B-ins-v3n"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/google/gemma-3n-E4B-it.git"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```

---
### Google's Gemma 270M Instruct v3
**Hugging Face Repo:** https://huggingface.co/google/gemma-3-270m-it

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Google-Gemma-270M-Instruct-v3"
MODEL_MNEMONIC="goo-gem-270M-ins-v3"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/google/gemma-3-270m-it"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```

---
### Google's Gemma 1B Instruct v3
**Hugging Face Repo:** https://huggingface.co/google/gemma-3-1b-it

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Google-Gemma-1B-Instruct-v3"
MODEL_MNEMONIC="goo-gem-1B-ins-v3"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/google/gemma-3-1b-it"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```

---
### Google's Gemma 4B Instruct v3
**Hugging Face Repo:** https://huggingface.co/google/gemma-3-4b-it

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Google-Gemma-4B-Instruct-v3"
MODEL_MNEMONIC="goo-gem-4B-ins-v3"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/google/gemma-3-4b-it"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```

---
### Google's Gemma 12B Instruct v3
**Hugging Face Repo:** https://huggingface.co/google/gemma-3-12b-it

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Google-Gemma-12B-Instruct-v3"
MODEL_MNEMONIC="goo-gem-12B-ins-v3"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/google/gemma-3-12b-it"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```



