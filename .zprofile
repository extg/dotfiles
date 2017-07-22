# Load the shell dotfiles, and then some:
for file in ~/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Alias for dates like in GNU Command Line in Linux (using Homebrew coreutils)
# alias date='gdate'

# https://docs.reactioncommerce.com/reaction-docs/master/requirements#macos
# ulimit -n 65536 65536
