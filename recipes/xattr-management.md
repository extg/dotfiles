# macOS Extended Attributes (xattr)

## View Extended Attributes

Files with extended attributes show an `@` symbol in `ls -l` output.

## Remove Extended Attributes

Remove all extended attributes from a file:

```sh
xattr -c file.name
```

View current extended attributes:

```sh
xattr file.name
```

## Remove Quarantine Flag

Remove the quarantine flag from all downloaded files:

```sh
xattr -d -r com.apple.quarantine ~/Downloads
``` 
