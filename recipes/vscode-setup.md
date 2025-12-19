# VS Code & Cursor Configuration

This guide covers VS Code and Cursor configuration management and troubleshooting steps.

## Settings Synchronization

Settings are stored in the `vscode/` directory and can be synced to both VS Code and Cursor.

### Quick Setup

Run the sync script to automatically create symbolic links:

```bash
cd ~/Workspaces/dotfiles
./scripts/sync-vscode-settings.sh
```

This script will:
- Create symbolic links from VS Code/Cursor config directories to `vscode/` folder in dotfiles
- Backup existing files if needed
- Work with both VS Code and Cursor simultaneously
- Support VS Code Insiders

### Manual Setup

If you prefer to set up links manually:

#### For Cursor:
```bash
ln -s ~/Workspaces/dotfiles/vscode/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
ln -s ~/Workspaces/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json
```

#### For VS Code:
```bash
ln -s ~/Workspaces/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/Workspaces/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```

### Benefits

This approach allows you to:
- Store settings in your dotfiles repository for version control
- Sync settings across multiple machines
- Keep identical settings between VS Code and Cursor
- Make changes through editor UI that automatically update your repository

**Note**: Make sure to commit and push changes to your `vscode/` files to keep settings synchronized across machines.

## Extensions Management

### Installing Extensions

To install all extensions from `vscode/extensions.txt`:

```bash
cd ~/Workspaces/dotfiles
./scripts/install-cursor-extensions.sh
```

This will:
- Install all extensions listed in `vscode/extensions.txt`
- Skip extensions that are already installed
- Show progress and summary

### Syncing Extensions

To synchronize installed extensions with `vscode/extensions.txt` (install missing, remove extra):

```bash
cd ~/Workspaces/dotfiles
./scripts/install-cursor-extensions.sh --sync
```

**Note**: Sync mode will remove extensions that are not in `extensions.txt` (except built-in VS Code extensions).

### Prerequisites

Make sure the `cursor` command is available in your PATH. If not:
1. Open Cursor
2. Press `Cmd+Shift+P` to open command palette
3. Run: `Shell Command: Install 'cursor' command in PATH`

### Updating Extensions List

To update `vscode/extensions.txt` with currently installed extensions:

```bash
cursor --list-extensions > ~/Workspaces/dotfiles/vscode/extensions.txt
```

Or for VS Code:

```bash
code --list-extensions > ~/Workspaces/dotfiles/vscode/extensions.txt
```

Then review and commit the changes.
