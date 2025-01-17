#!/usr/bin/env bash

# SPECIAL='activespecial>>special:(.*?),'
SPECIAL='activespecial>>(.*?),'
WINDOW='activewindow>>'

handle() {
    if [[ $1 =~ $WINDOW ]] || [[ $1 =~ $SPECIAL ]]; then
        OUT=$(hyprctl monitors -j | jq --raw-output --unbuffered --compact-output  --arg display "$WAYBAR_OUTPUT_NAME" '
          map(select(.name==$display))            # get monitor matching waybar display
        | map(select(.specialWorkspace.name!="")) # get special workspace with name
        | map(.specialWorkspace.name)             # get workspace name
        | map(split(":")[1])                      # extract name
        | join(" ")                               # extract string from array
        | if . == "" then "none" else . end       # if no special, send none string
        | {"text": ., "alt": .}')
        echo "$OUT"
    fi
}

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handle "$line"; done
