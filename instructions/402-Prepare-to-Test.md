## 402. Prepare to Test
### About this Step

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
By default, we'll use Google Gemma 1B Instruct v3. If you'd like to test with a different LLM, set one of these values:

---
### Optional: Choose CPU Threads
By default, Mmojo Server will use half of the CPU threads available. For benchmarking, you may want to set a different value.

Use default &mdash; half of available threads:
```
unset TEST_CPU_THREADS
```

Use a specified number of threads:
```
export TEST_CPU_THREADS = 2
```
```
export TEST_CPU_THREADS = 4
```
```
export TEST_CPU_THREADS = 8
```

---
### Optional: Chat User Interface
If you'd prefer to test with the chat-style user interface, set this value:
```
export TEST_WITH_CHAT_UI=1
```

---
### Proceed
- **Next:** [403. Build Debug](403-Build-Debug.md)
- **Previous:** [401. Prepare to Build](401-Prepare-to-Build.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
