## 1402. Prepare to Test
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
### Optional: Choose LLM
By default, we'll use Google Gemma 1B Instruct v3. Set the default with:
```
unset TEST_MODEL
```

If you'd like to test with a different LLM, set one of these values:
```
export TEST_MODEL="Google-Gemma-270M-Instruct-v3-q8_0.gguf"
```
```
export TEST_MODEL="Google-Gemma-4B-Instruct-v3-q8_0.gguf"
```
```
export TEST_MODEL="Google-Gemma-E2B-Instruct-v3n-q8_0.gguf"
```
```
export TEST_MODEL="Google-Gemma-E4B-Instruct-v3n-q8_0.gguf"
```

Make sure the LLM has been downloaded or copied to your `$HOME/300-MODEKS` directory. Otherwise, the `Test-`scripts will fall back to Google Gemma 1B Instruct v3.

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
- **Next:** [1403. Build Debug](1403-Build-Debug.md)
- **Previous:** [1401. Prepare to Build](1401-Prepare-to-Build.md)
- **Up:** [1400. Build Dogpile](1400-Build-Dogpile.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
