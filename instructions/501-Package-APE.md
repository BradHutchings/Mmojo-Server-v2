## 501. Package APE

**This is still a work in progress. If you've made it this far, go get some dinner, watch something on Netflix. This step will be ready soon.**

### About this Step

Let's prepare an Actual Portable Executable (APE) for distribution. You will start with the APE file you built, remove extraneous timezone files from it, add certificates, add the Mmojo Complete user interface, add a `.ggug` model file, and add a configuration file. You will test run it, then copy it to your Mmojo Share. 

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
  unset SELECTED_MODEL
  unset ADDED_MODEL
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
### Choose `.gguf` Model to Add to Archive
Choose a model. This should be a script to list models in the `300-MODELS` directory. For now, paste one of the snippets below:
```
export SELECTED_MODEL="Google-Gemma-270M-Instruct-v3-q8_0.gguf"
```
```
export SELECTED_MODEL="Google-Gemma-1B-Instruct-v3-q8_0.gguf"
```
```
export SELECTED_MODEL="Google-Gemma-4B-Instruct-v3-q8_0.gguf"
```
```
export SELECTED_MODEL="Google-Gemma-9B-Instruct-v2-q8_0.gguf"
```
```
export SELECTED_MODEL="Google-Gemma-E2B-Instruct-v3n-q8_0.gguf"
```
```
export SELECTED_MODEL="Google-Gemma-E4B-Instruct-v3n-q8_0.gguf"
```
```
export SELECTED_MODEL="IBM-Granite-2B-Instruct-v3.3-q8_0.gguf"
```
```
export SELECTED_MODEL="IBM-Granite-8B-Instruct-v3.3-q8_0.gguf"
```

---
### Add `.gguf` Model to Archive
This script adds the chosen `.gguf` model to the archive.
- View the script: <a href="../scripts/501-Add-gguf-Model-to-APE.sh" target="_blank">501-Add-gguf-Model-to-APE.sh</a>.
- Run the script.
  ```
  if [ -v SELECTED_MODEL ]; then
    $MMOJO_SERVER_SCRIPTS/501-Add-gguf-Model-to-APE.sh
    # Keep track of what we add below for the `default-args` file.
    export ADDED_MODEL=1
  fi
  ```

---
### Add `default-args` File to Archive
This script adds a `default-args` file to the archive. If you added certs and/or the Mmojo Complete UI above, the `default-args` file will reflect that. We clean up files that were copied into the `package-ape` directory.
- View the script: <a href="../scripts/501-Add-default-args-to-APE.sh" target="_blank">501-Add-default-args-to-APE.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/501-Add-default-args-to-APE.sh
  ```

---
### Test Run on localhost

Now we can test run `mmojo-server`, listening on localhost:8080.
```
$PACKAGE_DIR/$PACKAGE_APE/$PACKAGE_MMOJO_SERVER_FILE
```

After starting up and loading the model, it should display:

**main: server is listening on `http://127.0.0.1:8080` - starting the main loop**<br/>
**srv  update_slots: all slots are idle**

Hit `ctrl-C` on your keyboard to stop it.

If you added SSL certificates, you can connect to the server with `https`:
- [https://localhost:8080](https://127.0.0.1:8080)
- The message about the server listening on `http://127.0.0.1:8080` is incorrect.

If you did not add SSL cxertificates, you can connect to the server with `http`:
- [http://localhost:8080](http://127.0.0.1:8080)

If you're building in WSL, your Windows web browser should be able to connect to the Mmojo Server with the localhost links above.

---
### Test Run on Public Interfaces

If you'd like it to listen on all available interfaces, so you can connect from a browser on another computer:
```
$PACKAGE_DIR/$PACKAGE_APE/$PACKAGE_MMOJO_SERVER_FILE --host 0.0.0.0
```

After starting up and loading the model, it should display:

**main: server is listening on `https://0.0.0.0:8080` - starting the main loop**<br/>
**srv  update_slots: all slots are idle**

Hit `ctrl-C` on your keyboard to stop it.
If you added SSL certificates, you can connect to the server with `https`:
- https://[host-name-or-ip]:8080
- The message about the server listening on `http://127.0.0.1:8080` is incorrect.

If you did not add SSL cxertificates, you can connect to the server with `http`:
- http://[host-name-or-ip]:8080

---
### WORKING ON WHAT'S BELOW

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
