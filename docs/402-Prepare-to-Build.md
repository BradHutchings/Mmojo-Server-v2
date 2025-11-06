## 402. Prepare to Build

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step

In this step, we will clone this Mmojo-Server repo, fix problems that affect building with Cosmopolitan, and add some features for Mmojo Server.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Optional: Use `work-in-progress` Branch of Mmojo Server Repo
Use the `work-in-progress` branch where I implement and test my own changes and where I test changes from `llama.cpp`.
```
. mm-work-in-progress-branch.sh
```

---
### Clone Repos
Clone llama.cpp repo and repos upon which it depends into a `$BUILD_LLAMA_CPP_DIR` directory.

This script clones the llama.cpp repo and repos upon which it depends into the `$BUILD_LLAMA_CPP_DIR` directory:
- View script: <a href="../scripts/402-Clone-Repos.sh" target="_blank">402-Clone-Repos.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/402-Clone-Repos.sh
  ```

---
### Patch llama.cpp Source Code and Build Code
This looks like lots of fun.
- The Mmojo Server repo needs pacthed files that can be copied.
  - Eventually, I want to use scripts to patch here.
- Run the patch script:
  ```
  . $MMOJO_SERVER_SCRIPTS/402-Fix-llama-cpp.sh
  ```

---
### Customize WebUI

**Suggested:** Rollback the `tools/server/webui` to the pre-Svelte version. The new Svelte UI doesn't like running on non-root web server path. We'll remove this step when the new UI is fixed upstream in llama.cpp.

```
# THIS DOESN'T WORK YET
chmod a+x scripts-mmojo/*.sh
./scripts-mmojo/customize-web-ui-rollback.sh
printf "\n**********\n*\n* FINISHED: Customize WebUI - Rollback.\n*\n**********\n\n"
```

**Required:** Customize the web UI, rebuild all the web files. If you did the **Suggested** step above, you will see 2 `sed` errors.
```
# THIS DOESN'T WORK YET
chmod a+x scripts-mmojo/*.sh
./scripts-mmojo/customize-web-ui.sh
printf "\n**********\n*\n* FINISHED: Customize WebUI.\n*\n**********\n\n"
```

#### Uh. Oh. npm Spit Out Errors

You may have an earlier version of `npm` and `nodejs` installed on your build machine than are required
for that customization step. If you're running Linux or macOS, these steps should clean that up.

**ONLY RUN THESE IF YOU HAD PROBLEMS IN THE PREVIOUS STEP!!** Then rerun the previous step.

```
cd ~
sudo apt remove nodejs npm -y
sudo apt install nodejs npm -y
sudo npm install -g node@latest
sudo npm install -g npm@latest
cd ~/$BUILD_MMOJO_SERVER_DIR
```


<!--
---
### Environment Variables
*This could be a script in the repo. We show the script optionally NO IT CAN't. WE DON'T HAVE THE REPO YET!!*

Let's define some environment variables:
```
cd ~
export DOWNLOAD_DIR="$HOME/21-DOWNLOAD"
export BUILD_COSMOPOLITAN_DIR="$HOME/22-BUILD-cosmopolitan"
export COSMOCC_DIR="$HOME/$BUILD_COSMOPOLITAN_DIR/cosmocc"
export BUILD_LLAMAFILE_DIR="$HOME/23-BUILD-llamafile"
export BUILD_OPENSSSL_DIR="$HOME/24-BUILD-openssl"
export BUILD_LLAMA_CPP_DIR="$HOME/40-BUILD-lamma-cpp"
export MMOJO_SERVER_DIR="$BUILD_LLAMA_CPP_DIR/mmojo-server"
if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
```

_Note that if you copy each code block from the guide and paste it into your terminal, each block ends with a message so you won't lose your place in this guide._

---
### Create Build llama-cpp Directory
```
mkdir -p $BUILD_LLAMA_CPP_DIR
cd $BUILD_LLAMA_CPP_DIR
printf "\n**********\n*\n* FINISHED: Create Build llama-cpp Directory.\n*\n**********\n\n"
```

---
### Clone the llama.cpp Locally
*This could be a script in the repo. We show the script optionally.*

Clone the llama.cpp repo, this repo, and repos the llama.cpp repo depends on into a `$BUILD_LLAMA_CPP_DIR` directory.
```
git clone https://github.com/ggml-org/llama.cpp $BUILD_LLAMA_CPP_DIR
cd $BUILD_LLAMA_CPP_DIR
git clone https://github.com/BradHutchings/mmojo-server-v2.git $MMOJO_SERVER_DIR
git clone https://github.com/nlohmann/json.git nlohmann-json
git clone https://github.com/google/minja.git google-minja
git clone https://github.com/yhirose/cpp-httplib.git cpp-httplib
git clone https://github.com/mackron/miniaudio.git miniaudio
git clone https://github.com/nothings/stb.git stb
cp -r ~/$BUILD_COSMOPOLITAN_DIR/cosmocc .
cp -r ~/$BUILD_OPENSSSL_DIR/openssl .
printf "\n**********\n*\n* FINISHED: Clone this Repo and Dependent Repos Locally.\n*\n**********\n\n"
```

**Optional:** Use the `work-in-progress` branch where I implement and test my own changes and where I test upstream changes from `llama.cpp`.

*This could be a script in the repo. We show the script optionally.*

```
cd $MMOJO_SERVER_DIR
git checkout work-in-progress
cd $BUILD_LLAMA_CPP_DIR
printf "\n**********\n*\n* FINISHED: Checkout work-in-progress.\n*\n**********\n\n"
```

**Optional:** Roll the llama.cpp repo back to last know working.

*This SHOULD be a script in the repo. We show the script optionally.*

```
# Roll back llama.cpp to a known safe commit.
```


---
### Patch llama.cpp Source Code and Build Code
The goal is to have most/all the changes to llama.cpp source code in this script, instead of having to patch individual files manually every time they updated upstream. Don't skip this step.

*This SHOULD be a script in the repo. It is. We show the script optionally.*

```
chmod a+x scripts-mmojo/*.sh
./scripts-mmojo/fix-source-mmojo.sh
printf "\n**********\n*\n* FINISHED: Patch llama.cpp Source Code and Build Code.\n*\n**********\n\n"
```

---
### Customize WebUI

**Suggested:** Rollback the `tools/server/webui` to the pre-Svelte version. The new Svelte UI doesn't like running on non-root web server path. We'll remove this step when the new UI is fixed upstream in llama.cpp.

```
chmod a+x scripts-mmojo/*.sh
./scripts-mmojo/customize-web-ui-rollback.sh
printf "\n**********\n*\n* FINISHED: Customize WebUI - Rollback.\n*\n**********\n\n"
```

**Required:** Customize the web UI, rebuild all the web files. If you did the **Suggested** step above, you will see 2 `sed` errors.
```
chmod a+x scripts-mmojo/*.sh
./scripts-mmojo/customize-web-ui.sh
printf "\n**********\n*\n* FINISHED: Customize WebUI.\n*\n**********\n\n"
```

#### Uh. Oh. npm Spit Out Errors

You may have an earlier version of `npm` and `nodejs` installed on your build machine than are required
for that customization step. If you're running Linux or macOS, these steps should clean that up.

**ONLY RUN THESE IF YOU HAD PROBLEMS IN THE PREVIOUS STEP!!** Then rerun the previous step.

```
cd ~
sudo apt remove nodejs npm -y
sudo apt install nodejs npm -y
sudo npm install -g node@latest
sudo npm install -g npm@latest
cd ~/$BUILD_MMOJO_SERVER_DIR
```

---
### Proceed
- **Next:** [403. Build Test](403-Build-Test.md)
- **Previous:** [401. Update Local Mmojo Server Repo](401-Update-Local-Mmojo-Server-Repo.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)
