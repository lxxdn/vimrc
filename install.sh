#! /bin/sh

cd ~
rm -rf .vim .vimrc
curl https://raw.githubusercontent.com/lxxdn/vimrc/master/vimrc >> .vimrc
mkdir -p .vim/colors
curl https://https://raw.githubusercontent.com/lxxdn/vimrc/master/molokai.vim >> .vim/colors/molokai.vim

