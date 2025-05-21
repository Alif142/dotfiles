#!/usr/bin/env bash
sudo dnf install tmux
sudo dnf install fzf
sudo cp /home/alif/dotfiles/.tmux.conf /home/alif
tmux source .tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp /home/alif/dotfiles/tmux_workspace.sh /home/alif/.tmux/
