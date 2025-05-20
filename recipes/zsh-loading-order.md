# Zsh Loading Order

Zsh configuration files are loaded in the following sequence:

```
~/.zshenv
~/.zprofile
~/.zshrc
~/.zlogin
~/.zlogout
```

## Compare Files with Git

To compare your current zsh config with the dotfiles version:

```bash
gd --no-index ~/.zshrc ~/Workspaces/dotfiles/.zshrc
``` 
