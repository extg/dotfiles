# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# some more ls aliases
# TODO: Какие из них все-таки нужны
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias for dates like in GNU Command Line in Linux (using Homebrew coreutils)
# alias date='gdate'

# https://docs.reactioncommerce.com/reaction-docs/master/requirements#macos
# ulimit -n 65536 65536
