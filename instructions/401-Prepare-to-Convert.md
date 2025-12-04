## 401. Prepare to Convert
### About this Step

In this step, we will clone the llama.cpp repo and leave it uncustomized so we can do model conversion.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
<details>
  <summary><b>Update Local Mmojo Server Repo</b> &mdash; Expand if you haven't today.</summary>
  
Have you updated your local clone of the Mmojo Server Repo today? If not, run this first:
```
mm-update-local-mmojo-server-repo.sh
mm-env
```
</details>

---
### Clone Repos
Clone llama.cpp repo and repos upon which it depends into a `$BUILD_LLAMA_CPP_DIR` directory.

This script clones the llama.cpp repo and repos upon which it depends into the `$BUILD_LLAMA_CPP_DIR` directory:
- View the script: <a href="../scripts/401-Clone-Repo.sh" target="_blank">401-Clone-Repo.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/401-Clone-Repo.sh
  ```

---
### Set up a Credential Store for git
Many of the Hugging Face repos are gated and require you to enter your account name and an API key to access them. You can save a lot of repeated copy/paste effort by setting up a git credential store. **NOTE: THIS IS NOT VERY SECURE!!**

```
# THIS IS NOT A SECURE WAY TO HANDLE YOUR HUGGING FACE CREDENTIALS!!
git config --global credential.helper store
```


---
### Proceed
- **Next:** [402. Google Gemma](402-Google-Gemma.md)
- **Previous:** This is the first step in this section.
- **Up:** [400. Convert Models](400-Convert-Models.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
