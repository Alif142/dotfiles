#!/usr/bin/env bash
echo "Restoring dotfiles"
cp /home/alif/dotfiles/.zshrc /home/alif/
cp /home/alif/dotfiles/.zsh_history /home/alif/
cp -r /home/alif/dotfiles/alacritty /home/alif/.config/
cp -r /home/alif/dotfiles/firefox/ /home/alif/.config/mozilla/
cp -r /home/alif/dotfiles/tmux/ /home/alif/.config/
cp -r /home/alif/dotfiles/i3/ /home/alif/.config/
cp -r /home/alif/dotfiles/i3status/ /home/alif/.config/
cp -r /home/alif/dotfiles/picom/ /home/alif/.config/
#cp -r /home/alif/dotfiles/fastfetch/ /home/alif/.config/
#cp -r /home/alif/dotfiles/waybar/ /home/alif/.config/
#cp -r /home/alif/dotfiles/fuzzel/ /home/alif/.config/
#cp -r /home/alif/dotfiles/hypr/ /home/alif/.config/
#cp -r /home/alif/dotfiles/hypr/ /home/alif/.config/
#cp -r /home/alif/dotfiles/wofi/ /home/alif/.config/

mkdir -p /home/alif/.themes
cp -r /home/alif/dotfiles/Rosepine-B-MB-Dark /home/alif/.themes

echo "Restore done..."

