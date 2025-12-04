## 619. Package APE (Performant)
### About this Step

**EXPERIMENTAL**

Let's prepare an Actual Portable Executable (APE) for distribution. You will start with the APE file you built, remove extraneous timezone files from it, add certificates, add the Mmojo Complete user interface, and add a configuration file. You will test run it, then copy it to your Mmojo Share. 

We are not adding a gguf to this. There will be a step to take this package and add ggufs to it. Then we have to re-explain the process.

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
### Create Package Directory
This script creates the package directories, copies the `mmojo-server-ape` file you previously built and assembled, removes extraneous timezone files from it, and displays the contents for your review.
- View the script: <a href="../scripts/610-Create-Package-Directory.sh" target="_blank">610-Create-Package-Directory.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/610-Create-Package-Directory.sh performant
  # Keep track of what we add below for the Args file.
  unset ADDED_CERTS
  unset ADDED_MMOJO_COMPLETE
  unset SELECTED_MODEL
  unset ADDED_MODEL
  ```

---
### Add Certificates to Package
This script adds SSL certificates from `$HOME/300-CERTIFICATES` to the APE package.
- View the script: <a href="../scripts/610-Add-Certificates-to-APE.sh" target="_blank">610-Add-Certificates-to-APE.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/610-Add-Certificates-to-APE.sh performant
  # Keep track of what we add for the Args file.
  export ADDED_CERTS=1
  ```

---
### Add Mmojo Complete UI to Package
This script adds the Mmojo Complete user interface to the APE package.
- View the script: <a href="../scripts/610-Add-UI-to-APE.sh" target="_blank">610-Add-UI-to-APE.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/610-Add-UI-to-APE.sh performant
  # Keep track of what we add for the Args file.
  export ADDED_MMOJO_COMPLETE=1
  ```

---
### Add Args File to Package
This script adds a Args file to the APE package. If you added certs and/or the Mmojo Complete UI above, the Args file will reflect that. We clean up files that were copied into the `package-ape` directory.
- View the script: <a href="../scripts/610-Add-Args-to-APE.sh" target="_blank">610-Add-Args-to-APE.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/610-Add-Args-to-APE.sh performant
  ```

---
### Test Run on localhost

Now we can test run `mmojo-server`, listening on localhost:8080. This should be a script file.
```
THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_PERFORMANT_APE"
if [ -v CHOSEN_MODEL_MNEMONIC ]; then
    THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_MNEMONIC"
fi
cp $MODELS_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf $THIS_PACKAGE_DIR
$THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_FILE
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

If you'd like it to listen on all available interfaces, you can connect from a browser on another computer. This should be a script file.
```
THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_PERFORMANT_APE"
if [ -v CHOSEN_MODEL_MNEMONIC ]; then
    THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_MNEMONIC"
fi
cp $MODELS_DIR/Google-Gemma-1B-Instruct-v3-q8_0.gguf $THIS_PACKAGE_DIR
$THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_FILE --host 0.0.0.0
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

### Copy `mmojo-server` APE to Mmojo Share
This script copies the packaged `mmojo-server` to your Mmojo Share.
- View the script: <a href="../scripts/610-Copy-APE-Package-to-Mmojo-Share.sh" target="_blank">610-Copy-APE-Package-to-Mmojo-Share.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/610-Copy-APE-Package-to-Mmojo-Share.sh performant
  ```

---
### Proceed
- **Next:** [621. Package Executable](621-Package-Executable.md)
- **Previous:** [611. Package APE (Compatible)](611-Package-APE-Compatible.md)
- **Up:** [600. Package Mmojo Server](600-Package-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
