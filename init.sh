#!/usr/bin/env bash

# Install Homebrew packages
echo "Installing Homebrew packages..."
brew bundle

# Run macOS defaults
echo "Applying macOS defaults..."
./macos

# Set default applications
echo "Setting default applications..."
./apply-default-apps.sh

# Sync dotfiles to home directory
echo "Syncing dotfiles to home directory..."
./sync-dotfiles.sh

echo "Initialization complete!" 
