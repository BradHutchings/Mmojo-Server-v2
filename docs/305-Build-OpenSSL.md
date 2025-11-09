## 305. Build OpenSSL
### About this Step - DO THIS ONCE
We need to build our own `libssl.a` and `libcrypto.a` becuase:
1. Actual Portable Executable (APE) does not support dynamic loading of libraries.
2. The `libssl.a` and `libcrypto.a` we get by installing `libssl-dev` is built with `_FORTIFY_SOURCE` and will not link against Cosmo's `libc.a`.

This is how I understand the problem. My understanding might be incorrect, but it bears out in trying to find workarounds.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Clone openssl Repo, Build Locally with cosmocc
Clone openssl repo into a `$BUILD_OPENSSSL_DIR` directory, then build openssl with cosmo. Build this once, and leave the `$BUILD_OPENSSSL_DIR` directory between builds.

This script clones the openssl repo to `$BUILD_OPENSSSL_DIR`, then builds it:
- View the script: <a href="../scripts/305-Clone-Build-openssl.sh" target="_blank">305-Clone-Build-openssl.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/305-Clone-Build-openssl.sh
  ```

---
### Proceed
- **Next:** [306. Build Vulkan](306-Build-Vulkan.md)
- **Previous:** [303. Copy Models](303-Copy-Models.md)
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
