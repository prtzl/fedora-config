#! /usr/bin/env sh

pushd dotfiles

# Alacritty
rm -rf ~/.config/Alacritty/*
ln -s alacritty.yml ~/.config/Alacritty/alacritty.yml

# Starship
rm -f ~/.config/starship.toml
ln -s starship.toml ~/.config/starship.toml

# Zsh
rm -f ~/.zshrc
ln -s .zshrc ~/.zshrc

# Git
rm -f ~/.gitconfig
ln -s .gitconfig ~/.gitconfig

popd
