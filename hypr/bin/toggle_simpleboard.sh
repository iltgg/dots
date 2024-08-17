#!/bin/bash

PROCESS="simpleboard"

if pgrep -x "$PROCESS" > /dev/null; then
    pkill -f "$PROCESS"
else
    # kitty -e simpleboard &
    hyprctl dispatch exec "[size 100% 100%; float; move 0% 0%; animation slide]" "kitty -o font_size=40 -e simpleboard"
fi
