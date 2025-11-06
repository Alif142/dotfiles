echo "Backing up nvim github"
cd /home/alif/.config/nvim/
git add .
git commit -m "nvim backup"
git push origin test
cd
echo "Backing up dotfiles to github"
cd /home/alif/dotfiles/
git add .
git commit -m "dotfiles backup"
git push origin main
cd
