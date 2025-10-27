#!/usr/bin/env bash

WALLPAPERS="$HOME/dotfiles/wallpaper"
SELECTED=$(find "$WALLPAPERS" -type f | wofi --dmenu --prompt "Select Wallpaper:")

if [ -n "$SELECTED" ]; then
    swww img "$SELECTED" --transition-type any
    wal -i "$SELECTED"

    # Update Waybar colors
    pkill waybar
    waybar & disown

    # Update Alacritty colors
    ln -sf ~/.cache/wal/colors-alacritty.toml ~/.config/alacritty/colors.toml

    # Reload Hyprland colors if using a custom colors.conf
    if [ -f ~/.config/hypr/colors.conf ]; then
        cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors.conf
        hyprctl reload
    fi
fi

