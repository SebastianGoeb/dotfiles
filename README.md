# Dotfiles

## Installation

Clone repository

```shell
git clone https://github.com/sebastianGoeb/dotfiles ~/somewhere/dotfiles
```

## Usage

Install dotfiles, applications, etc.

```shell
./install
```

Install miscellaneous things that don't work with Ansible

- Install Bitwarden from App Store because only that version supports biometric authentication
- Download and install Fira Code Nerd Font Retina: https://www.nerdfonts.com/font-downloads

### Manually Adjust Settings

- Keyboard
  - Key repeat rate: `Fast`
  - Delay until repeat: `Short`
  - Input Sources: `ABC Extended`
  - Keyboard Shortcuts
    - Function Keys -> Use F1, F2, etc. keys as standard function keys: `true`
    - Services -> Text -> Search man Page Index in Terminal: `false`
- Trackpad
  - Point & Click -> Tap to click: `true`
  - More Gestures -> App Exposé: `Swipe Down with Three Fingers`

### To-Do

- replace zinit with antibody + zsh-defer?
- use better gcm alias: https://stackoverflow.com/a/70080259/916223
