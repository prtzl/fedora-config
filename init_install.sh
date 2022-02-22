#! /usr/bin/env sh

packages="zsh git neovim net-tools util-linux-user \
          eog celluloid vlc flatpak xreader \
          zsh-syntax-highlighting starship alacritty \
          transmission \
          arm-none-eabi-gcc-cs arm-none-eabi-gcc-cs-c++ \
          gcc make cmake"

# Install basic dev packages
sudo dnf check-update
sudo dnf update -y
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y $packages

# Install flatpak applications
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user -yyy install com.mattermost.Desktop
flatpak --user -yyy install flathub us.zoom.Zoom
