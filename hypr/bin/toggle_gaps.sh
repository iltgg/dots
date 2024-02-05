#!/bin/bash

size=$(hyprctl -j getoption general:gaps_in | jq --raw-output '.int')

if [[ $size -gt 0 ]]; then
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
else
    hyprctl keyword general:gaps_in 3
    hyprctl keyword general:gaps_out 5
fi
