#!/usr/bin/env bash
echo "Copying dotfiles"
#i3
cp /$HOME/.zshrc /home/alif/dotfiles/
cp /$HOME/.zsh_history /home/alif/dotfiles/
cp -r /$HOME/.config/tmux/ /home/alif/dotfiles/
echo "Backup done..."

