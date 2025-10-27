#!/usr/bin/env bash

# --- Colors ---
BG="#141415"
FG="#cdcdcd"
HIGHLIGHT="#e8b589"

# --- Menu entries ---
options=(
  "  Lock"
  "󰗼  Logout"
  "󰜉  Reboot"
  "  Poweroff"
  "󰤄  Suspend"
)

# --- Get monitor info from Hyprland ---
monitor_info=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true)')
mon_x=$(echo "$monitor_info" | jq -r '.x')
mon_y=$(echo "$monitor_info" | jq -r '.y')
mon_width=$(echo "$monitor_info" | jq -r '.width')
mon_height=$(echo "$monitor_info" | jq -r '.height')

# --- Menu dimensions ---
menu_width=260
menu_height=240

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
        if command -v hyprlock >/dev/null 2>&1; then
            hyprlock
        elif command -v swaylock >/dev/null 2>&1; then
            swaylock
        else
            notify-send "No lock utility found!"
        fi
        ;;
    "󰗼  Logout") hyprctl dispatch exit ;;
    "󰜉  Reboot") systemctl reboot ;;
    "  Poweroff") systemctl poweroff ;;
    "󰤄  Suspend") systemctl suspend ;;
esac
#!/usr/bin/env bash

# --- Colors ---
BG="#141415"
FG="#cdcdcd"
HIGHLIGHT="#e8b589"

# --- Menu entries ---
options=(
  "  Lock"
  "󰗼  Logout"
  "󰜉  Reboot"
  "  Poweroff"
  "󰤄  Suspend"
)

# --- Get monitor info from Hyprland ---
monitor_info=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true)')
mon_x=$(echo "$monitor_info" | jq -r '.x')
mon_y=$(echo "$monitor_info" | jq -r '.y')
mon_width=$(echo "$monitor_info" | jq -r '.width')
mon_height=$(echo "$monitor_info" | jq -r '.height')

# --- Menu dimensions ---
menu_width=260
menu_height=240

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
        if command -v hyprlock >/dev/null 2>&1; then
            hyprlock
        elif command -v swaylock >/dev/null 2>&1; then
            swaylock
        else
            notify-send "No lock utility found!"
        fi
        ;;
    "󰗼  Logout") hyprctl dispatch exit ;;
    "󰜉  Reboot") systemctl reboot ;;
    "  Poweroff") systemctl poweroff ;;
    "󰤄  Suspend") systemctl suspend ;;
esac

