#!/bin/bash

PROCESS_NAME="spotify"

for ((i=1; i<=5; i++)); do
    if pgrep -x "$PROCESS_NAME" > /dev/null; then
        hyprctl dispatch closewindow ^Spotify$
        sleep 1
    else
        sleep 1
    fi
done
