#!/bin/bash

DIR="$HOME/Pictures/screenshots"
mkdir -p "$DIR"
FILE="$DIR/screenshot_$(date +%Y%m%d_%I%M%S).png"

if [ "$1" == "region" ]; then
    grim -g "$(slurp)" "$FILE"
else
    grim "$FILE"
fi

# Copy to clipboard
grim "$FILE" - | wl-copy

notify-send "Screenshot saved" "$FILE"

