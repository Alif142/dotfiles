#!/bin/bash

# ==============================================
# Neovim + App Installer for Linux Mint
# ==============================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Please run as root (sudo).${NC}"
  exit 1
fi

# ==============================================
# TABLE OF APPS TO INSTALL (Edit as needed)
# ==============================================
declare -A APPS=(
  ["neovim_deps"]="git cmake ninja-build gettext libtool libtool-bin autoconf automake g++ pkg-config unzip curl doxygen"
  ["neovim"]="neovim"  # Will be built from source
  ["git"]="git"
  ["nodejs"]="nodejs npm"  # For LSP (e.g., Typescript, ESLint)
  ["python"]="python3 python3-pip python3-venv"
  ["ripgrep"]="ripgrep"  # For telescope.nvim
  ["fd"]="fd-find"  # Faster file finding
  ["lazygit"]="lazygit"  # Git TUI
  ["tmux"]="tmux"  # Terminal multiplexer
  ["zsh"]="zsh"  # Better shell
  ["i3"]="i3wm"
  ["picom"]="picom"
  ["lxappearance"]="lxappearance"
  ["qbittorrent"]="qbittorrent"
  ["fzf"]="fzf"
  ["arandr"]="arandr"
)

# ==============================================
# INSTALLATION FUNCTIONS
# ==============================================

install_deps() {
  echo -e "${YELLOW}Updating packages...${NC}"
  apt update && apt upgrade -y

  echo -e "${YELLOW}Installing dependencies...${NC}"
  apt install -y ${APPS["neovim_deps"]}
}


install_apps() {
  local selected_apps=("$@")

  for app in "${selected_apps[@]}"; do
    if [ -n "${APPS[$app]}" ]; then
      echo -e "${YELLOW}Installing $app...${NC}"
      apt install -y ${APPS[$app]}
    else
      echo -e "${RED}Unknown app: $app${NC}"
    fi
  done
}

# ==============================================
# USER SELECTION MENU
# ==============================================
echo -e "${GREEN}=== Available Apps ==="
for app in "${!APPS[@]}"; do
  echo "- $app"
done
echo -e "=======================${NC}"

read -p "Enter apps to install (space-separated, e.g., git nodejs): " -a user_choices

# ==============================================
# EXECUTE INSTALLATION
# ==============================================
install_deps
install_apps "${user_choices[@]}"

echo -e "${GREEN}Installation complete!${NC}"
