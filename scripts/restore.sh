#!/usr/bin/env bash
echo "Restoring dotfiles"
cp /home/alif/dotfiles/.zshrc /home/alif/
cp /home/alif/dotfiles/.history /home/alif/
cp -r /home/alif/dotfiles/alacritty /home/alif/.config/
cp -r /home/alif/dotfiles/fuzzel/ /home/alif/.config/
cp -r /home/alif/dotfiles/hypr/ /home/alif/.config/
cp -r /home/alif/dotfiles/hypr/ /home/alif/.config/
cp -r /home/alif/dotfiles/fastfetch/ /home/alif/.config/
cp -r /home/alif/dotfiles/firefox/ /home/alif/.config/mozilla/
cp -r /home/alif/dotfiles/tmux/ /home/alif/.config/
cp -r /home/alif/dotfiles/waybar/ /home/alif/.config/
cp -r /home/alif/dotfiles/wofi/ /home/alif/.config/
cp -r /home/alif/dotfiles/starship.toml/ /home/alif/.config/

mkdir -p /home/alif/.themes
cp -r /home/alif/dotfiles/Cloudy-Grey-Dark/ /home/alif/.themes

echo "Restore done..."

