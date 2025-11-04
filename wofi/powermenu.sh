#!/usr/bin/env bash

# --- Colors ---
BG="#141415"
FG="#cdcdcd"
HIGHLIGHT="#F2EAD3"

# --- Menu entries ---
options=(
  "  Lock"
  "󰗼  Logout"
  "󰜉  Reboot"
  "  Poweroff"
  "󰤄  Suspend"
)

# --- Get monitor info from Niri ---
# Niri exposes outputs via `niri msg outputs --json`
monitor_info=$(niri msg outputs --json | jq -r '.[] | select(.focused == true)')
mon_x=$(echo "$monitor_info" | jq -r '.x')
mon_y=$(echo "$monitor_info" | jq -r '.y')
mon_width=$(echo "$monitor_info" | jq -r '.width')
mon_height=$(echo "$monitor_info" | jq -r '.height')

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

# --- Show menu ---
chosen=$(printf '%s\n' "${options[@]}" | \
wofi --dmenu \
     --prompt "Power Menu" \
     --width $menu_width \
     --height $menu_height \
     --x $center_x \
     --y $center_y \
     --hide-scroll \
     --insensitive \
     --style ~/.config/wofi/style.css)

# --- Action handling ---
case "$chosen" in
    "  Lock")
        # Try swaylock first; hyprlock is Hyprland-specific
        if command -v swaylock >/dev/null 2>&1; then
            swaylock
        else
            notify-send "No lock utility found! Install swaylock or other Wayland lock utility."
        fi
        ;;
    "󰗼  Logout")
        # Niri doesn’t have a direct 'exit' command, but we can kill the compositor
        pkill niri
        ;;
    "󰜉  Reboot") systemctl reboot ;;
    "  Poweroff") systemctl poweroff ;;
    "󰤄  Suspend") systemctl suspend ;;
esac

