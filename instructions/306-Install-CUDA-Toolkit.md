## 306. Install CUDA Toolkit
### About this Step
CUDA is... NVIDIA

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Install with `apt`
This works as we need it to with WSL:
```
sudo apt install -y nvidia-cuda-toolkit
```

It installs `nvcc` in `/usr/bin`. CMake should be able to see it.

---
### Find Download and Install Script
If installing with `apt` did not work, go here, find your toolkit, run the install script. This link will get you the right stuff for WSL:

[CUDA Toolkit for WSL](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local)

---
### Proceed
- **Next:** [307. Build Vulkan SDK](307-Build-Vulkan-SDK.md)
- **Previous:** [305. Build OpenSSL](305-Build-OpenSSL.md)
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
