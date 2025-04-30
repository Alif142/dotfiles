#!/bin/bash

# Restore wallpaper (no need for pgrep)
nitrogen --restore &

# Set refresh rate (only needs to run once)
xrandr --rate 144 &

# Start Picom if not running
if ! pgrep -x "picom"; then
    picom &
fi

# Launch apps only if not running

if ! pgrep -x "brave-browser"; then
    brave-browser &
fi

if ! pgrep -x "nemo"; then
    nemo &
fi

if ! pgrep -x "wezterm"; then
    wezterm &
fi

if ! pgrep -x "qbittorrent"; then
    qbittorrent &
fi

# Start Polybar (with a delay to avoid race conditions)
(sleep 1 && ~/.config/polybar/launch.sh) &
