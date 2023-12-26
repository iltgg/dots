#!/bin/bash

PROCESS="pavucontrol"

if pgrep -x "$PROCESS" > /dev/null; then
	pkill -f "$PROCESS"
else
	/bin/$PROCESS &
fi
