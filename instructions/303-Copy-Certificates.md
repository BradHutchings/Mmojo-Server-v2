## 303. Copy Certificates
### About this Step
In this step, we will create a `300-Certificates` directory and copy certificates from your Mmojo Share.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

**Shortcut:** [Scroll down](#shortcut-copy-models).

TO-DO:
- Use the certificates from here when building the APE and zip packages.
- Path for getting defaults from repo. Not the certs I used in production for Mmojo Knowledge Appliance though.

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
### Create Certificates Directory
This script creates the `$CERTIFICATES_DIR`:
- View the script: <a href="../scripts/303-Create-Certificates-Directory.sh" target="_blank">303-Create-Certificates-Directory.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/303-Create-Certificates-Directory.sh
  ```

---
### Copy Certificate Files from Mmojo Share
This script copies files from your Mmojo Share to the `$CERTIFICATES_DIR`:
- View the script: <a href="../scripts/303-Copy-Certificates-from-Mmojo-Share.sh" target="_blank">303-Copy-Certificates-from-Mmojo-Share.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/303-Copy-Certificates-from-Mmojo-Share.sh
  ```

---
### Proceed
- **Next:** [304. Build Cosmopolitan](304-Build-Cosmopolitan.md)
- **Previous:** [302. Copy Models](302-Copy-Models.md)
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
