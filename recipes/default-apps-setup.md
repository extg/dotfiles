# Default Apps Setup

## Export/Import Default App Settings

You can export your current default application settings to a file and then import them on a new system:

```sh
# Export default app settings to a file (default: default-apps.txt)
./get-default-apps.sh [output_file]

# Apply exported settings on a new system
./apply-default-apps.sh [input_file]
```

This works similar to Brewfile for Homebrew, allowing you to transfer your default application settings between systems. 


## List App Bundle IDs

Find bundle IDs to use in default app assignments:

```sh
# List all apps bundle ids
lsappinfo | grep 'bundleID="' | cut -d'"' -f2 | sort

# OR List/Search all existing UTIs (Uniform Type Identifiers)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump
```
