# New MacBook Setup Guide

This repository contains my personal dotfiles and setup instructions for a new Mac system. Follow these steps to get up and running quickly with a fully configured development environment.


## Setup Flow

### 1. System Preparation
- Complete initial macOS setup (Apple ID, iCloud login)
- Install system updates (Apple menu → About This Mac → Software Update)
- Configure keyboard shortcut for changing input sources (System Settings → Keyboard → Keyboard Shortcuts → Input Sources)
- Install 1Password from the App Store
- Install [Homebrew](https://brew.sh/) package manager:
  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- Ensure SSH keys are set up in `~/.ssh` (AirDrop from old Mac or [create new keys](recipes/ssh-keygen.md))

### 2. Get Dotfiles & Core Applications
- Clone this repository:
  ```sh
  mkdir ~/Workspaces
  git clone git@github.com:extg/dotfiles.git ~/Workspaces/dotfiles
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

### 3. Shell Setup with Oh My Zsh and Starship
- Install [Oh My Zsh](https://ohmyz.sh/):
  ```sh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
- Install recommended plugins:
  ```sh
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  ```
- Ensure [Starship](https://starship.rs/) is installed (should be in Brewfile):
  ```sh
  brew install starship
  ```
- Run the dotfiles sync script to update your `.zshrc` with Oh My Zsh plugins and Starship prompt:
  ```sh
  ./sync-dotfiles.sh
  ```
- Reload shell settings:
  ```sh
  source ~/.zshrc
  ```


## Working with Dotfiles

### Making Changes
- Edit dotfiles in the repository (`~/Workspaces/dotfiles`)
- Ensure to update `sync-dotfiles.sh` to include the new file in the rsync command while adding **new dotfiles**
- Run `./sync-dotfiles.sh` to apply changes to your home directory
- Commit and push changes to keep your repository up to date

### Updating Brewfile
- Use `brew bundle dump --force` to regenerate the entire Brewfile based on currently installed packages
- Run `brew bundle` to install any new packages
- To sync your installed packages with your Brewfile (installing missing and removing unlisted packages):
  ```sh
  brew bundle install --cleanup
  ```
- To remove packages not specified in your Brewfile without installing anything:
  ```sh
  brew bundle cleanup --force
  ```


## Recipe Collection

For detailed setup instructions on each component, see the [recipe collection](recipes/index.md).


## Useful References

- [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Awesome dotfiles collection](https://github.com/webpro/awesome-dotfiles)
- [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)
- [Nikita Sobolev's dotfiles](https://github.com/sobolevn/dotfiles)
- [OleksandrKucherenko's Mac setup script](https://gist.github.com/OleksandrKucherenko/e76220f22359e0e49c81c5474b1457a1)
