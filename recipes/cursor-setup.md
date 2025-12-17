# Cursor Configuration & Troubleshooting

This guide covers Cursor app configuration management and common troubleshooting steps.

## Settings Synchronization

To keep your Cursor settings synchronized across machines using your dotfiles repository:

### 1. Remove existing settings file
```bash
rm ~/Library/Application\ Support/Cursor/User/settings.json
rm ~/Library/Application\ Support/Cursor/User/keybindings.json
```

### 2. Create symbolic link to repository
```bash
ln -s ~/Workspaces/dotfiles/.cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
ln -s ~/Workspaces/dotfiles/.cursor/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json
```

This approach allows you to:
- Store settings in your dotfiles repository for version control
- Sync settings across multiple machines
- Keep Cursor thinking the settings are in the standard location
- Make changes through Cursor's UI that automatically update your repository

**Note**: Make sure to commit and push changes to your `.cursor/settings.json` file to keep settings synchronized across machines.

## Extensions Management

### Installing Extensions

To install all extensions from `.cursor/extensions.txt`:

```bash
cd ~/Workspaces/dotfiles
./install-cursor-extensions.sh
```

This will:
- Install all extensions listed in `.cursor/extensions.txt`
- Skip extensions that are already installed
- Show progress and summary

### Syncing Extensions

To synchronize installed extensions with `.cursor/extensions.txt` (install missing, remove extra):

```bash
cd ~/Workspaces/dotfiles
./install-cursor-extensions.sh --sync
```

**Note**: Sync mode will remove extensions that are not in `extensions.txt` (except built-in VS Code extensions).

### Prerequisites

Make sure the `cursor` command is available in your PATH. If not:
1. Open Cursor
2. Press `Cmd+Shift+P` to open command palette
3. Run: `Shell Command: Install 'cursor' command in PATH`

### Updating Extensions List

To update `.cursor/extensions.txt` with currently installed extensions:

```bash
cursor --list-extensions > ~/Workspaces/dotfiles/.cursor/extensions.txt
```

Then review and commit the changes.
