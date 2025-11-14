## 304. Build Cosmopolitan
### About this Step - DO THIS ONCE
In this step, we will clone the Cosmopolitan repo, fix known problems, and build it. You don't need to do this every time you build Mmojo Server.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Clone Cosmopolitan Repo, Build Locally
Clone Cosmopolitan repo into a `$BUILD_COSMOPOLITAN_DIR` directory, fix bugs, then build Cosmopolitan. Build this once, and leave the `$BUILD_COSMOPOLITAN_DIR` directory between builds.

This script clone the Cosmopolitan repo to `$BUILD_COSMOPOLITAN_DIR`:
- View the script: <a href="../scripts/304-Clone-Build-Cosmopolian.sh" target="_blank">304-Clone-Build-Cosmopolian.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/304-Clone-Build-Cosmopolian.sh
  ```

Need to add `includes/sys/syslimits.h` after Cosmo is cloned and built. It will `#include <linux/limits.h>`. This will fix a recurring build problem with `cosmocc` and `llama.cpp`.

---
### WSL Note
If you get build errors in the CMake preparation step, you most likely did not turn off interoperability in WSL. Please see instructions in [201. Prepare WSL](201-Prepare-WSL.md).

You can turn off interoperability temporarily with this command:
```
sudo sh -c 'echo -1 > /proc/sys/fs/binfmt_misc/WSLInterop-late'
```

---
### Proceed
- **Next:** [305. Build OpenSSL](305-Build-OpenSSL.md)
- **Previous:** [303. Copy Models](303-Copy-Models.md)
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
