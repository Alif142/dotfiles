#!/bin/bash

echo -en "󰐥 Shutdown\n󰜉 Reboot\n󰌾 Logout\n󰍂 Lock\n󰒲 Suspend\n" | rofi -dmenu -p "Power:" | {
    read choice
    case $choice in
        "󰐥 Shutdown") shutdown now ;;
        "󰜉 Reboot")  reboot ;;
        "󰌾 Logout") i3-msg exit ;;
        "󰍂 Lock") i3lock ;;
        "󰒲 Suspend") systemctl suspend ;;
    esac
}
