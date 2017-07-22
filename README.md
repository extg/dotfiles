# Порядок загрузки

```
~/.zshenv
~/.zprofile
~/.zshrc
~/.zlogin
~/.zlogout
```

# xattr
## Что значит `@` в выводе `ls -l`
it means the file has extended attributes. [Full answer](http://unix.stackexchange.com/questions/1646/or-mark-after-running-ls-al)

## How do I remove the “extended attributes” on a file in Mac OS X?

you can also use the -c option to remove all extended attributes:

```
$ xattr -c s.7z
$ xattr s.7z
```
