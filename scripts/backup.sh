#!/usr/bin/env bash
echo "Copying dotfiles"
#i3
cp /home/alif/.zshrc /home/alif/dotfiles/
cp /home/alif/.zsh_history /home/alif/dotfiles/
cp -r /home/alif/.config/alacritty/ /home/alif/dotfiles/
cp -r /home/alif/.config/i3 /home/alif/dotfiles/
cp -r /home/alif/.config/i3status /home/alif/dotfiles/
cp -r /home/alif/.config/picom/ /home/alif/dotfiles/
cp -r /home/alif/.config/tmux/ /home/alif/dotfiles/
#HYPRLAND
cp -r /home/alif/.config/fastfetch/ /home/alif/dotfiles/
cp -r /home/alif/.config/fuzzel/ /home/alif/dotfiles/
cp -r /home/alif/.config/mozilla/firefox/ /home/alif/dotfiles/
cp -r /home/alif/.config/hypr/ /home/alif/dotfiles/
cp -r /home/alif/.config/waybar/ /home/alif/dotfiles/
cp -r /home/alif/.config/wofi/ /home/alif/dotfiles/
cp -r /home/alif/.themes/Rosepine-B-MB-Dark/ /home/alif/dotfiles/

echo "Backup done..."
