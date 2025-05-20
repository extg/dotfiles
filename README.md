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
- Run the initialization script to set up everything at once:
  ```sh
  ./init.sh
  ```
  This will:
  - Install applications from Brewfile
  - Apply macOS defaults
  - Configure default applications
  - Sync dotfiles to your home directory


## Working with Dotfiles

### Making Changes
- Edit dotfiles in the repository (`~/Workspaces/dotfiles`)
- Ensure to update `sync-dotfiles.sh` to include the new file in the rsync command while adding **new dotfiles**
- Run `./sync-dotfiles.sh` to apply changes to your home directory
- Commit and push changes to keep your repository up to date

### Updating Brewfile
- Use `brew bundle dump --force` to regenerate the entire Brewfile based on currently installed packages
- Run `brew bundle` to install any new packages


## Recipe Collection

For detailed setup instructions on each component, see the [recipe collection](recipes/index.md).
