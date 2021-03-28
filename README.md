# `dotfiles`

Порядок загрузки:

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
ssh-keygen -t rsa -C "your_email@example.com"
```

Fingerprint:

```sh
ssh-keygen -lf ./id_rsa -E md5
```


## xattr

* Что значит `@` в выводе `ls -l`
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
* сделать разделение по системам (Ubuntu, macOS)
* вынести shellcheck в lint-staged


## System setup

Войти в iCloud, настроить синхронизацию, скачать приложения из AppStore

### Установить [brew](https://brew.sh/index_ru)

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Set iTerm2 as default shell (in menu bar)

Установить [FiraCode](https://github.com/tonsky/FiraCode)
https://github.com/tonsky/FiraCode/wiki/Installing#macos

Настройка vs code http://shanalikhan.github.io/2015/12/15/Visual-Studio-Code-Sync-Settings.html


[spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt)

```
# TODO: установить через brew iTerm2, vs-code-insiders, fira-code
brew install shellcheck
brew install jq
brew install nvm
brew intall yarn
nvm install v8.9
npm install -g spaceship-prompt

brew cask install brave-browser
brew cask install tor-browser
brew cask install notion
brew cask install postman
# and etc...

mkd ~/workspaces
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
