#!/bin/bash

# Power options
options=" Lock\n Suspend\n Reboot\n Power Off\n Logout"

# Rofi command
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme "~/.config/rofi/config.rasi")

case "$chosen" in
    " Lock")
        if command -v i3lock >/dev/null 2>&1; then
            i3lock
        elif command -v betterlockscreen >/dev/null 2>&1; then
            betterlockscreen -l
        else
            echo "No lock command found."
        fi
        ;;
    " Suspend")
        systemctl suspend
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Power Off")
        systemctl poweroff
        ;;
    " Logout")
        pkill -KILL -u "$USER"
        ;;
    *)
        exit 0
        ;;
esac

