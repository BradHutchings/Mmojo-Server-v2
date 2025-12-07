## 510. APE Builds
### About Dogpile
**Dogpile** is an example of a branded developer experience. [Read more about Dogpile](400-Build-Dogpile.md).

---
### About this Step
In the following two steps, we will build the Dogpile server (`dogpile`) and other llama.cpp targets as Actual Portable Executable (APEs). These exexcutables run on x86_64 and aarch64 (arm64) across Linux, macOS, Windows, FreeBSD, and some other operating systems. They do not offer GPU support.
- **Compatible** builds run on a wide range of x86_64 and aarch64 processors.
- **Performant** builds run on newer x86_64 processors and Apple M* aarch64 processors.

**Where:** Perform this step in either or both your x86_64 and your aarch64 (arm64) build environments.

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
### SHORTCUT: Build Compatible and Performant APEs
Before using this shortcut, please work through the steps of building the compatible and performant APEs a few times so that you can become familiar with what they do.
```
$MMOJO_SERVER_SCRIPTS/510-Build-with-Cosmo.sh X86_64 compatible dogpile
$MMOJO_SERVER_SCRIPTS/510-Build-with-Cosmo.sh aarch64 compatible dogpile
$MMOJO_SERVER_SCRIPTS/510-Assemble-Cosmo-APE.sh compatible dogpile
$MMOJO_SERVER_SCRIPTS/510-Build-with-Cosmo.sh X86_64 performant dogpile
$MMOJO_SERVER_SCRIPTS/510-Build-with-Cosmo.sh aarch64 performant dogpile
$MMOJO_SERVER_SCRIPTS/510-Assemble-Cosmo-APE.sh performant dogpile
```

---
### SHORTCUT: Test Compatible APE Mmojo Server
After you build all the APEs, you can test the compatible APE:
```
$MMOJO_SERVER_SCRIPTS/510-Test-Cosmo-APE.sh compatible command-line 1 dogpile
```

---
### SHORTCUT: Test Performant APE Mmojo Server
After you build all the APEs, you can test the performant APE:
```
$MMOJO_SERVER_SCRIPTS/510-Test-Cosmo-APE.sh performant command-line 1 dogpile
```

---
### Proceed
- **Next:** [511. APE (Compatible)](511-APE-Compatible.md)
- **Previous:** [503. Debug Build](503-Debug-Build.md)
- **Up:** [500. Build Mmojo Server](500-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
