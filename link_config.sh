#! /usr/bin/env sh

pushd dotfiles

# Alacritty
rm -rf ~/.config/alacritty
mkdir -p ~/.config/alacritty
ln -s $PWD/alacritty.yml ~/.config/alacritty/alacritty.yml

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
ln -s $PWD/nvim/* ~/.config/nvim/

# Nix
rm -rf ~/.config/nix
mkdir -p ~/.config/nix
ln -s $PWD/nix.conf ~/.config/nix/nix.conf

rm -f ~/.direnvrc
ln -s $PWD/.direnvrc ~/.direnvrc

# Tmux
rm -f ~/.tmux.conf
ln -s $PWD/.tmux.conf ~/.tmux.conf

popd
