#!/bin/bash

killall -q polybar

polybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar Launched..."
