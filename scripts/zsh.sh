
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

# Set zsh as default shell
chsh -s "$(which zsh)"

echo "Done! Log out and log back in."
