# New MacBook Setup Guide

This repository contains my personal dotfiles and setup instructions for a new Mac system. Follow these steps to get up and running quickly with a fully configured development environment.

## Setup Flow

### 1. System Preparation
- Complete initial macOS setup (Apple ID, iCloud login)
- Install system updates (Apple menu → About This Mac → Software Update)
- Install [Homebrew](https://brew.sh/) package manager:
  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

### 2. Get Dotfiles & Core Applications
- Clone this repository:
  ```sh
  mkdir ~/Workspaces
  git clone https://github.com/extg/dotfiles.git ~/Workspaces/dotfiles
  cd ~/Workspaces/dotfiles
  ```
- Install applications from Brewfile: `brew bundle`
- Run bootstrap script to set up dotfiles: `./bootstrap.sh`
- Configure [default applications](recipes/default-apps-setup.md)

### 3. Development Environment
- Set up [zsh configuration](recipes/zsh-loading-order.md)
- Install [Node.js and dev tools](recipes/dev-environment-setup.md)
- Configure [Terminal and fonts](recipes/dev-environment-setup.md)
- Generate [SSH keys](recipes/ssh-keygen.md) for GitHub/GitLab access

### 4. System Configuration
- Apply [macOS defaults](recipes/macos-defaults.md): `bash .macos`
- Configure Dock, Finder, and system preferences
- Set up [keyboard shortcuts](recipes/macos-defaults.md#keyboard-shortcuts) for input source switching and Spotlight

## Recipe Collection

For detailed setup instructions on each component, see the [recipe collection](recipes/index.md).

Each recipe is a self-contained module that can be applied independently based on your needs.
