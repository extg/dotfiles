# Default Apps Setup

## List App Bundle IDs

Find bundle IDs to use in default app assignments:

```sh
# List all apps bundle ids
lsappinfo | grep 'bundleID="' | cut -d'"' -f2 | sort

# OR List/Search all existing UTIs (Uniform Type Identifiers)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump
```

## Set Default Apps

Run the default apps setup script:

```sh
./setup-default-apps.sh
``` 
