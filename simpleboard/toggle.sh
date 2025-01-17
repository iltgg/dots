#!/usr/bin/env bash

PROCESS=$1
BIN=$2

if pgrep -x "$PROCESS" > /dev/null; then
    pkill -f "$PROCESS"
else
    /bin/$BIN & disown
fi
