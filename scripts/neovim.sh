#!/usr/bin/env bash
cd

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout nightly
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
