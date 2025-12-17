#!/usr/bin/env bash

# Install Cursor extensions from .cursor/extensions.txt
# Usage: ./install-cursor-extensions.sh [--sync]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXTENSIONS_FILE="${SCRIPT_DIR}/.cursor/extensions.txt"

if [ ! -f "$EXTENSIONS_FILE" ]; then
	echo "Error: Extensions file not found at $EXTENSIONS_FILE"
	exit 1
fi

# Check if cursor command is available
if ! command -v cursor &> /dev/null; then
	echo "Error: 'cursor' command not found. Make sure Cursor is installed and in PATH."
	echo "You may need to install the 'cursor' command from Cursor's command palette:"
	echo "  Cmd+Shift+P -> 'Shell Command: Install cursor command in PATH'"
	exit 1
fi

SYNC_MODE=false
if [ "$1" == "--sync" ] || [ "$1" == "-s" ]; then
	SYNC_MODE=true
fi

if [ "$SYNC_MODE" = true ]; then
	echo "Syncing Cursor extensions (installing missing, removing extra)..."
	
	# Get list of installed extensions
	INSTALLED=$(cursor --list-extensions)
	
	# Read extensions from file
	DESIRED=$(grep -v '^#' "$EXTENSIONS_FILE" | grep -v '^$' | tr '\n' ' ')
	
	# Install missing extensions
	echo ""
	echo "Installing missing extensions..."
	INSTALLED_COUNT=0
	SKIPPED_COUNT=0
	
	while IFS= read -r extension; do
		# Skip comments and empty lines
		[[ "$extension" =~ ^#.*$ ]] && continue
		[[ -z "$extension" ]] && continue
		
		# Check if already installed
		if echo "$INSTALLED" | grep -q "^${extension}$"; then
			echo "  ✓ Already installed: $extension"
			SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
		else
			echo "  → Installing: $extension"
			if cursor --install-extension "$extension" &> /dev/null; then
				INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
			else
				echo "    ✗ Failed to install: $extension"
			fi
		fi
	done < "$EXTENSIONS_FILE"
	
	# Remove extensions not in the list
	echo ""
	echo "Checking for extensions to remove..."
	REMOVED_COUNT=0
	
	while IFS= read -r installed_ext; do
		# Skip if extension is in the desired list
		if echo "$DESIRED" | grep -q "$installed_ext"; then
			continue
		fi
		
		# Skip built-in extensions (usually start with 'vscode.')
		if [[ "$installed_ext" =~ ^vscode\. ]]; then
			continue
		fi
		
		echo "  → Removing: $installed_ext (not in extensions.txt)"
		if cursor --uninstall-extension "$installed_ext" &> /dev/null; then
			REMOVED_COUNT=$((REMOVED_COUNT + 1))
		fi
	done <<< "$INSTALLED"
	
	echo ""
	echo "Sync complete!"
	echo "  Installed: $INSTALLED_COUNT"
	echo "  Skipped: $SKIPPED_COUNT"
	echo "  Removed: $REMOVED_COUNT"
else
	echo "Installing Cursor extensions from $EXTENSIONS_FILE..."
	echo ""
	
	INSTALLED_COUNT=0
	SKIPPED_COUNT=0
	FAILED_COUNT=0
	
	while IFS= read -r extension; do
		# Skip comments and empty lines
		[[ "$extension" =~ ^#.*$ ]] && continue
		[[ -z "$extension" ]] && continue
		
		# Check if already installed
		if cursor --list-extensions | grep -q "^${extension}$"; then
			echo "  ✓ Already installed: $extension"
			SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
		else
			echo "  → Installing: $extension"
			if cursor --install-extension "$extension" &> /dev/null; then
				INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
			else
				echo "    ✗ Failed to install: $extension"
				FAILED_COUNT=$((FAILED_COUNT + 1))
			fi
		fi
	done < "$EXTENSIONS_FILE"
	
	echo ""
	echo "Installation complete!"
	echo "  Installed: $INSTALLED_COUNT"
	echo "  Skipped: $SKIPPED_COUNT"
	if [ $FAILED_COUNT -gt 0 ]; then
		echo "  Failed: $FAILED_COUNT"
	fi
fi
