#!/bin/bash

entries="⇠ Logout\n⭮ Reboot\n⏻ Shutdown\n🔒 Lock"

selected=$(echo -e $entries | wofi --width 500 --height 400 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
    logout)
        exec loginctl terminate-user $USER;;
    reboot)
        exec systemctl reboot;;
    shutdown)
        exec systemctl poweroff -i;;
    lock)
        exec hyprlock;;
esac
