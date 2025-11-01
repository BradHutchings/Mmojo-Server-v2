## 107. Set up Cross Compile x86_64 on aarch64

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step
Cross-compiling llama.cpp does not work very well right now. The llama.cpp CMake build system is meant to discover the capabilities of the host machine and build for that. In particular, I run into problems with OpenSSL that need to be patched for cosmocc builds to link in compatible static libraries.

I have not had success yet cross-compiling x86_64 builds on aarch64/arm64.

**Where:** Perform this step in both your aarch64 (arm64) build environment.

---
### Environment Variables
Run this script to set environment variables.
```
cd $HOME
export MMOJO_SERVER_DIR="$HOME/101-mmojo-server"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"
```

---
### Set up Cross Compile x86_64 on aarch64 (arm64)
Do this if you're running on aarch64/arm64.

View the script in a new tab: <a href="../scripts/106-Set-up-Cross-Compile-x86_64-on-aarch64.sh" target="_blank">106-Set-up-Cross-Compile-x86_64-on-aarch64.sh</a>

```
bash $MMOJO_SERVER_SCRIPTS/106-Set-up-Cross-Compile-x86_64-on-aarch64.sh
```


Old copy pasta:
```
# Coming soon
```

---
### Proceed
- **Next:** This is the last article in this section.
- **Previous:** [106. Set up Cross Compile - aarch64 on x86_64](106-Set-up-Cross-Compile-aarch64-on-x86_64.md)
- **Up:** [100. Prepare Build Environment](100-Prepare-Build-Environment.md)

---
### Next Section
- **Next Section:** [200. Gather Build Pieces](200-Gather-Build-Pieces.md)
