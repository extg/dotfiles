# Core zsh configuration
export LANG=en_US.UTF-8
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt autocd
setopt extendedglob
unsetopt correct_all

# Homebrew completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# SSH agent configuration
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" > /dev/null
fi

# Load aliases and functions
test -e "$HOME/.exports" && source "$HOME/.exports"
source "$HOME/.aliases"
source "$HOME/.functions"
# Oh-My-Zsh aliases
test -e "$HOME/.oh-my-zsh-aliases/oh-my-zsh-aliases.zsh" && source "$HOME/.oh-my-zsh-aliases/oh-my-zsh-aliases.zsh"

# Syntax highlighting in less
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Path configuration
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Ruby configuration
export GEM_HOME="$HOME/.gem"
export PATH="$HOME/.gem/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/ruby@3.1/bin:$PATH"

# Java configuration
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Other path configurations
export PATH="/Applications/IntelliJ IDEA 2023.3 CE EAP.app/Contents/MacOS:$PATH"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# Rust
source "$HOME/.cargo/env"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Yarn version manager
export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# Poetry
export PATH="$HOME/.local/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# Initialize starship prompt
eval "$(starship init zsh)"
