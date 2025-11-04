#!/usr/bin/env bash

# --- Colors (optional) ---
BG="#141415"
FG="#cdcdcd"
HIGHLIGHT="#e8b589"

# --- Wallpaper Directory ---
WALLPAPERS="$HOME/dotfiles/wallpaper"

# --- Get monitor info from Niri ---
# Niri exposes outputs via 'niri msg outputs'
monitor_info=$(niri msg outputs | grep -A5 "focused: true")
mon_x=$(echo "$monitor_info" | grep "x:" | awk '{print $2}')
mon_y=$(echo "$monitor_info" | grep "y:" | awk '{print $2}')
mon_width=$(echo "$monitor_info" | grep "width:" | awk '{print $2}')
mon_height=$(echo "$monitor_info" | grep "height:" | awk '{print $2}')

# Fallback if monitor info fails
if [ -z "$mon_width" ] || [ -z "$mon_height" ]; then
    mon_x=0
    mon_y=0
    mon_width=1920
    mon_height=1080
fi

# --- Menu dimensions ---
menu_width=600
menu_height=350

# --- Calculate center position ---
center_x=$((mon_x + (mon_width / 2) - (menu_width / 2)))
center_y=$((mon_y + (mon_height / 2) - (menu_height / 2)))

# --- Select wallpaper using Wofi ---
SELECTED=$(find "$WALLPAPERS" -type f | sort | \
wofi --dmenu \
     --prompt "Select Wallpaper" \
     --width $menu_width \
     --height $menu_height \
     --x $center_x \
     --y $center_y \
     --hide-scroll \
     --insensitive \
     --style ~/.config/wofi/style.css)

# --- Apply wallpaper if selected ---
if [ -n "$SELECTED" ]; then
    # Use swww (works fine with Niri) to set wallpaper
    swww img "$SELECTED" --transition-type any
    # Optionally generate color scheme using wal
    wal -i "$SELECTED" --backend colorz
    # Optional: update Waybar or other scripts
    # ~/.config/waybar/scripts/update-colors.sh
fi

