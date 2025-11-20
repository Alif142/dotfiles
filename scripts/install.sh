#!/usr/bin/env bash
echo "Upgrading system packges"
sudo apt update && sudo apt upgrade
echo "Installing required packges"
sudo apt install alacritty fzf zsh tmux ripgrep feh lxappearance curl xclip npm cmake unzip flameshot pavucontrol
