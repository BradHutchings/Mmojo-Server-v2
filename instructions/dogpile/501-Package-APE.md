## 501. Package APE

### About this Step

Let's prepare an Actual Portable Executable (APE) for distribution. You will start with the APE file you built, remove extraneous timezone files from it, add certificates, add the Mmojo Complete user interface, add a `.gguf` model file, and add a configuration file. You will test run it.

**TO-DO**:
- Shortcut after picking gguf.

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
### Choose `.gguf` Model to Add to Package
Choose a model. The models from your `$HOME/300-MODELS` directory are available for you to use. This is its own script in your `$HOME/scripts` directory because it sets an environment variable and is resused in these instructions. We choose the model first so we can include its short name in the package folder name and the APE file name.
- View the script: <a href="../../scripts/dogpile/ mm-choose-model.sh" target="_blank"> mm-choose-model.sh</a>.
- Run the script.
  ```
  unset CHOSEN_MODEL
  unset CHOSEN_MODEL_SHORT_NAME
  . mm-choose-model.sh
  ```

---
### Create Package Directory
This script creates the package directories, copies the `dogpile-ape` file you previously built and assembled, removes extraneous timezone files from it, and displays the contents for your review.
- View the script: <a href="../../scripts/dogpile/501-Create-Package-Directory.sh" target="_blank">501-Create-Package-Directory.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script.
  ```
  $DOGPILE_SCRIPTS/501-Create-Package-Directory.sh
  # Keep track of what we add below for the `default-args` file.
  unset SELECTED_MODEL
  unset ADDED_MODEL
  ```

<!--
---
### Add Certs to Package
This script adds SSL certificates from the Mmojo Share to the APE package.
- View the script: <a href="../../scripts/dogpile/501-Add-Certs-to-APE.sh" target="_blank">501-Add-Certs-to-APE.sh</a>.
- Run the script.
  ```
  $DOGPILE_SCRIPTS/501-Add-Certs-to-APE.sh
  # Keep track of what we add for the `default-args` file.
  export ADDED_CERTS=1
  ```

*Note: I use these certificates in my Mmojo Knowledge Appliance. I will document why and how to create these certificates soon.*
-->

<!--
---
### Add Mmojo Complete UI to Package
This script adds the Mmojo Complete user interface to the APE package.
- View the script: <a href="../../scripts/dogpile/501-Add-Mmojo-Complete-to-APE.sh" target="_blank">501-Add-Mmojo-Complete-to-APE.sh</a>.
- Run the script.
  ```
  $DOGPILE_SCRIPTS/501-Add-Mmojo-Complete-to-APE.sh
  # Keep track of what we add for the `default-args` file.
  export ADDED_MMOJO_COMPLETE=1
  ```
-->

---
### Add `.gguf` Model to Package
This script adds the chosen `.gguf` model to the APE package.
- View the script: <a href="../../scripts/dogpile/501-Add-gguf-Model-to-APE.sh" target="_blank">501-Add-gguf-Model-to-APE.sh</a>.
- Run the script.
  ```
  if [ -v CHOSEN_MODEL ]; then
    $DOGPILE_SCRIPTS/501-Add-gguf-Model-to-APE.sh
    # Keep track of what we add for the `default-args` file.
    export ADDED_MODEL=1
  fi
  ```

---
### Add `default-args` File to Package
This script adds a `default-args` file to the APE package. If you a .gguf model above, the `default-args` file will reflect that. We clean up files that were copied into the `package-ape` directory.
- View the script: <a href="../../scripts/dogpile/501-Add-default-args-to-APE.sh" target="_blank">501-Add-default-args-to-APE.sh</a>.
- Run the script.
  ```
  $DOGPILE_SCRIPTS/501-Add-default-args-to-APE.sh
  ```

---
### Test Run on localhost

Now we can test run `dogpile`, listening on localhost:8080. This should be a script file.
```
THIS_PACKAGE_DIR="$DOGPILE_PACKAGE_DIR/$PACKAGE_APE"
if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
    THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
fi
$THIS_PACKAGE_DIR/$PACKAGE_DOGPILE_FILE
```

After starting up and loading the model, it should display:

**main: server is listening on `http://127.0.0.1:8080` - starting the main loop**<br/>
**srv  update_slots: all slots are idle**

You can connect to the server with `http`:
- [http://localhost:8080](http://127.0.0.1:8080)

Hit `ctrl-C` on your keyboard to stop the dogpile server.

If you're building in WSL, your Windows web browser should be able to connect to Dogpile with the localhost link above.

---
### Test Run on Public Interfaces

If you'd like it to listen on all available interfaces, you can connect from a browser on another computer. This should be a script file.
```
THIS_PACKAGE_DIR="$DOGPILE_PACKAGE_DIR/$PACKAGE_APE"
if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
    THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
fi
$THIS_PACKAGE_DIR/$PACKAGE_DOGPILE_FILE --host 0.0.0.0
```

After starting up and loading the model, it should display:

**main: server is listening on `https://0.0.0.0:8080` - starting the main loop**<br/>
**srv  update_slots: all slots are idle**

You can connect to the server with `http`:
- http://[host-name-or-ip]:8080

Hit `ctrl-C` on your keyboard to stop the dogpile server.

---
### Proceed
- **Next:** This is the final step in this section.
- **Previous:** This is the first step in this section.
- **Up:** [500. Package Dogpile](500-Package-Dogpile.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
