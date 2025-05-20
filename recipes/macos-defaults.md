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
