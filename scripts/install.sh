#!/usr/bin/env bash
echo "Upgrading system packges"
sudo apt install curl
echo "Installing required packges"
sudo apt install alacritty zsh tmux ripgrep feh lxappearance xclip npm cmake unzip flameshot pavucontrol i3 i3status polybar rofi vlc  golang  openjdk-25-jre zathura
curl -fsS https://dl.brave.com/install.sh | sh

sleep 1

(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && sudo mkdir -p -m 755 /etc/apt/sources.list.d \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y

sudo apt update
sudo apt install gh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
zsh
cargo install skim
cargo install typst-cli
cargo install --git https://github.com/MordechaiHadad/bob.git
