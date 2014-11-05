#!/bin/sh

if [ ! -d $HOME/.vim/bundle ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

mkdir -p $HOME/.vim/undo
