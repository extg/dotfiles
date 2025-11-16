# Cursor Configuration & Troubleshooting

This guide covers Cursor app configuration management and common troubleshooting steps.

## Settings Synchronization

To keep your Cursor settings synchronized across machines using your dotfiles repository:

### 1. Remove existing settings file
```bash
rm ~/Library/Application\ Support/Cursor/User/settings.json
```

### 2. Create symbolic link to repository
```bash
ln -s ~/Workspaces/dotfiles/.cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
```

This approach allows you to:
- Store settings in your dotfiles repository for version control
- Sync settings across multiple machines
- Keep Cursor thinking the settings are in the standard location
- Make changes through Cursor's UI that automatically update your repository

**Note**: Make sure to commit and push changes to your `.cursor/settings.json` file to keep settings synchronized across machines.

## Fix Signature Validation Error

This command re-signs the Cursor application with an ad-hoc signature to fix signature validation issues (error `SecCodeCheckValidity`, code `-67062`).

```bash
codesign --force --deep --sign - /Applications/Cursor.app
```

### Command Breakdown

- `codesign` - macOS utility for app signing and verification
- `--force` - overwrites existing signature
- `--deep` - recursively signs all nested resources and libraries
- `--sign -` - applies temporary (ad-hoc) signature
- `/Applications/Cursor.app` - target application

### Why It Works

Error `SecCodeCheckValidity: Error Domain=NSOSStatusErrorDomain Code=-67062` indicates macOS couldn't verify the app's digital signature. This usually happens after:
- App updates
- System updates
- Incorrect installation

The command creates a new valid (but unofficial) signature that resolves the error.
