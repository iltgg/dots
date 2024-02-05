#!/bin/sh

# SPECIAL='activespecial>>special:(.*?),'
SPECIAL='activespecial>>(.*?),'
WINDOW='activewindow>>'

handle() {
    if [[ $1 =~ $WINDOW ]] || [[ $1 =~ $SPECIAL ]] then
        OUT=$(hyprctl monitors -j | jq --raw-output 'map(select(.specialWorkspace.name!="")) | map(.specialWorkspace.name) | map(split(":")[1]) | join(" ")')
        echo $OUT
    fi
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
