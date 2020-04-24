# Pacman config
sudo cp -rf $PWD/pacman.conf /etc/pacman.conf

#! /bin/bash
cp -rf $PWD/bin/** /usr/local/bin

# Setup desktop tools
sudo pacman -S --noconfirm ranger scrot

# setup neovim
sudo pacman -S --noconfirm neovim python python-pip
pip install --user yarp neovim

# steup directories
mkdir -p $HOME/.vim/{autoload,spell}
mkdir -p $HOME/.config/nvim/{autoload,spell}

# install Tmux config
ln -sfn $PWD/tmux $HOME/.tmux.conf

# install autoload functions
ln -sfn $PWD/autoload/najeeb $HOME/.vim/autoload/najeeb
ln -sfn $PWD/autoload/najeeb $HOME/.config/nvim/autoload/najeeb

# install nvim config
ln -sfn $PWD/vimrc $HOME/.vimrc
ln -sfn $PWD/vimrc $HOME/.config/nvim/init.vim

# install spelling dictionary
ln -sfn $PWD/spell $HOME/.vim/spell
ln -sfn $PWD/spell $HOME/.config/nvim/spell

# install tern config
ln -sfn $PWD/tern $HOME/.tern-config

# install XResources config
ln -sfn $PWD/xresources $HOME/.Xresources

# install tern config
cp -f $PWD/.env $HOME/.env
cp -f $PWD/.alias $HOME/.alias
cp -f $PWD/.bashrc $HOME/.bashrc
