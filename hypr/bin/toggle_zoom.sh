#!/bin/bash

size=$(hyprctl -j getoption misc:cursor_zoom_factor | jq --raw-output '.float')
size=${size%.*}

if [[ $size -gt 1 ]]; then
    hyprctl keyword misc:cursor_zoom_factor 1
else
    hyprctl keyword misc:cursor_zoom_factor 2
fi
