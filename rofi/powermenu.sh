#!/bin/bash

# Options
options=" Power Off\n Reboot\n Suspend\n Lock\n Logout"

# Rofi command
chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/powermenu.rasi)"

case "$chosen" in
    " Power Off") systemctl poweroff ;;
    " Reboot") systemctl reboot ;;
    " Suspend") systemctl suspend ;;
    " Lock") i3lock || betterlockscreen -l || slock ;;
    " Logout") pkill -KILL -u "$USER" ;;
esac

