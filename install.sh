#!/bin/bash

# parola este ceruta dupa o saptamana
git config --global credential.helper 'cache --timeout=604800'

# opreste flicareala cursorului
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')/ cursor-blink-mode off

PACKAGES=" tmux clang llvm neovim fish zsh tree ruby gem stack 
              haskell-platform cmake python-devel python3-develautomake gcc gcc-c++ kernel-devel
              gconf-editor gnome-tweak-tool npm"

function zsh_extra_packages {
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

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

# incepe instalarea
$INSTALLER PACKAGES

sudo pip install --upgrade neovim
sudo pip install vim-vint cmakelint yamllint

echo "\n\nPls Restart"
