ws.() {
  cd "$HOME/Workspaces/$1"
}

wf.() {
  cd "$HOME/Workflow/$1"
}

# Aliases for git
alias gs='git status '
alias ga='git add '
alias go='git checkout '
alias glc='git diff-tree --no-commit-id --name-only -r HEAD'
alias gc='git commit'
alias push='git push origin HEAD'
alias prev='git checkout @{-1}' # git checkout -

tag-rm() {
	git tag -d "$1" && git push origin ":refs/tags/$1"
}
# tag-rename old new
tag-rename() {
	# TODO: проверка кол-ва аргументов
	git tag "$2" "$1"
	git tag -d "$1"
	git push origin ":refs/tags/$1"
	git push --tags
}
branch-rm() {
	git push origin --delete "$1"
	git branch -d "$1"
}
# some more ls aliases
# TODO: Какие из них все-таки нужны
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ../'
alias ...='cd ../../'

# Alias for dates like in GNU Command Line in Linux (using Homebrew coreutils)
alias date='gdate'

# Some more alias to avoid making mistakes:
# alias rm='rm -i '
# alias cp='cp -i ' 
# alias mv='mv -i '

# using MAMP PHP version
# PHP_VERSION=`ls /Applications/MAMP/bin/php/ | sort -n | tail -1`
# export PATH=/Applications/MAMP/bin/php/${PHP_VERSION}/bin:$PATH

alias tm='tmux attach || tmux new'

# Aliases for applications
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias stree='open -a SourceTree'
