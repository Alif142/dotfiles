#!/bin/sh

# refresh every second
while true; do
  # CPU Usage (top 1-second average)
  CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5); printf "%.0f%%", usage}')
  
  # Disk Usage (root partition)
  DISK=$(df -h / | awk 'NR==2 {print $5}')
  
  # Date & Time
  DATE=$(date "+%a %d %b")
  TIME=$(date "+%I:%M:%S")

  # Set the bar text with Nerd Font icons (MesloLGM NF)
  xsetroot -name " 󰍛 $CPU | 󰋊 $DISK | 󰃭 $DATE | 󰥔 $TIME"

  sleep 1
done

