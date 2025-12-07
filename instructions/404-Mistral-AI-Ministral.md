## 404. Mistral AI Ministral
### About this Section
Let's download and convert Mistral AI's Ministral models from Hugging Face.

We will be using this script to clone each repo, convert the model, copy the model your `$MODELS_DIR` directory, and update the model map at `$MODELS_MAP`.
- View the script: <a href="../scripts/400-Convert-HF-to-gguf-Model.sh" target="_blank">400-Convert-HF-to-gguf-Model.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>

In the future, this script will also copy your converted model to your Mmojo Share if it is mounted.

---
### Mistral AI's Ministral 3B Reasoning v3-2512
**Hugging Face Repo:** https://huggingface.co/mistralai/Ministral-3-3B-Reasoning-2512

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Mistral-Ministral-3B-Reasoning-v3-2512"
MODEL_MNEMONIC="mis-min-3B-rea-v3-2512"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/mistralai/Ministral-3-3B-Reasoning-2512"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh \
    $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```

---
### Mistral AI's Ministral 8B Reasoning v3-2512
**Hugging Face Repo:** https://huggingface.co/mistralai/Ministral-3-8B-Reasoning-2512

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Mistral-Ministral-8B-Reasoning-v3-2512"
MODEL_MNEMONIC="mis-min-8B-rea-v3-2512"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/mistralai/Ministral-3-8B-Reasoning-2512"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh \
    $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```

---
### Mistral AI's Ministral 14B Reasoning v3-2512
**Hugging Face Repo:** https://huggingface.co/mistralai/Ministral-3-14B-Reasoning-2512

It may take 20 or 30 minutes to clone the Hugging Face repo, even on fast Internet.

```
MODEL_NAME="Mistral-Ministral-14B-Reasoning-v3-2512"
MODEL_MNEMONIC="mis-min-14B-rea-v3-2512"
MODEL_TYPE="q8_0"
MODEL_REPO="https://huggingface.co/mistralai/Ministral-3-14B-Reasoning-2512"
$MMOJO_SERVER_SCRIPTS/400-Convert-HF-to-gguf-Model.sh \
    $MODEL_NAME $MODEL_TYPE $MODEL_MNEMONIC $MODEL_REPO
```

---
### Proceed
- **Next:** This is the last step in this section.
- **Previous:** [403. Meta Llama](403-Meta-Llama.md)
- **Up:** [400. Convert Models](400-Convert-Models.md)
