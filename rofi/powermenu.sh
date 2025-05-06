#!/bin/bash

echo -en "󰐥 Shutdown\n󰜉 Reboot\n󰌾 Logout\n󰍂 Lock\n󰒲 Suspend\n" | rofi -dmenu -theme powermenu.rasi -p "Power:" | {
    read choice
    case $choice in
        "󰐥 Shutdown") systemctl poweroff ;;
        "󰜉 Reboot") systemctl reboot ;;
        "󰌾 Logout") hyprctl dispatch exit ;;
        "󰍂 Lock") hyprlock ;;
        "󰒲 Suspend") systemctl suspend ;;
    esac
}
