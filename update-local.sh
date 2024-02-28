#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}DANGER: This script doesn't backup any local configs!${NC}"
read -p "confirm [Yy]: " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Update Hyprland? [Yy]: " -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "Switch Hyprland configs to laptop setting? [Yy]: " -r
        LAPTOP=$REPLY
    fi
    if [[ $LAPTOP =~ ^[Yy]$ ]]; then
        ./set-machine.sh l
        cp -r ./hypr ~/.config/
        echo "updated hyprland"
    fi
    # rm -r ~/.config/nvim
    # cp ./alacritty.toml ~/.config/
    cp -r ./kitty ~/.config/
    cp -r ./neofetch ~/.config/
    # cp -r ./pipewire ~/.config/
    cp -r ./swaylock ~/.config/
    cp -r ./waybar ~/.config/
    cp -r ./fuzzel ~/.config
    cp -r ./cava ~/.config/
    cp -r ./mako ~/.config/
    cp -r ./nvim ~/.config/
    cp -r ./simpleboard ~/.config/
    cp -r ./swappy ~/.config/
    cp -r ./ranger ~/.config/
    cp -r ./fish ~/.config/
    # cp ./.bashrc ~/
    # cp ./.inputrc ~/
    cp ./.vimrc ~/
    if [[ $LAPTOP =~ ^[Yy]$ ]]; then
        ./set-machine.sh d
    fi
    echo "update complete"
else
    echo "update cancelled"
fi
