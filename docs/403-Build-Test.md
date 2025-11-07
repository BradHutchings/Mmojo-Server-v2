## 403. Build Test

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for your native build environment platform without any optimizations. You don't need to do this. You can use it to test and debug features of Mmojo Server that are not specific to any particular build.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Profiling
If you do not want to profile code for the test build, copy this snippet and paste into your terminal:
```
unset BUILD_PROFILE
```

If you want to profile code for the test build, copy this snippet copy this snippet and paste into your terminal:
```
export BUILD_PROFILE=1
```

---
### Build Test Mmojo Server for Native Build Environment Platform.
This script uses cmake to build Mmojo Server:
- View script: <a href="../scripts/403-Build-Test.sh" target="_blank">403-Build-Test.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/403-Build-Test.sh
  ```

---
### OPTIONAL: Test the Build - Command-Line Arguments.
Requires previously downloaded model to the `$MODELS_DIR` directory.
- View script: <a href="../scripts/403-Test-Command-Line.sh" target="_blank">403-Test-Command-Line.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/403-Test-Command-Line.sh
  ```


<!--
---
### Environment Variables

Let's define some environment variables:
```
cd ~
DOWNLOAD_DIR="21-DOWNLOAD"
BUILD_COSMOPOLITAN_DIR="22-BUILD-cosmopolitan"
BUILD_LLAMAFILE_DIR="23-BUILD-llamafile"
BUILD_OPENSSSL_DIR="24-BUILD-openssl"
BUILD_MMOJO_SERVER_DIR="40-BUILD-mmojo"
BUILD_TEST="build-test"
EXTRA_FLAGS=""
if [ -z "$SAVE_PATH" ]; then
  export SAVE_PATH=$PATH
fi
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
```

_Note that if you copy each code block from the guide and paste it into your terminal, each block ends with a message so you won't lose your place in this guide._

**Optional:** Set `$EXTRA_FLAGS` for profiling.
```
EXTRA_FLAGS=" -pg "
```

---
### Build Test Mmojo Server for Native Build Environment Platform.
We now use CMake to build Mmojo Server.
```
cd ~/$BUILD_MMOJO_SERVER_DIR
export PATH=$SAVE_PATH
if [ -z "$EXTRA_FLAGS" ]; then
    unset CC; export CC
    unset CXX; export CXX
else
    export CC="cc $EXTRA_FLAGS "
    export CXX="c++ $EXTRA_FLAGS "
fi
cmake -B $BUILD_TEST -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON
cmake --build $BUILD_TEST --config Release

printf "\n**********\n*\n* FINISHED: Build Test Mmojo Server...\n*\n**********\n\n"
```

---
### OPTIONAL: Test the Build - Command-Line Arguments.
Requires previously downloaded model to the `1-DOWNLOAD` directory.
```
rm -f mmojo-server-args
rm -r -f mmojo-server-support
./$BUILD_TEST/bin/mmojo-server --model ~/$DOWNLOAD_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf \
    --path completion-ui/ --default-ui-endpoint "chat" --host 0.0.0.0 --port 8080 --batch-size 64 \
    --threads-http 8 --ctx-size 0 --mlock
```

#### Verify that there is no `mmojo-server-args` file or `mmojo-server-support` folder.
```
ls -ald mmojo-server-args mmojo-server-support
```

---
### OPTIONAL: Test the Build - `mmojo-server-args` File.
The `mmojo-server-args` file is saved in the current working directory. Requires previously downloaded model to the `1-DOWNLOAD` directory. 
```
rm -f mmojo-server-args
rm -r -f mmojo-server-support
cat << EOF > mmojo-server-args
--model
$HOME/$DOWNLOAD_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf
--host
0.0.0.0
--port
8080
--ctx-size
0
--threads-http
8
--batch-size
64
--batch-sleep-ms
0
--path
$(pwd)/completion-ui
--default-ui-endpoint
chat
--mlock
...
EOF
./$BUILD_TEST/bin/mmojo-server 
```

#### Verify that there is a `mmojo-server-args` file.
```
ls -ald mmojo-server-args mmojo-server-support
```

---
### OPTIONAL: Test the Build - `mmojo-server-support` Directory.
The `mmojo-server-support` directory is saved in the current working directory. Requires previously downloaded model to the `1-DOWNLOAD` directory.
```
rm -f mmojo-server-args
rm -r -f mmojo-server-support
mkdir -p mmojo-server-support
cat << EOF > mmojo-server-support/default-args
--model
$HOME/$DOWNLOAD_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf
--host
0.0.0.0
--port
8080
--ctx-size
0
--threads-http
8
--batch-size
64
--batch-sleep-ms
0
--path
$(pwd)/completion-ui
--default-ui-endpoint
chat
--mlock
...
EOF
./$BUILD_TEST/bin/mmojo-server 
```

#### Verify that there is a `mmojo-server-support` folder.
```
ls -ald mmojo-server-args mmojo-server-support
```

---
### OPTIONAL: Profile Output.
If you're profiling, get some profile output.
```
gprof build-native/bin/mmojo-server gmon.out > build-native/profile.txt
more build-native/profile.txt
```

---
### OPTIONAL: Copy `completion-ui` to Local Space.
After testing the completion UI, copy it to local space. These commands use the `mount-mmojo-share.sh` script and `/mnt/mmojo` share.

```
cd ~/$BUILD_MMOJO_SERVER_DIR
mount-mmojo-share.sh
sudo mkdir -p /mnt/mmojo/web-apps
sudo cp -r completion-ui-original /mnt/mmojo/web-apps/completion-ui
```
-->

---
### Proceed
- **Next:** [404. Build APE](404-Build-APE.md)
- **Previous:** [402. Prepare to Build](402-Prepare-to-Build.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)
