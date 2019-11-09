# `dotfiles`

Порядок загрузки:

```
~/.zshenv
~/.zprofile
~/.zshrc
~/.zlogin
~/.zlogout
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



Нужно попробовать все ставить через `brew cask`, например, vs code можно было поставить так

```
$ brew update                           # Fetch latest version of homebrew and formula.
$ brew tap caskroom/cask                # Tap the Caskroom/Cask repository from Github using HTTPS.
$ brew search visual-studio-code        # Searches all known Casks for a partial or exact match.
$ brew cask info visual-studio-code     # Displays information about the given Cask
$ brew cask install visual-studio-code  # Install the given cask.
$ brew cleanup                          # For all installed or specific formulae, remove any older versions from the cellar.
```



### Other apps

* 1Password
* iA Writer
* Sip / Color Snapper2
* Chromium
* IntelliJ IDEA
* iTerm2
* Skype
* Telegram
* Tunnelblick ?
* WebStorm
* Yandex Browser
* Adium
* Android file transfer
* BetterZip
* CleanMyMac 3
* Fantastical 2
* iA Writer
* iHex
* 1Password
* zoc7
* VLC
* Parallels
* Transmit
* Tor
* Sublime Text 3
* Sketch
* Robomongo
* MAMP
