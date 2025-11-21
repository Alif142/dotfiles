#!/bin/bash

# Directories
WALLPAPER_DIR="$HOME/dotfiles/wallpaper"
CACHE_FILE="$HOME/.cache/current_wallpaper.txt"

# Ensure cache directory exists
mkdir -p "$(dirname "$CACHE_FILE")"

# Choose wallpaper via dmenu with your theme
WALL=$(ls "$WALLPAPER_DIR" | dmenu -i -b -l 15 \
    -fn "JetBrainsMono Nerd Font-14" \
    -nb "#000000" -nf "#FFFFFF" \
    -sb "#444444" -sf "#FFFFFF")

# If user selects a wallpaper
if [ -n "$WALL" ]; then
    WALL_PATH="$WALLPAPER_DIR/$WALL"
    feh --bg-scale "$WALL_PATH"   # Set wallpaper
    echo "$WALL_PATH" > "$CACHE_FILE"  # Save current wallpaper
fi

