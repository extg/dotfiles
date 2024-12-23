# `dotfiles`

Loading order:

```
~/.zshenv
~/.zprofile
~/.zshrc
~/.zlogin
~/.zlogout
```

diff versions of file
```
gd --no-index ~/.zshrc ~/Workspaces/dotfiles/.zshrc
```


## `ssh`

## `ssh-keygen`

Generate a new key:

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

> [Upgrade Your SSH Key to Ed25519](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54#:~:text=Today%2C%20the%20RSA%20is%20the,3072%20that%20has%20544%20characters.)

Fingerprint:

```sh
ssh-keygen -lf ./id_rsa -E md5
```


## xattr

Removing extended attributes from a file, but the question is why? and how did they get there?

* What does `@` mean in the output of `ls -l`
  — it means the file has extended attributes.
    [Full answer](http://unix.stackexchange.com/questions/1646/or-mark-after-running-ls-al)
* How do I remove the “extended attributes”
  on a file in Mac OS X?
  — you can also use the -c option to remove
    all extended attributes:

```
$ xattr -c s.7z
$ xattr s.7z
```

To remove the quarantine flag from all downloaded files in the Downloads folder,
execute the command for Mac OS X 10.6:

```
xattr -d -r com.apple.quarantine ~/Downloads
```


## links
* https://github.com/mathiasbynens/dotfiles
* https://github.com/mathiasbynens/dotfiles/issues/687
* https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
* https://github.com/Tyriar/dotfiles

## TODO

* https://superuser.com/questions/117841/get-colors-in-less-or-more
* oh my zsh fuzzy matching cd
* https://github.com/junegunn/fzf#key-bindings-for-command-line
* https://github.com/bbatsov/prelude
* https://sohabr.net/habr/post/248663/
* make a separation by systems (Ubuntu, macOS)
* move shellcheck to lint-staged


## System setup

Log in to iCloud, set up synchronization, ~~download applications from the AppStore~~
it seems everything is already through brew


### Install [brew](https://brew.sh/index_ru)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


### Install apps from `Brewfile`

install everything from the `Brewfile`

```
brew bundle
```

> for save all installed apps run `brew bundle dump -f` it creates
> `Brewfile` in the current directory from currently-installed packages


### Other useful settings

> iTerm2 was installed via brew

Set iTerm2 as default shell (in menu bar)


Set default node

```
nvm install v12
```


Install [FiraCode](https://github.com/tonsky/FiraCode)
https://github.com/tonsky/FiraCode/wiki/Installing#macos


Setup VS Code http://shanalikhan.github.io/2015/12/15/Visual-Studio-Code-Sync-Settings.html


Setup [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt)

```
npm install -g spaceship-prompt
```


Create `Workspaces`

```
mkd ~/Workspaces
```

Add a Spacer to the Application Side of Your Dock


```sh
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock
# or add small spacer
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}' && killall Dock
```


Disable recent apps

```
defaults write com.apple.dock show-recents -bool FALSE
```


Reset the Dock to its default state

```
defaults delete com.apple.dock; killall Dock
```

```sh
defaults write com.apple.dock show-process-indicators -bool true
efaults write com.apple.dock autohide -bool true
```


Don't forget to setup macos defaults

```
bash .macos
```


## Setup default apps

Duti requires you to use a known application's bundle id in order to set it as the default for a given document type. Use the following command to list all known ids for your system.

```sh
# List all apps bundle ids
lsappinfo | grep 'bundleID="' | cut -d'"' -f2 | sort

# OR List/Search all existing UTIs (Uniform Type Identifiers)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump
```



```sh
./setup-default-apps.sh
```


### Setup webstorm [Command-line interface](https://www.jetbrains.com/help/webstorm/working-with-the-ide-features-from-command-line.html)

You can create a shell script with this command in a directory from your PATH environment variable. For example, create the file **/usr/local/bin/webstorm** with the following contents:

```sh
touch /usr/local/bin/webstorm
chmod +x /usr/local/bin/webstorm
pbpaste > /usr/local/bin/webstorm
```

```sh
#!/bin/sh

open -na "WebStorm.app" --args "$@"
```
