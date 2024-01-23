#!/bin/sh

RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}DANGER: This script doesn't backup any local configs!${NC}"
read -p "confirm [Yy]: " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "[a]ll | [s]imple (excludes hyprland)"
    read -p "update type: " -r
    if [[ $REPLY =~ ^[a]$ ]]; then
        read -p "Switch Hyprland configs to laptop setting? [Yy]: " -r
        LAPTOP=$REPLY
        if [[ $LAPTOP =~ ^[Yy]$ ]]; then
            ./set-machine.sh l
        fi
        # rm -r ~/.config/nvim
        cp ./alacritty.toml ~/.config/
        cp -r ./hypr ~/.config/
        cp -r ./neofetch ~/.config/
        # cp -r ./pipewire ~/.config/
        cp -r ./swaylock ~/.config/
        cp -r ./waybar ~/.config/
        cp -r ./wofi ~/.config/
        cp -r ./cava ~/.config/
        cp -r ./mako ~/.config/
        cp -r ./nvim ~/.config/
        cp -r ./wlogout ~/.config/
        cp -r ./swappy ~/.config/
        cp -r ./ranger ~/.config/
        cp ./.bashrc ~/
        cp ./.inputrc ~/
        cp ./.vimrc ~/
        if [[ $LAPTOP =~ ^[Yy]$ ]]; then
            ./set-machine.sh d
        fi
        echo "update complete"
    elif [[ $REPLY =~ ^[s]$ ]]; then
        # rm -r ~/.config/nvim
        cp ./alacritty.toml ~/.config/
        # cp -r ./hypr ~/.config/
        cp -r ./neofetch ~/.config/
        # cp -r ./pipewire ~/.config/
        cp -r ./swaylock ~/.config/
        cp -r ./waybar ~/.config/
        cp -r ./wofi ~/.config/
        cp -r ./cava ~/.config/
        cp -r ./mako ~/.config/
        cp -r ./nvim ~/.config/
        cp -r ./wlogout ~/.config/
        cp -r ./swappy ~/.config/
        cp -r ./ranger ~/.config/
        cp ./.bashrc ~/
        cp ./.inputrc ~/
        cp ./.vimrc ~/
        echo "update complete | excluding (hyprland)"
    fi
else
    echo "update cancelled"
fi
