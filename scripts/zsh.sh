
#!/usr/bin/env bash
set -e

# Install dependencies
sudo apt update
sudo apt install -y zsh git curl

echo "Setting up Oh My Zsh..."

# Install Oh My Zsh (non-interactive)
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Ensure ZSH_CUSTOM exists
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete \
  $ZSH_CUSTOM/plugins/zsh-autocomplete

# Clone Neovim config properly
git clone https://github.com/Alif142/nvim.git \
  $HOME/.config/nvim

# Set zsh as default shell
chsh -s "$(which zsh)"

echo "Done! Log out and log back in."
