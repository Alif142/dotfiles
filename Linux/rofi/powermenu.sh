#!/bin/bash

chosen=$(echo -e "  Shutdown\n  Restart\n  Logout\n  Lock" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
"  Shutdown")
  systemctl poweroff
  ;;
"  Restart")
  systemctl reboot
  ;;
"  Logout")
  qtile cmd-obj -o cmd -f shutdown
  ;;
"  Lock")
  qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock
  ;;
*) ;;
esac
