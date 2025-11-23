## 402. Prepare to Test
### About this Step
**This is an experimental section for a differently branded version without the UI customizations. It probably does not work.**

In this step, we will set some environment variables to customize testing.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

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
### Choose `.gguf` Model for Testing
Choose a model. The models from your `$HOME/300-MODELS` directory are available for you to use. This is its own script in your `$HOME/scripts` directory because it sets an environment variable and is resused in these instructions. .
- View the script: <a href="../scripts/ mm-choose-model.sh" target="_blank"> mm-choose-model.sh</a>.
- Run the script.
  ```
  unset CHOSEN_MODEL
  unset CHOSEN_MODEL_SHORT_NAME
  . mm-choose-model.sh
  ```

---
### Optional: Choose CPU Threads
By default, Mmojo Server will use half of the CPU threads available. For benchmarking, you may want to set a different value.

Use default &mdash; half of available threads:
```
unset TEST_CPU_THREADS
```

Use a specified number of threads:
```
export TEST_CPU_THREADS=2
```
```
export TEST_CPU_THREADS=4
```
```
export TEST_CPU_THREADS=8
```

---
### Proceed
- **Next:** [403. Build Debug](403-Build-Debug.md)
- **Previous:** [401. Prepare to Build](401-Prepare-to-Build.md)
- **Up:** [400. Build Dogpile](400-Build-Dogpile.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
