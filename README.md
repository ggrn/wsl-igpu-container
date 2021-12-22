# Dev Container Sample for Compute Runtime for WSL

## Introduction
PoC of a dev container for the [Compute Runtime](https://github.com/intel/compute-runtime) on Windows 11. Tested with vscode and remote-containers extension.

## Requirements
### Host
- Windows 11 Dev Ring
- [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) & Update to Preview
- WSL Distro installed
- Intel GPU & Capable Driver (Intel HD Graphics - Windows DCH - over 30.0.100.9684)
- Docker installed & running (test only without docker desktop installed)

## Usage
1. clone the repo
2. run `fetch-debs.sh` to download the required deb files
3. open folder with vscode
4. install the extension [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
5. open command palette and run `Remote-Container: Rebuild and Reopen in Container`
6. `$ clinfo` to check if the driver is installed correctly

## Memos
### Mounts
To use host installed drivers, you need to mount the driver folder `/usr/lib/wsl/drivers` to the container. Also, you need to mount the `/usr/lib/wsl/lib/libdxcore.so` to the container for the driver to work.
### clinfo
You can use `clinfo` to check the driver install status, but `clinfo` from apt-get is not capable for OpenCL 3.0, so you need to clone from the [clinfo repo](https://github.com/Oblomov/clinfo), build and install it.
### strace
If `clinfo` is not working, you can use `strace clinfo` or `starce -o out.txt clinfo` to check what's wrong.

## See Also
- [Compute Runtime](https://github.com/intel/compute-runtime)
- [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- [VS Code Dev Container](https://code.visualstudio.com/docs/remote/containers)
- [WSL-iGPU-OpenVINO Guide](https://www.intel.com/content/www/us/en/artificial-intelligence/harness-the-power-of-intel-igpu-on-your-machine.html)