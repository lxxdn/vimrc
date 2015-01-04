#! /bin/sh

cd ~
rm -rf .vim .vimrc
curl https://raw.githubusercontent.com/lxxdn/vimrc/master/vimrc >> .vimrc
mkdir -p .vim/colors
curl https://raw.githubusercontent.com/lxxdn/vimrc/master/solarized.vim >> .vim/colors/solarized.vim
curl https://raw.githubusercontent.com/lxxdn/vimrc/master/molokai.vim >> .vim/colors/molokai.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
