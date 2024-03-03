#!/bin/bash

# automatically spawn and position window for screenshot

IFS=';' read -rs -d t -p $'\e[16t' -a CELL_SIZE

CELLW=${CELL_SIZE[2]}
CELLH=${CELL_SIZE[1]}
WIDTH=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .width')
HEIGHT=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height')
TPAD=45
LRPAD=5
BPAD=5

MAIN=$(hyprctl -j activewindow | jq -r ".address")

sed -i 's/.*shown_boxes.*/shown_boxes = "cpu gpu0"/' ~/.config/btop/btop.conf
kitty -e btop & > /dev/null
sleep 1
BTOP=$(hyprctl -j activewindow | jq --raw-output ".address")
BTOP_PID=$(hyprctl -j activewindow | jq --raw-output ".pid")

kitty -e nvim ./rice.sh & > /dev/null
sleep 1
NVIM=$(hyprctl -j activewindow | jq --raw-output ".address")
NVIM_PID=$(hyprctl -j activewindow | jq --raw-output ".pid")

kitty -e cava & > /dev/null
sleep 1
CAVA=$(hyprctl -j activewindow | jq --raw-output ".address")
CAVA_PID=$(hyprctl -j activewindow | jq --raw-output ".pid")

hyprctl dispatch togglefloating address:${MAIN}
hyprctl dispatch togglefloating address:${BTOP}
hyprctl dispatch togglefloating address:${NVIM}
hyprctl dispatch togglefloating address:${CAVA}

hyprctl dispatch resizewindowpixel exact $((CELLW*80)) $((CELLH*20)),address:${BTOP}
hyprctl dispatch resizewindowpixel exact $((CELLW*88)) $((CELLH*20)),address:${NVIM}
hyprctl dispatch resizewindowpixel exact $((CELLW*89)) $((CELLH*23)),address:${CAVA}

hyprctl dispatch movewindowpixel exact $((WIDTH-CELLW*89-WIDTH/40-LRPAD)) $((TPAD)),address:${CAVA}
hyprctl dispatch movewindowpixel exact $((WIDTH-CELLW*80-WIDTH/80-LRPAD)) $((TPAD+CELLH*18)),address:${BTOP}
hyprctl dispatch movewindowpixel exact $((WIDTH-CELLW*80-WIDTH/80-LRPAD)) $((TPAD+(HEIGHT-TPAD)/3)),address:${BTOP}
hyprctl dispatch movewindowpixel exact $((WIDTH-CELLW*88-LRPAD)) $((HEIGHT-CELLH*20-BPAD)),address:${NVIM}

hyprctl dispatch alterzorder top,address:${NVIM}
hyprctl dispatch alterzorder top,address:${BTOP}
hyprctl dispatch alterzorder top,address:${CAVA}

hyprctl dispatch focuswindow address:${MAIN} > /dev/null
hyprctl dispatch resizewindowpixel exact $((CELLW*96+2)) $((CELLH*21+2)),address:${MAIN} > /dev/null
hyprctl dispatch movewindowpixel exact $((LRPAD)) $((TPAD)),address:${MAIN} > /dev/null
clear
neofetch
sleep 2;

hyprctl -j monitors | jq -r '.[] | select(.focused==true) | "\(.x),\(.y) \(.width)x\(.height)"' | grim -g - ./temp.png
magick temp.png -quality 90 rice.jpg
rm temp.png

kill ${BTOP_PID}
kill ${NVIM_PID}
kill ${CAVA_PID}
hyprctl dispatch togglefloating address:${MAIN}

clear;
echo "screenshot saved as rice.jpg"
