#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

cd "$DOTFILES_DIR"

# Install Homebrew packages
echo "Installing Homebrew packages..."
brew bundle

# Run macOS defaults
echo "Applying macOS defaults..."
./.macos

# Set default applications
echo "Setting default applications..."
./scripts/apply-default-apps.sh

# Sync dotfiles to home directory
echo "Syncing dotfiles to home directory..."
./scripts/sync-dotfiles.sh

echo "Initialization complete!" 
