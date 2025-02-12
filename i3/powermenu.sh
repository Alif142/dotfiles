#!/bin/bash
# Simple power menu options
options="Lock\nLogout\nShutdown\nReboot\nSuspend\nHibernate"

selected=$(echo -e $options | dmenu -i -p "Power Menu:")

case $selected in
Lock) i3lock -i /home/alif/wallpaper/malenia-blade-of-3840x2160-10267.png ;;
Logout) i3-msg exit ;;
Shutdown) systemctl poweroff ;;
Reboot) systemctl reboot ;;
Suspend) systemctl suspend ;;
Hibernate) systemctl hibernate ;;
esac
