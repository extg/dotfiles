# Main Oh-My-Zsh lib aliases
source ${0:A:h}/lib/directories.zsh
source ${0:A:h}/lib/git.zsh
source ${0:A:h}/lib/grep.zsh

# Plugin aliases
for plugin_dir in ${0:A:h}/plugins/*/; do
  plugin=$(basename "$plugin_dir")
  if [ -f "$plugin_dir/$plugin.plugin.zsh" ]; then
    source "$plugin_dir/$plugin.plugin.zsh"
  fi
  if [ -f "$plugin_dir/aliases.zsh" ]; then
    source "$plugin_dir/aliases.zsh"
  fi
done
