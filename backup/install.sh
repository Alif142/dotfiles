#!/usr/bin/env bash
echo "Upgrading system packges"
sudo pacman -Syu
echo "Installing required packges"
sudo pacman -S --needed - < /home/alif/dotfiles/backup/pkglist.txt
echo "Setting up ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
git clone https://github.com/Alif142/nvim.git /home/alif/.config/
