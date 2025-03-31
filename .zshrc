# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="default"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ssh-agent)

# TODO: подумать надо ли это
# plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# Resolve symbolic links in ~/.ssh/identities and add to identities array
ssh_identities=()
# for identity in ~/.ssh/identities/*; do
#     # Check if the file is a symlink and resolve it
#     if [[ -L "$identity" ]]; then
#         real_identity=$(readlink -f "$identity")
#         ssh_identities+=("$real_identity")
#     else
#         ssh_identities+=("$identity")
#     fi
# done

# Setup ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent identities $ssh_identities
# To check added identites use `ssh-add -l`


source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# TODO: и надо ли это
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Подсветка синтаксиса в less
# https://gist.github.com/textarcana/4611277
# export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
# export LESS=" -R "
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Disabling Autocorrect
unsetopt correct_all

# автоматическое добавление ключей в ssh-agent
# [ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
# ssh-add $HOME/.ssh/id_*


# alias less='less -M -N -g -i -J --underline-special --SILENT'
# alias more='less'

test -e "$HOME/.exports" && source "$HOME/.exports"

source "$HOME/.aliases";
source "$HOME/.functions";

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# run "brew install ruby" before
export GEM_HOME="$HOME/.gem"
export PATH=$HOME/bin:$PATH
export PATH="$HOME/.gem/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/ruby@3.1/bin:$PATH"
export PATH="/Applications/IntelliJ IDEA 2023.3 CE EAP.app/Contents/MacOS:$PATH"

source "$HOME/.cargo/env"

eval "$(direnv hook zsh)"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

# SPACESHIP_DOCKER_SHOW="false"
# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship
# source "/usr/local/opt/spaceship/spaceship.zsh"
# 
eval "$(starship init zsh)"

# bun completions
[ -s "/Users/vk/.bun/_bun" ] && source "/Users/vk/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# TODO: Is it still needed in case of corepack?
# Yarn version manager
export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# for poetry
export PATH="/Users/vk/.local/bin:$PATH"

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
