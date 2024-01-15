#!/bin/bash

PROCESS="nm-applet"

if pgrep -f "$PROCESS" > /dev/null; then
    pkill -f "$PROCESS"
else
    /bin/$PROCESS &
fi
