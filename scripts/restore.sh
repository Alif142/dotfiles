#!/usr/bin/env bash
echo "Restoring dotfiles"
cp /$HOME/dotfiles/.zshrc /home/alif/
cp /$HOME/dotfiles/.zsh_history /home/alif/
cp -r /$HOME/dotfiles/tmux/ /home/alif/.config/

echo "Restore done..."

