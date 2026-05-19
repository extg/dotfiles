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
unsetopt correct_all

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- using Starship instead
ZSH_THEME=""

# Oh My Zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Homebrew completions (macOS only)
if [[ "$OSTYPE" == darwin* ]] && type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# Sesh integration - Alt-s to open session manager
if command -v sesh &> /dev/null; then
  function sesh-sessions() {
    {
      exec </dev/tty
      exec <&1
      local session
      session=$(sesh list -i | fzf \
        --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ' \
        --header '  ^a all ^t tmux ^x zoxide' \
        --bind 'tab:down,btab:up' \
        --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list -i)' \
        --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -it)' \
        --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -iz)')
      [[ -z "$session" ]] && return
      sesh connect "$session"
    }
  }

  zle -N sesh-sessions
  bindkey '\es' sesh-sessions  # Option-s (Alt-s)
  bindkey '^o' sesh-sessions   # Ctrl-o (альтернативный биндинг)
fi

# SSH agent configuration
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" > /dev/null
fi

# Load aliases and functions
test -e "$HOME/.exports" && source "$HOME/.exports"
source "$HOME/.aliases"
source "$HOME/.functions"

# Syntax highlighting in less
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Path configuration
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# NVM configuration
export NVM_DIR="$HOME/.nvm"
if [[ "$OSTYPE" == darwin* ]]; then
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
else
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

# Ruby configuration
export GEM_HOME="$HOME/.gem"
export PATH="$HOME/.gem/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH="/usr/local/opt/ruby@3.1/bin:$PATH"
fi

# Java configuration (macOS Homebrew path)
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

# Other macOS-specific path configurations
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH="/Applications/IntelliJ IDEA 2023.3 CE EAP.app/Contents/MacOS:$PATH"
  export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
  export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
fi

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Yarn version manager (macOS Homebrew path)
if [[ "$OSTYPE" == darwin* ]]; then
  export YVM_DIR=/usr/local/opt/yvm
  [ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
fi

# Poetry
export PATH="$HOME/.local/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# Initialize pyenv path - adds pyenv executables to PATH
eval "$(pyenv init --path)"
# Initialize pyenv shell integration - enables version switching, completions, etc.
eval "$(pyenv init -)"

# Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# Initialize starship prompt
eval "$(starship init zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Initialize zoxide (must be at the end of .zshrc)
if command -v zoxide &> /dev/null; then
  export _ZO_DOCTOR=0
  eval "$(zoxide init zsh --cmd cd)"
fi
