## 420. Build Executables
### About this Step
In the following three steps, we will build Mmojo Server (`mmojo-server`) and other llama.cpp targets to run on the CPU of your build environment, with optional GPU support.
- **Compatible** builds run on a wide range of x86_64 and aarch64 processors.
- **Performant** builds run on newer x86_64 processors and Apple M* aarch64 processors.
- **Native** builds run on the processor in your build environment.

**Where:** Perform these steps in both your x86_64 and your aarch64 (arm64) build environments.

**Shortcut:** [Scroll down](#shortcut-build-cpu-test).

---
### SHORTCUT: Build Compatible, Performant, and Native Executables with Optional GPU Support
Before using this shortcut, please work through the steps of building the compatible, performant, and native executables a few times so that you can become familiar with what they do.
```
. mm-choose-gpus.sh
$MMOJO_SERVER_SCRIPTS/420-Build-Executables.sh compatible $CHOSEN_GPUS
$MMOJO_SERVER_SCRIPTS/420-Test-Server.sh compatible $CHOSEN_GPUS
$MMOJO_SERVER_SCRIPTS/420-Build-Executables.sh performant $CHOSEN_GPUS
$MMOJO_SERVER_SCRIPTS/420-Test-Server.sh performant $CHOSEN_GPUS
$MMOJO_SERVER_SCRIPTS/420-Build-Executables.sh native $CHOSEN_GPUS
$MMOJO_SERVER_SCRIPTS/420-Test-Server.sh native $CHOSEN_GPUS
```

---
### Proceed
- **Next:** [421. Build Executables (Compatible)](421-Build-Executables-Compatible.md)
- **Previous:** [412. Build APEs (Performant)](403-Build-APEs-Performant.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
