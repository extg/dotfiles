#!/bin/bash

# Create directory for Oh-My-Zsh aliases if it doesn't exist
mkdir -p ~/.oh-my-zsh-aliases

# Clone Oh-My-Zsh repository to a temporary directory
echo "Cloning Oh-My-Zsh repository..."
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git /tmp/oh-my-zsh

# Copy the relevant lib files that contain aliases
echo "Copying main aliases files..."
mkdir -p ~/.oh-my-zsh-aliases/lib
cp /tmp/oh-my-zsh/lib/directories.zsh ~/.oh-my-zsh-aliases/lib/
cp /tmp/oh-my-zsh/lib/git.zsh ~/.oh-my-zsh-aliases/lib/
cp /tmp/oh-my-zsh/lib/grep.zsh ~/.oh-my-zsh-aliases/lib/
cp /tmp/oh-my-zsh/lib/theme-and-appearance.zsh ~/.oh-my-zsh-aliases/lib/

# Copy plugin aliases that contain useful aliases
echo "Copying plugin aliases..."
mkdir -p ~/.oh-my-zsh-aliases/plugins

# List of popular plugins with useful aliases
plugins=(
  "git"
  "docker"
  "docker-compose"
  "npm"
  "yarn"
  "python"
  "pip"
  "macos"
  "brew"
  "node"
  "ruby"
  "rust"
  "vscode"
)

# Copy each plugin's aliases
for plugin in "${plugins[@]}"; do
  if [ -d "/tmp/oh-my-zsh/plugins/$plugin" ]; then
    mkdir -p ~/.oh-my-zsh-aliases/plugins/$plugin
    if [ -f "/tmp/oh-my-zsh/plugins/$plugin/$plugin.plugin.zsh" ]; then
      cp "/tmp/oh-my-zsh/plugins/$plugin/$plugin.plugin.zsh" ~/.oh-my-zsh-aliases/plugins/$plugin/
    fi
    # Some plugins have separate aliases.zsh files
    if [ -f "/tmp/oh-my-zsh/plugins/$plugin/aliases.zsh" ]; then
      cp "/tmp/oh-my-zsh/plugins/$plugin/aliases.zsh" ~/.oh-my-zsh-aliases/plugins/$plugin/
    fi
  fi
done

# Create a file to source all the aliases
echo "Creating main sourcing file..."
cat > ~/.oh-my-zsh-aliases/oh-my-zsh-aliases.zsh << 'EOF'
# Main Oh-My-Zsh lib aliases
source ~/.oh-my-zsh-aliases/lib/directories.zsh
source ~/.oh-my-zsh-aliases/lib/git.zsh
source ~/.oh-my-zsh-aliases/lib/grep.zsh
source ~/.oh-my-zsh-aliases/lib/theme-and-appearance.zsh

# Plugin aliases
for plugin_dir in ~/.oh-my-zsh-aliases/plugins/*/; do
  plugin=$(basename "$plugin_dir")
  if [ -f "$plugin_dir/$plugin.plugin.zsh" ]; then
    source "$plugin_dir/$plugin.plugin.zsh"
  fi
  if [ -f "$plugin_dir/aliases.zsh" ]; then
    source "$plugin_dir/aliases.zsh"
  fi
done
EOF

# Clean up
echo "Cleaning up..."
rm -rf /tmp/oh-my-zsh

echo "Oh-My-Zsh aliases have been downloaded to ~/.oh-my-zsh-aliases"
echo "Add the following line to your .zshrc to use them:"
echo "source ~/.oh-my-zsh-aliases/oh-my-zsh-aliases.zsh" 
