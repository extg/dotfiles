# Development Environment Setup

## Node.js Setup

Set default Node version:

```sh
nvm install v12
```

## Terminal Setup

Set iTerm2 as default shell (in menu bar)

## Font Installation

Install [FiraCode](https://github.com/tonsky/FiraCode):
https://github.com/tonsky/FiraCode/wiki/Installing#macos

## Shell Prompt

Setup [starship](https://github.com/starship/starship):

```sh
curl -sS https://starship.rs/install.sh | sh
```

Add the following to the end of `~/.zshrc`:

```sh
eval "$(starship init zsh)"
```

## Visual Studio Code

Setup VS Code sync:
http://shanalikhan.github.io/2015/12/15/Visual-Studio-Code-Sync-Settings.html

## WebStorm CLI Setup

Create a shell script for WebStorm CLI:

```sh
touch /usr/local/bin/webstorm
chmod +x /usr/local/bin/webstorm
```

Add the following content:

```sh
#!/bin/sh

open -na "WebStorm.app" --args "$@"
```

## Create Workspace Directory

```sh
mkdir -p ~/Workspaces
``` 
