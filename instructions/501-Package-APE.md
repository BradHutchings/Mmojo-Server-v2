## 501. Package APE
### About this Step

Let's prepare an Actual Portable Executable (APE) for distribution. You will start with the APE file you built, remove extraneous timezone files from it, add certificates, add the Mmojo Complete user interface, add a configuration file, and add add a `.gguf` model. You will test run it, then copy it to your Mmojo Share. 

---
<details>
  <summary><b>Update Local Mmojo Server Repo</b> &mdash; Expand if you haven't today.</summary>
  
Have you updated your local clone of the Mmojo Server Repo today? If not, run this first:
```
mm-update-local-mmojo-server-repo.sh
. mm-environment-variables.sh
```
</details>

---
### Start Packaging APE
This script create the packaging directories, copies the `mmojo-server-ape` file you previously built and assembled, removes extraneous timezone files from it, and displays the contents for your review.
- View the script: <a href="../scripts/501-Start-Packaging-APE.sh" target="_blank">501-Start-Packaging-APE.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/501-Start-Packaging-APE.sh
  ```

---
### WORKING ON WHAT'S BELOW
---
### Add Certs to Archive

Add self-signed certs to the archive. CA cert is added to the website folder.
```
mount-mmojo-share.sh
mkdir certs
cp /mnt/mmojo/Mmojo-certs/mmojo.local.crt certs
cp /mnt/mmojo/Mmojo-certs/mmojo.local.key certs
cp /mnt/mmojo/Mmojo-certs/selfsignCA.crt certs
zip -0 -r $MMOJO_SERVER_ZIP certs/*
printf "\n**********\n*\n* FINISHED: Add Certs to Archive.\n*\n**********\n\n"
```

#### Verify certs Directory in Archive

Verify that the archive has your certs:
```
unzip -l $MMOJO_SERVER_ZIP 
printf "\n**********\n*\n* FINISHED: Verify certs Directory in Archive.\n*\n**********\n\n"
```

---
### Create website Directory in Archive

`llama.cpp` has a built in chat UI. If you'd like to provide a custom UI, you should add a `website` directory to the `mmojo-server` archive. `llama.cpp`'s chat UI is optimized for serving inside the project's source code. But we can copy the unoptimized source:
```
mount-mmojo-share.sh
mkdir website
cp -r ~/$BUILD_MMOJO_SERVER_DIR/completion-ui/* website
cp /mnt/mmojo/Mmojo-certs/selfsignCA.crt website/CA.crt
zip -0 -r $MMOJO_SERVER_ZIP website/*
printf "\n**********\n*\n* FINISHED: Create website Directory in Archive.\n*\n**********\n\n"
```

#### Verify website Directory in Archive

Verify that the archive has your website:
```
unzip -l $MMOJO_SERVER_ZIP 
printf "\n**********\n*\n* FINISHED: Verify website Directory in Archive.\n*\n**********\n\n"
```

---
### Create default-args File in Archive

A `default-args` file in the archive can specify sane default parameters. The format of the file is parameter name on a line, parameter value on a line, rinse, repeat. End the file with a `...` line to include user specified parameters.

We don't yet support including the model inside the zip archive (yet). That has a 4GB size limitation on Windows anyway, as `.exe` files cannot exceed 4GB. So let's use an adjacent file called `model.gguf`.

We will serve on localhost, port 8080 by default for safety. The `--ctx-size` parameter is the size of the context window. This is kinda screwy to have as a set size rather than a maximum because the `.gguf` files now have the training context size in metadata. We set it to 8192 to be sensible. The `--threads-http` parameter ensures that the browser can ask for all the image files in our default UI at once.
```
cat << EOF > $DEFAULT_ARGS
-m
model.gguf
--host
127.0.0.1
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
/zip/website
--default-ui-endpoint
chat
--ssl-key-file
/zip/certs/mmojo.local.key
--ssl-cert-file
/zip/certs/mmojo.local.crt
...
EOF
zip -0 -r $MMOJO_SERVER_ZIP $DEFAULT_ARGS
printf "\n**********\n*\n* FINISHED: Create Default args File in Archive.\n*\n**********\n\n"
```

#### Verify default-args File in Archive

Verify that the archive contains the `default-args` file:
```
unzip -l $MMOJO_SERVER_ZIP 
printf "\n**********\n*\n* FINISHED: Verify default-args File in Archive.\n*\n**********\n\n"
```

---
### Remove .zip Extension, Delete Local Files

Remove the `.zip` from our working file and delete the local copy of the model file:
```
mv $MMOJO_SERVER_ZIP $MMOJO_SERVER
rm -r -f certs default-args website
printf "\n**********\n*\n* FINISHED: Remove .zip Extension, Delete Local Files.\n*\n**********\n\n"
```

---
### Copy Model

Let's copy a small model. We'll use Google Gemma 1B Instruct v3, a surprisingly capable tiny model.
```
MODEL_FILE="Google-Gemma-1B-Instruct-v3-q8_0.gguf"
cp ~/$DOWNLOAD_DIR/$MODEL_FILE model.gguf
printf "\n**********\n*\n* FINISHED: Copy Model.\n*\n**********\n\n"
```

---
### Test Run

Now we can test run `mmojo-server`, listening on localhost:8080.
```
./$MMOJO_SERVER
```

After starting up and loading the model, it should display:

**main: server is listening on https://127.0.0.1:8080 - starting the main loop**<br/>
**srv  update_slots: all slots are idle**

Hit `ctrl-C` on your keyboard to stop it.

#### Test Run on Public Interfaces

If you'd like it to listen on all available interfaces, so you can connect from a browser on another computer:
```
./$MMOJO_SERVER --host 0.0.0.0
```

After starting up and loading the model, it should display:

**main: server is listening on https://0.0.0.0:8080 - starting the main loop**<br/>
**srv  update_slots: all slots are idle**

Hit `ctrl-C` on your keyboard to stop it.

---
### Copy mmojo-server for Deployment
Congratulations! You are ready to copy `mmojo-server` executable to the share for deployment. These commands use Brad's `mount-host-share.sh` script and `/mnt/hyperv` share.

```
mount-mmojo-share.sh
sudo cp $MMOJO_SERVER /mnt/mmojo/Mmojo-Server/mmojo-server/$MMOJO_SERVER
sudo cp $MMOJO_SERVER /mnt/mmojo/Mmojo-Server/mmojo-server/$MMOJO_SERVER.exe
sudo cp $MMOJO_SERVER /mnt/mmojo/Mmojo-Raspberry-Pi/Mmojo-LLMs/$MMOJO_SERVER
printf "\n**********\n*\n* FINISHED: Copy mmojo-server for Deployment.\n*\n**********\n\n"
```
---
### Proceed
- **Next:** [502. Package zip](502-Package-zip.md)
- **Previous:** This is the first step in this section.
- **Up:** [500. Package Mmojo Server](500-Package-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
