#!/bin/bash

PROCESS="simpleboard"

if pgrep -x "$PROCESS" > /dev/null; then
    pkill -f "$PROCESS"
else
    kitty -e simpleboard &
fi
