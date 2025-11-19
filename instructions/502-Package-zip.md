## 502. Package zip
### About this Step

**This step is not implemented yet.**

The gist will be:
1. Pick a build to copy -- APE, CPU, CUDA, or Vulkan. It gets coopied over, folder gets named.
2. `mmojo-server-support` folder gets created.
3. Add certs.
4. Add Mmojo Complete.
5. Add .gguf.
6. Add `default-args` file.
7. zip it all up.
8. Copy to Mmojo Server.


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
### Proceed
- **Next:** [503. Package SEAS](503-Package-SEAS.md)
- **Previous:** [501. Package APE](501-Package-APE.md)
- **Up:** [500. Package Mmojo Server](500-Package-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
