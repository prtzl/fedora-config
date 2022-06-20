#! /usr/bin/env sh

pushd dotfiles

# basename must be inside ./dotfiles
# path can be file or folder, no *
function link_path()
{
    fpath=$(echo $1 | sed 's:/*$::')
    dir=$(dirname $fpath)
    if [[ "$dir" != $HOME ]]; then
        mkdir -p $dir
    fi
    rm -rf $fpath
    ln -s $PWD/$(basename $fpath) $fpath
}

paths="
$HOME/.config/alacritty/alacritty.yml
$HOME/.config/starship.toml
$HOME/.config/nvim
$HOME/.config/nix/nix.conf
$HOME/.direnvrc
$HOME/.tmux.conf
$HOME/.zshrc
$HOME/.tiorc
"

for p in $paths; do
    echo Linking path: $p
    link_path $p
done

popd
