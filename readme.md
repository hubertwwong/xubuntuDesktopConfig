# debianDesktopConfig

An Ansible-based configuration playbook for provisioning Debian-based desktop environments.

## Features & Installed Software

This setup configures the following packages and tools:
1. **VSCode**: Installed natively via Microsoft's official APT repositories (replaces snap installations).
2. **Google Chrome**: Handled via local package installation.
3. **Docker CE**: Dynamically detects the OS distribution (Debian or Ubuntu) and configures the appropriate repositories with keyring GPG signing key protection.
4. **Mise Polyglot Runtime Manager**: Manages language runtimes and CLI tools globally under `~/.config/mise/config.toml`:
   * **Node.js** (LTS)
   * **Go** (1.22)
   * **Python** (3.11)
   * **kubectl** (Latest stable)
   * **helm** (Latest stable)
5. **VirtualBox Guest Additions**: Natively installs `virtualbox-guest-dkms` and `virtualbox-guest-x11` packages directly through the package manager (removing manual GUI mounting of guest additions ISO).
6. **Dotfiles & Bash Aliases**: Deploys dynamic prompts displaying Git branch and Kubernetes current contexts, along with aliases for Kubernetes (`k`), Minikube (`mk`), and Docker inspect commands.

## Pre-requisites
Ensure `git` and `ansible` are installed on the host:
```bash
sudo apt update && sudo apt install -y git ansible
```

## Running the Playbook

To run the complete setup, invoke the `site-all.yaml` playbook. Provide your Git name and email to configure Git settings:

```bash
ansible-playbook -v prod/initialSetup/site-all.yaml --extra-vars "git_name='Your Name' git_email='your.email@example.com'"
```

*Note: Since the user has passwordless sudo access, running it does not require passing the `--ask-become-pass` flag.*

If you only need a minimal setup (without Gnome UI configurations), you can run:

```bash
ansible-playbook -v prod/initialSetup/site-min.yaml
```

## Removed/Decommissioned Features
* **Resilio Sync**: Completely decommissioned.
* **Java / JVM (`JAVA_HOME`)**: Removed.
* **Poetry**: Sourcing checks removed (preferring modern alternatives like `uv`).
