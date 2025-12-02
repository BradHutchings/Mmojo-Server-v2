## 410. Build APEs
### About this Step
In the following two steps, we will build Mmojo Server (`mmojo-server`) and other llama.cpp targets as Actual Portable Executable (APEs). These exexcutables run on x86_64 and aarch64 (arm64) across Linux, macOS, Windows, FreeBSD, and some other operating systems. They do not offer GPU support.
- **Compatible** builds run on a wide range of x86_64 and aarch64 processors.
- **Performant** builds run on newer x86_64 processors and Apple M* aarch64 processors.

**Where:** Perform this step in either or both your x86_64 and your aarch64 (arm64) build environments.

---
### SHORTCUT: Build Compatible and Performant APEs
Before using this shortcut, please work through the steps of building the compatible and performant APEs a few times so that you can become familiar with what they do.
```
$MMOJO_SERVER_SCRIPTS/410-Build-with-Cosmo.sh X86_64 compatible
$MMOJO_SERVER_SCRIPTS/410-Build-with-Cosmo.sh aarch64 compatible
$MMOJO_SERVER_SCRIPTS/410-Assemble-Cosmo-APE.sh compatible
$MMOJO_SERVER_SCRIPTS/410-Build-with-Cosmo.sh X86_64 performant
$MMOJO_SERVER_SCRIPTS/410-Build-with-Cosmo.sh aarch64 performant
$MMOJO_SERVER_SCRIPTS/410-Assemble-Cosmo-APE.sh performant
```

---
### SHORTCUT: Test Compatible APE Mmojo Server
```
$MMOJO_SERVER_SCRIPTS/410-Test-Cosmo-APE.sh compatible $TEST_WITH_CHAT_UI
```

---
### SHORTCUT: Test Performant APE Mmojo Server
```
$MMOJO_SERVER_SCRIPTS/410-Test-Cosmo-APE.sh performant $TEST_WITH_CHAT_UI
```

---
### Proceed
- **Next:** [411. Build APEs (Compatible)](411-Build-APEs-Compatible.md)
- **Previous:** [403. Build Debug](403-Build-Debug.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
