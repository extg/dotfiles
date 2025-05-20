# Homebrew Installation and Usage

## Install Homebrew

Visit the official Homebrew website for the latest installation instructions:
[https://brew.sh/](https://brew.sh/)

As of this writing, the installation command is:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install Apps from Brewfile

```sh
brew bundle
```

## Save Installed Apps to Brewfile

Create or update a Brewfile with currently installed apps:

```sh
brew bundle dump -f
``` 
