#! /usr/bin/env sh

pushd dotfiles

# basename must be inside ./dotfiles
# path can be file or folder, no *
function link_path()
{
    fpath=$(echo $1 | sed 's:/*$::')
    mkdir -p $(dirname $fpath)
    rm -rf $fpath
    ln -s $PWD/$(basename $fpath) $fpath
}

paths="
~/.config/alacritty/alacritty.yml
~/.config/starship.toml
~/.config/nvim
~/.config/nix/nix.conf
~/.direnvrc
~/.tmux.conf
~/.zshrc
~/.tiorc
"

for p in $paths; do
    echo Linking path: $p
    link_path $p
done

popd
