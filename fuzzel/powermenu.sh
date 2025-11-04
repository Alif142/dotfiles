#!/usr/bin/env bash

# --- Options ---
options=(
  "  Lock"
  "󰗼  Logout"
  "󰜉  Reboot"
  "  Poweroff"
  "󰤄  Suspend"
  "󰈆  Cancel"
)

# --- Show Fuzzel Menu ---
choice=$(printf '%s\n' "${options[@]}" | fuzzel --dmenu --prompt "󰐥  Power Menu:" --lines 6)

case "$choice" in
    "  Lock")
        if command -v swaylock &>/dev/null; then
            swaylock
        else
            notify-send "No lock utility found!"
        fi
        ;;
    "󰗼  Logout")
        hyprctl dispatch exit 
        ;;
    "󰜉  Reboot")
        systemctl reboot
        ;;
    "  Poweroff")
        systemctl poweroff
        ;;
    "󰤄  Suspend")
        systemctl suspend
        ;;
    "󰈆  Cancel"|"") exit 0 ;;
esac

