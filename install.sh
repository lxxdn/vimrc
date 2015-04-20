#! /bin/sh

cd ~
rm -rf .vim .vimrc
mkdir -p .vim/colors
git clone  https://github.com/lxxdn/vimrc.git
mv vimrc/molokai.vim .vim/colors/molokai.vim

mv vimrc/vimrc ~/.vimrc
rm -rf vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#for install airline font
git clone https://github.com/powerline/fonts.git tmpfonts
./tmpfonts/install.sh
rm -rf tmpfonts
