#!/usr/bin/env bash
cp /home/alif/.zshrc /home/alif/dotfiles/
cp /home/alif/.zsh_history /home/alif/dotfiles/
cp -r /home/alif/.config/alacritty/ /home/alif/dotfiles/
cp -r /home/alif/.config/fastfetch/ /home/alif/dotfiles/
cp -r /home/alif/.config/fuzzel/ /home/alif/dotfiles/
cp -r /home/alif/.config/mozilla/firefox/ /home/alif/dotfiles/
cp -r /home/alif/.config/tmux/ /home/alif/dotfiles/
cp -r /home/alif/.config/hypr/ /home/alif/dotfiles/
cp -r /home/alif/.config/waybar/ /home/alif/dotfiles/
cp -r /home/alif/.config/wofi/ /home/alif/dotfiles/
cp -r /home/alif/.themes/Cloudy-Grey-Dark/ /home/alif/dotfiles/
pacman -Qqe > /home/alif/dotfiles/backup/pkglist.txt
