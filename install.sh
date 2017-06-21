#!/bin/bash
# asta este un file pentru a instala pachete pe un nou sistem linux

git config --global credential.helper 'cache --timeout=604800'

PACKAGES=" tmux clang llvm neovim fish zsh tree ruby gem stack 
              haskell-platform cmake python-devel python3-develautomake gcc gcc-c++ kernel-devel
              gconf-editor gnome-tweak-tool npm"

# git clone https://github.com/powerline/fonts.git
# cd fonts
# ./install.sh
# cd ..
# rm -rf fonts
#
# wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
# wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
# mv PowerlineSymbols.otf ~/.fonts/
# fc-cache -vf ~/.fonts/
# mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# nmp install fls 

if $0 == "" 
then
    echo " baga in plm numele package managerului si comanda "
    echo " exemplu : apt-get install"
else
    INSTALLER_CMD = $0
fi

# incepe instalarea
sudo $INSTALLER_CMD PACKAGES

sudo pip install --upgrade neovim
sudo pip install vim-vint cmakelint yamllint
