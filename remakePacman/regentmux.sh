#!/usr/bin/env bash
sudo pacman -S tmux
sudo pacman -S  install fzf
sudo cp /home/alif/dotfiles/.tmux.conf /home/alif
tmux source .tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp /home/alif/dotfiles/tmux-sessionizer.sh /home/alif/.tmux/
