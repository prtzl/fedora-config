#! /usr/bin/env sh

packages_shell= "zsh tmux zsh-syntax-highlighting starship alacritty fzf \
                zsh-autosuggestions direnv neovim"

packages_media= "eog celluloid vlc xreader transmission gimp chromium \
                skypeforlinux texlive-scheme-full texstudio"

packages_tools= "git net-tools xclip util-linux-user dnf-plugins-core flatpak \
                megasync tio neofetch htop subversion p7zip redshift \
                wmctrl xdotool"

packages_virt=  "bridge-utils virt-manager libvirt virt-install qemu-kvm \
                libvirt-devel virt-top libguestfs-tools guestfs-tools"

packages_lib=   "ncurses-compat-libs"

packages_dev=   "arm-none-eabi-gcc-cs arm-none-eabi-gcc-cs-c++ arm-none-eabi-newlib \
                gcc g++ make cmake clang-tools-extra\
                python3 python3-pip \
                stlink valgrind"

# Install basic dev packages
sudo dnf check-update
sudo dnf update -y
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y $packages_shell $packages_media $packages_tools \
                    $packages_virt $packages_lib $packags_dev

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
sudo dnf install -yy docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker

# Install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Install direnv for nix (plugin)
git clone https://github.com/nix-community/nix-direnv ~/nix-direnv

# Link dotfiles (will replace any existing)
./link_config.sh

