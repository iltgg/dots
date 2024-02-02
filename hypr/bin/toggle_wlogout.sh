#!/bin/bash

PROCESS="wlogout"

if pgrep -x "$PROCESS" > /dev/null; then
    pkill -f "$PROCESS"
else
    /bin/$PROCESS &
fi
