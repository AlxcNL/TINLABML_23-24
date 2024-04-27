# Docker

## Installation

<ol>

<li>

**Install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about) (Windows only)**

<ol>

<li>

**Check If Your Processor Supports [Virtualization](https://www.technorms.com/8208/check-if-processor-supports-virtualization)**

</li>

<li>

**Enable Windows Subsystem for Linux**

Enter the following command in Windows Powershell:
```pwsh
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

</li>

<li>

**Enable the Virtual Machine Platform feature**
Enter the following command in Windows Powershell:
```pwsh
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

</li>

<li>

**Make WSL 2 Default**
Enter the following command in Windows Powershell:
```pwsh
wsl –set-default-version 2
```

</li>

</ol>

</li>

<li>

**Install Docker Desktop**
To facilitate you with a managed portable [isolated](https://learndocker.online/introduction/the-whats-and-whys/what-are-containers/) [Development Environment]((https://learndocker.online/introduction/the-whats-and-whys/why-docker-for-devs)), we provide a Docker image in which all dependencies are preinstalled. We prefer Docker for isolation since it is a much lighter solution than [Virtual Machine](https://learndocker.online/introduction/the-whats-and-whys/containers-vs-vms/).

<ol>

<li>

**Download and install [Docker Desktop](https://www.docker.com/get-started)**

[Download for Mac with Apple M* chip](https://docs.docker.com/desktop/mac/apple-silicon/)

<li>

**Test your Docker installation**
Check if you are able to use Docker by running an example container in <b>(git) bash</b>
```sh
docker run hello-world
```

</li>

</ol>

---

### References
[Running GUI's with Docker on OS X](https://www.youtube.com/watch?v=PKyj8sbZNYw&list=LL&index=4&t=6s)
