#!/usr/bin/env bash

rm -r ./nvim

# cp ~/.config/alacritty.toml ./
cp -r ~/.config/kitty ./
cp -r ~/.config/hypr ./
cp -r ~/.config/neofetch ./
# cp -r ~/.config/pipewire ./
cp -r ~/.config/swaylock ./
cp -r ~/.config/waybar ./
cp -r ~/.config/fuzzel ./
cp -r ~/.config/cava ./
cp -r ~/.config/mako ./
cp -r ~/.config/nvim ./
cp -r ~/.config/simpleboard ./
cp -r ~/.config/swappy ./
cp -r ~/.config/ranger ./
cp -r ~/.config/fish ./

# cp ~/.bashrc ./
# cp ~/.inputrc ./
cp ~/.vimrc ./

./set-machine.sh d
