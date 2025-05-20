# macOS Defaults Settings

## Dock Customization

### Add a Spacer to Dock

```sh
# Regular spacer
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock

# Small spacer
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}' && killall Dock
```

### Disable Recent Apps in Dock

```sh
defaults write com.apple.dock show-recents -bool FALSE; killall Dock
```

### Show Dock Indicators

```sh
defaults write com.apple.dock show-process-indicators -bool true; killall Dock
```

### Enable Auto-hide Dock

```sh
defaults write com.apple.dock autohide -bool true; killall Dock
```

### Reset Dock to Default Settings

```sh
defaults delete com.apple.dock; killall Dock
```

## Apply All macOS Defaults

Run the custom defaults script:

```sh
bash .macos
```

## Keyboard Shortcuts

### Change Input Source and Spotlight Shortcuts

To set Command+Space for input source switching and Control+Space for Spotlight:

1. Go to System Preferences/Settings → Keyboard → Keyboard Shortcuts (or Shortcuts)
2. Select "Keyboard" in the left sidebar
3. Change "Select the previous input source" shortcut to something else (or disable it)
4. Find "Input Sources" in the left sidebar
5. Set "Select next source in Input menu" to Command+Space (⌘ Space)
6. Find "Spotlight" in the left sidebar
7. Change "Show Spotlight search" to Control+Space (^ Space)
8. Log out and log back in for changes to take effect

Alternatively, use the following Terminal commands:

```sh
# Set Command+Space for input source switching
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 "{enabled = 1; value = {parameters = (32, 49, 1048576); type = standard; }; }"

# Set Control+Space for Spotlight
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{enabled = 1; value = {parameters = (32, 49, 262144); type = standard; }; }"

# Restart cfprefsd and Spotlight to apply changes
killall cfprefsd
killall Spotlight
``` 
