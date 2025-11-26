cd
git clone https://github.com/neovim/neovim.git $HOME
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
