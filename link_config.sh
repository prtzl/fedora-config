#! /usr/bin/env sh

pushd dotfiles

# Alacritty
rm -rf ~/.config/Alacritty
mkdir -p ~/.config/Alacritty
ln -s $PWD/alacritty.yml ~/.config/Alacritty/alacritty.yml

# Starship
rm -f ~/.config/starship.toml
ln -s $PWD/starship.toml ~/.config/starship.toml

# Zsh
rm -f ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc

# Git
rm -f ~/.gitconfig
ln -s $PWD/.gitconfig ~/.gitconfig

# Neovim
rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim
ln -s $PWD/init.vim ~/.config/nvim/init.vim

# Nix
rm -rf ~/.config/nix
mkdir -p ~/.config/nix
ln -s $PWD/nix.conf ~/.config/nix/nix.conf

rm -f ~/.direnvrc
ln -s $PWD/.direnvrc ~/.direnvrc

popd
