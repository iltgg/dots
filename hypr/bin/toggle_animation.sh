#!/bin/bash

on=$(hyprctl -j getoption animations:enabled | jq --raw-output '.int')

if [[ $on -eq 1 ]]; then
    hyprctl keyword animations:enabled 0
    hyprctl notify -1 1000 "rgb(e06c75)" "Animations off"
else
    hyprctl keyword animations:enabled 1
    hyprctl notify -1 1000 "rgb(98c379)" "Animations on"
fi
