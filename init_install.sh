#! /usr/bin/env sh

packages_shell="alacritty zsh zsh-syntax-highlighting starship fzf zsh-autosuggestions direnv"

packages_media="eog celluloid vlc xreader transmission gimp chromium skypeforlinux texlive-scheme-full texstudio"

packages_tools="git net-tools xclip util-linux-user dnf-plugins-core flatpak megasync tio neofetch htop subversion p7zip redshift wmctrl xdotool"

packages_virt="bridge-utils virt-manager libvirt virt-install qemu-kvm libvirt-devel virt-top libguestfs-tools guestfs-tools docker-ce docker-ce-cli containerd.io docker-compose podman podman-compose"

packages_lib="ncurses-compat-libs"

packages_dev="arm-none-eabi-gcc-cs arm-none-eabi-gcc-cs-c++ arm-none-eabi-newlib gcc g++ make cmake clang-tools-extra python3 python3-pip stlink valgrind code"

command=$1
if [[ -z "$command" || ("$command" != "packages" && "$command" != "all") ]]; then
    echo "Command: ./init_install.sh <all/packages>"
    exit 1
fi

# Install basic dev packages
echo "Updating and installing packages!"
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf update -y
sudo dnf install -y $packages_shell $packages_media $packages_tools $packages_virt $packages_lib $packages_dev 

if [[ "$command" == "packages" ]]; then
    echo "Installed all packages!"
    exit
fi

# Users and groups
echo "Setting groups for $USER"
groups="dialout audio video networkmanager libvirtd docker"
for group in $groups; do
sudo sh -c "
    sudo groupadd -r $group
    sudo usermod -aG $group $USER
"
done

# Install flatpak applications
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user -yyy install com.mattermost.Desktop
flatpak --user -yyy install flathub us.zoom.Zoom

# Install docker
sudo -sh -c "
systemctl enable docker
systemctl start docker
"

# Install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Install direnv for nix (plugin)
git clone https://github.com/nix-community/nix-direnv ~/nix-direnv

# Link dotfiles (will replace any existing)
./link_config.sh

