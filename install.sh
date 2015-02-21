#! /bin/sh

cd ~
rm -rf .vim .vimrc
mkdir -p .vim/colors
git clone  https://github.com/lxxdn/vimrc.git
mv vimrc/solarized.vim .vim/colors/solarized.vim
mv vimrc/molokai.vim .vim/colors/molokai.vim
mv vimrc/Tomorrow-Night-Eighties.vim .vim/colors/molokai.vim

mv vimrc/vimrc ~/.vimrc
rm -rf vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
