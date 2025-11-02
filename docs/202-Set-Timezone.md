## 202. Set Timezone

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step
The Completion UI indicates a build date in its Settings panel. Set your build system's time zone so that the displayed build date is local to you.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Set Timezone

List available time zone names:
```
timedatectl list-timezones | column
```

Set your system's time zone. Here are some popular US values:
```
sudo timedatectl set-timezone America/Los_Angeles
```
```
sudo timedatectl set-timezone America/Phoenix
```
```
sudo timedatectl set-timezone America/Denver
```
```
sudo timedatectl set-timezone America/Chicago
```
```
sudo timedatectl set-timezone America/New_York
```

Check your new settings:
```
timedatectl
```

Reference: [Timedatectl can control your Linux time and time zone](https://www.networkworld.com/article/970572/using-the-timedatectl-command-to-control-your-linux-time-and-time-zone.html).

---
### Proceed
- **Next:** [203. Create Mmojo Share](203-Create-Mmojo-Share.md)
- **Previous:** [201. Clone Mmojo Server Repo](201-Clone-Mmojo-Server-Repo.md)
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)
