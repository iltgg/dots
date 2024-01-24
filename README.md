# dots

Heavily personalised `Hyprland` based desktop following the onedark color scheme. 

![riced desktop](/rice.png?raw=true)

Wallpaper credit:

"[Colorful Mountains](https://www.deviantart.com/rmradev/art/Colorful-Mountains-888882581)" by [RMRADEV](https://www.deviantart.com/rmradev), used under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/) / further attribution added to artwork

## Current Desktop

- Arch Linux
- Hyprland
- Waybar

## Required Packages/Applications

Dependencies of dependencies not listed

### Desktop

Fonts:
- Hack Nerd Font

Desktop:
- hyprland
- hyprpaper
- wofi
- mako
- grimblast (aur)
- hyprpicker
- wl-clipboard
- swappy

Bar:
- waybar
- pavucontrol
- pulseaudio (pipewire)
- playerctl
- pamixer
- jq
- socat

Equalizer Config (DT-990):
- pipewire

Power Menu and Lock:
- wlogout (aur)
- swaylock

### Default Applications

Edit configs if not using:

- firefox
- thunar
- spotify
- discord
- ~~kitty~~ does not render italics correctly for Hack (known issue, not going to be resolved)
- alacritty

### Utilities

Code/text editing:
- neovim

Terminal file manager:
- ranger

Misc:
- btop
- cava (aur)
- neofetch

## Installation

1. Ensure all dependencies are met
2. Back up current configs
3. Edit `update-local.sh` to update/install only required configs
4. Run `update-local.sh`
5. Restart `Hyprland`

### Extra

Install the `tabliss` browser extension and import `tabliss.json`

Copy `.bashrc`, `.inputrc`, and/or `.vimrc` to your home directory

## Updating

`update-local.sh` does not remove files, only overwrites. Delete directory(ies) for fresh update.

`set-mcahine.sh` changes certain config files to machine specific settings, view script comments for details.
