#!/usr/bin/env bash
echo "Backing up nvim github"
cd /$HOME/.config/nvim/
git add .
git commit -m "nvim backup"
git push origin test
cd
echo "Backing up dotfiles to github"
cd /$HOME/dotfiles/
git add .
git commit -m "dotfiles backup"
git push origin main
cd
