#!/bin/bash

size=$(hyprctl -j getoption misc:cursor_zoom_factor | jq --raw-output '.float')
size=${size%.*}

if [[ $size -gt 1 ]]; then
    if [[ $size -lt 6 ]]; then size=$((size + 1)); else size=2; fi
    hyprctl keyword misc:cursor_zoom_factor $size
fi
