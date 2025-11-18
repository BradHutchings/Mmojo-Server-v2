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
  # Keep track of what we add below for the `default-args` file.
  unset ADDED_CERTS
  unset ADDED_MMOJO_COMPLETE
  ```

---
### Add Certs to Archive
This script adds SSL certificates from the Mmojo Share to the archive.
- View the script: <a href="../scripts/501-Add-Certs-to-APE.sh" target="_blank">501-Add-Certs-to-APE.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/501-Add-Certs-to-APE.sh
  # Keep track of what we add below for the `default-args` file.
  export ADDED_CERTS=1
  ```

*Note: I use these certificates in my Mmojo Knowledge Appliance. I will document why and how to create these certificates soon.*

---
### Add Mmojo Complete UI to Archive
This script adds the Mmojo Complete user interface to the archive.
- View the script: <a href="../scripts/501-Add-Mmojo-Complete-to-APE.sh" target="_blank">501-Add-Mmojo-Complete-to-APE.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/501-Add-Mmojo-Complete-to-APE.sh
  # Keep track of what we add below for the `default-args` file.
  export ADDED_MMOJO_COMPLETE=1
  ```

---
### Add `default-args` File to Archive
This script adds a `default-args` file to the archive. If you added certs and/or the Mmojo Complete UI above, the `default-args` file will reflect that.
- View the script: <a href="../scripts/501-Add-default-args-to-APE.sh" target="_blank">501-Add-default-args-to-APE.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/501-Add-default-args-to-APE.sh
  ```

---
### WORKING ON WHAT'S BELOW


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
