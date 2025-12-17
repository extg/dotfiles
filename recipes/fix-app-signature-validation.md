# Fix macOS App Signature Validation Error

This guide explains how to fix signature validation errors on macOS applications.

## Problem

Error `SecCodeCheckValidity: Error Domain=NSOSStatusErrorDomain Code=-67062` indicates macOS couldn't verify the app's digital signature. This usually happens after:
- App updates
- System updates
- Incorrect installation

## Solution

Re-sign the application with an ad-hoc signature using the following command:

```bash
codesign --force --deep --sign - /Applications/YourApp.app
```

Replace `YourApp.app` with the name of the application you need to fix.

### Command Breakdown

- `codesign` - macOS utility for app signing and verification
- `--force` - overwrites existing signature
- `--deep` - recursively signs all nested resources and libraries
- `--sign -` - applies temporary (ad-hoc) signature
- `/Applications/YourApp.app` - target application path

### Why It Works

The command creates a new valid (but unofficial) signature that resolves the validation error. This allows the app to run normally, though it won't have the original developer's signature.

### Example

To fix Cursor app signature validation:

```bash
codesign --force --deep --sign - /Applications/Cursor.app
```

