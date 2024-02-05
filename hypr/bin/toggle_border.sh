#!/bin/bash

size=$(hyprctl -j getoption general:border_size | jq --raw-output '.int')

if [[ $size -gt 0 ]]; then
    hyprctl keyword general:border_size 0
    hyprctl keyword decoration:drop_shadow 0
else
    hyprctl keyword general:border_size 2
    hyprctl keyword decoration:drop_shadow 1
fi
