#! /usr/bin/env sh

packages="zsh git neovim net-tools util-linux-user dnf-plugins-core \
          eog celluloid vlc flatpak xreader gnome-tweaks gnome-extensions-app \
          zsh-syntax-highlighting starship alacritty \
          transmission \
          arm-none-eabi-gcc-cs arm-none-eabi-gcc-cs-c++ \
          gcc make cmake \
          bridge-utils libvirt virt-install qemu-kvm libvirt-devel virt-top libguestfs-tools guestfs-tools"

# Install basic dev packages
sudo dnf check-update
sudo dnf update -y
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y $packages

# Users and groups
groups="dialout audio video networkmanager libvirtd docker"
for group in $groups; do
    sudo groupadd -r $group;
    sudo usermod -aG $group $USER
done

# Install flatpak applications
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user -yyy install com.mattermost.Desktop
flatpak --user -yyy install flathub us.zoom.Zoom

# Install docker
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker

