#!/usr/bin/env bash
echo "Upgrading system packges"
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update && sudo apt upgrade
echo "Installing required packges"
sudo apt install alacritty fzf zsh tmux ripgrep feh lxappearance curl xclip npm cmake unzip flameshot pavucontrol wezterm
