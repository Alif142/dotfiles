#!/bin/sh
# Power menu with dmenu + Tokyo Night theme + confirmation

DMENU="dmenu -b -i -fn 'JetBrainsMono Nerd Font-14' \
       -nb '#000000' -nf '#FFFFFF' -sb '#444444' -sf '#FFFFFF'"

choice=$(printf " Lock\n󰗽 Logout\n󰜉 Reboot\n Shutdown" | eval "$DMENU -l 4")

confirm() {
    echo -e "No\nYes" | eval "$DMENU -l 2 -p 'Confirm $1?'"
}

case "$choice" in
    " Lock")
        [ "$(confirm Lock)" = "Yes" ] && slock ;; # or betterlockscreen -l
    "󰗽 Logout")
        [ "$(confirm Logout)" = "Yes" ] && pkill -KILL -u "$USER" ;;
    "󰜉 Reboot")
        [ "$(confirm Reboot)" = "Yes" ] && systemctl reboot ;;
    " Shutdown")
        [ "$(confirm Shutdown)" = "Yes" ] && systemctl poweroff ;;
esac

