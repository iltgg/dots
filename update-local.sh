#!/bin/sh

RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}DANGER: This script doesn't backup any local configs!${NC}"
read -p "confirm [Yy]: " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
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
    echo "update complete"
else
    echo "update cancelled"
fi
