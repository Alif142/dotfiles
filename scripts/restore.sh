#!/usr/bin/env bash
echo "Restoring dotfiles"
cp /$HOME/dotfiles/.zshrc /home/alif/
cp /$HOME/dotfiles/.zsh_history /home/alif/
cp -r /$HOME/dotfiles/alacritty /home/alif/.config/
cp -r /$HOME/dotfiles/firefox/ /home/alif/.config/mozilla/
cp -r /$HOME/dotfiles/tmux/ /home/alif/.config/
cp -r /$HOME/dotfiles/i3/ /home/alif/.config/
cp -r /$HOME/dotfiles/i3status/ /home/alif/.config/
cp -r /$HOME/dotfiles/picom/ /home/alif/.config/
cp -r /$HOME/dotfiles/wezterm/ /home/alif/.config/
#cp -r /$HOME/dotfiles/fastfetch/ /home/alif/.config/
#cp -r /$HOME/dotfiles/waybar/ /home/alif/.config/
#cp -r /$HOME/dotfiles/fuzzel/ /home/alif/.config/
#cp -r /$HOME/dotfiles/hypr/ /home/alif/.config/
#cp -r /$HOME/dotfiles/hypr/ /home/alif/.config/
#cp -r /$HOME/dotfiles/wofi/ /home/alif/.config/

mkdir -p /$HOME/.themes
cp -r /$HOME/dotfiles/Rosepine-B-MB-Dark /home/alif/.themes

echo "Restore done..."

