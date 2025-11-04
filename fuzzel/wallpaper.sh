#!/usr/bin/env bash

# --- Wallpaper Directory ---
WALLPAPER_DIR="$HOME/dotfiles/wallpaper"

# --- Ensure swww daemon is running ---
if ! pgrep -x "swww-daemon" >/dev/null; then
    swww-daemon &
    sleep 1
fi

# --- Build wallpaper list safely ---
mapfile -t wallpapers < <(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | sort)

# --- Exit if no wallpapers found ---
[ "${#wallpapers[@]}" -eq 0 ] && exit

# --- Show Fuzzel menu ---
selected=$(printf '%s\n' "${wallpapers[@]##*/}" | \
    fuzzel --dmenu --prompt "󰉏  Select Wallpaper:" --lines 10)

# --- Exit if nothing chosen ---
[ -z "$selected" ] && exit

# --- Find full path robustly ---
chosen_file=""
for file in "${wallpapers[@]}"; do
    if [ "$(basename "$file")" = "$selected" ]; then
        chosen_file="$file"
        break
    fi
done

# --- Apply wallpaper if valid ---
[ -n "$chosen_file" ] && swww img "$chosen_file" --transition-type any --transition-step 40 --transition-fps 60

