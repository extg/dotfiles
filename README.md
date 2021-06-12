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
ssh-keygen -t ed25519 -C "your_email@example.com"
```

> [Upgrade Your SSH Key to Ed25519](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54#:~:text=Today%2C%20the%20RSA%20is%20the,3072%20that%20has%20544%20characters.)

Fingerprint:

```sh
ssh-keygen -lf ./id_rsa -E md5
```


## xattr

снимаем расширенные аттрибуты с файла, но вопрос зачем? и как они там оказались?

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

Для того, чтобы снять флаг карантина со всех скачанных файлов в папке Downloads,
выполните команду для Mac OS X 10.6:

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
* сделать разделение по системам (Ubuntu, macOS)
* вынести shellcheck в lint-staged


## System setup

Войти в iCloud, настроить синхронизацию, ~~скачать приложения из AppStore~~
вроде как все уже через brew


### Install [brew](https://brew.sh/index_ru)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


### Install apps from `Brewfile`

install everything from the `Brewfile`

```
brew bundle
```

> for save all installed apps run `brew bundle dump` it creates
> `Brewfile` in the current directory from currently-installed packages


### Other usefull settings

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
