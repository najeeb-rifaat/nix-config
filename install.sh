#! /bin/bash

# steup directories
mkdir -p ~/.vim/{autoload,spell}
mkdir -p ~/.config/nvim/{autoload,spell}

# install Tmux config
ln -sfn $PWD/tmux ~/.tmux.conf

# install autoload functions
ln -sfn $PWD/autoload/najeeb ~/.vim/autoload/najeeb
ln -sfn $PWD/autoload/najeeb ~/.config/nvim/autoload/najeeb

# install nvim config
ln -sfn $PWD/vimrc ~/.vimrc
ln -sfn $PWD/vimrc ~/.config/nvim/init.vim

# install spelling dictionary
ln -sfn $PWD/spell ~/.vim/spell
ln -sfn $PWD/spell ~/.config/nvim/spell

# install tern config
ln -sfn $PWD/tern ~/.tern-config
