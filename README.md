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
