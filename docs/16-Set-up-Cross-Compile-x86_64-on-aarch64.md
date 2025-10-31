## 16. Set up Cross Compile x86_64 on aarch64

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step
Cross-compiling llama.cpp does not work very well right now. The llama.cpp CMake build system is meant to discover the capabilities of the host machine and build for that. In particular, I run into problems with OpenSSL that need to be patched for cosmocc builds to link in compatible static libraries.

I have not had success yet cross-compiling x86_64 builds on aarch64/arm64.

**Where:** Perform this step in both your aarch64 (arm64) build environment.

---
### Set up Cross Compile x86_64 on aarch64 (arm64)
Do this if you're running on aarch64/arm64:
```
# Coming soon
```

---
### Proceed
- **Next:** This is the last article in this section.
- **Previous:** [15. Set up Cross Compile - aarch64 on x86_64](15-Set-up-Cross-Compile-aarch64-on-x86_64.md)
- **Up:** [10. Prepare Build Environment](10-Prepare-Build-Environment.md)

---
### Next Section
- **Next Section:** [20. Gather Build Pieces](20-Gather-Build-Pieces.md)
