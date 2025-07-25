# Kali in Batch

Kali in Batch is a batch script-based environment that runs a bash shell with many Kali Linux utilities.

[![CI/CD](https://github.com/Kali-in-Batch/kali-in-batch/actions/workflows/cicd.yml/badge.svg)](https://github.com/Kali-in-Batch/kali-in-batch/actions/workflows/cicd.yml)

## Installation

* Download a source code archive from the [latest release](https://github.com/Kali-in-Batch/kali-in-batch/releases/latest).
* Run `kali_in_batch.bat` to start the environment and perform the initial setup.
* During the first run, you will be prompted to assign a drive letter to the root filesystem (e.g., Z:). This drive letter will be used to mount the Kali root filesystem.
* The installer will automatically download dependencies such as Nmap and Neovim using winget.
* The environment will download and set up BusyBox automatically.

## Features

* Bash environment with a Kali Linux style shell prompt.
* Comes with Kali Linux utilities you would expect, including:
  * Netcat
  * Nmap
  * Whois
  * Usable shell scripting environment.
* Simple package manager accessible via the `pkg` command.
* Update checking mechanism that compares local and remote versions to notify if the installation is outdated.
* Custom shell prompt and aliases for common commands to enhance usability.
* [POSIX API reimplementations](./src/lib/posix/README.md)

## Usage

1. Run `kali_in_batch.bat` to launch the Kali in Batch shell.
2. On first run, follow the prompts to assign a drive letter and complete setup.
3. Login with your username or root when prompted.
4. Once setup is complete, enjoy the bash shell with Kali Linux utilities.

## Preview

![image of a terminal nmap scan with uname -a output above](./assets/image.png)

## License

This project is licensed under the GPL-2.0-only License. See the [LICENSE](LICENSE) file for details.

## Links

* [GitHub Repository](https://github.com/Kali-in-Batch/kali-in-batch)
* [Latest Releases](https://github.com/Kali-in-Batch/kali-in-batch/releases/latest)

---

This project is not associated with Kali Linux.
