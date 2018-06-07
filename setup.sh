#!/bin/bash

VIM_FILE_LOCATION='https://raw.githubusercontent.com/zkry/dotfiles/master/init.vim'

wget -O ~/.vimrc $VIM_FILE_LOCATION
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
