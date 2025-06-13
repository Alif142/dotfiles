#!/usr/bin/env bash

set -e

# Update system and install all packages without confirmation
sudo dnf update -y && sudo dnf install -y \
  ntfs-3g neovim npm os-prober python3-pywal qbittorrent rofi slurp \
  swww tmux vlc waybar yazi firefox fzf git gh grim gtk-murrine-engine \
  hyprlock hyprpaper @development-tools copyq gtk2-engines fastfetch \
  nemo-fileroller nwg-look pavucontrol flatpak

# Install flatpak app without prompt
flatpak install -y flathub app.zen_browser.zen

