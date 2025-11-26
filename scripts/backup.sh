#!/usr/bin/env bash
echo "Copying dotfiles"
#i3
cp /$HOME/.zshrc /home/alif/dotfiles/
cp /$HOME/.zsh_history /home/alif/dotfiles/
cp -r /$HOME/.config/alacritty/ /home/alif/dotfiles/
cp -r /$HOME/.config/i3 /home/alif/dotfiles/
cp -r /$HOME/.config/i3status /home/alif/dotfiles/
cp -r /$HOME/.config/picom/ /home/alif/dotfiles/
cp -r /$HOME/.config/tmux/ /home/alif/dotfiles/
cp -r /$HOME/.config/wezterm/ /home/alif/dotfiles/
#HYPRLAND
cp -r /$HOME/.config/fastfetch/ /home/alif/dotfiles/
cp -r /$HOME/.config/fuzzel/ /home/alif/dotfiles/
cp -r /$HOME/.config/mozilla/firefox/ /home/alif/dotfiles/
cp -r /$HOME/.config/hypr/ /home/alif/dotfiles/
cp -r /$HOME/.config/waybar/ /home/alif/dotfiles/
cp -r /$HOME/.config/wofi/ /home/alif/dotfiles/
cp -r /$HOME/.themes/Rosepine-B-MB-Dark/ /home/alif/dotfiles/

echo "Backup done..."
