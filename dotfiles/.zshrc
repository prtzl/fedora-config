# .zshrc

# Completion and colors
autoload -U colors && colors
autoload -U compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ""
zstyle ':completion:*' matcher-list "" 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
_comp_options+=(globdots)


# ENV variables
export EDITOR="nvim"
export TERM="xterm-256color"


# History
HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="$HOME/.cache/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
unsetopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY


# Keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^[[3~" delete-char
bindkey "^[[3;5~" delete-char
bindkey '^H' backward-kill-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '\e[11~' "urxvt &\n"


# Aliases
alias vim='nvim'
alias vi='vim'
alias grep='grep --color=always'
alias gvim='nvim-qt'
alias img='eog'
alias l='ls -la'
alias ll='ls -l'
alias ls='ls --group-directories-first --color=auto'
alias pdf='evince'
alias play='celluloid'
alias poweroff='read -s \?"Poweroff? [ENTER]: " && if [ -z "$REPLY" ];then env poweroff;else echo "Canceled";fi'
alias reboot='read -s \?"Reboot? [ENTER]: " && if [ -z "$REPLY" ];then env reboot;else echo "Canceled";fi'
alias sl='sl -eade-999'
alias tl='tmux list-sessions'
alias fsr="wmctrl -i -r \$(xwininfo | grep xwininfo | awk '{if(NR==2) print \$4}') -b remove,fullscreen"
alias alacritty="nixGLIntel alacritty"

# Suffix aliases
alias -s {txt,md,c,cpp,h,hpp,py,vhd}=vi


# Autosuggestion
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# Fuzzy search
source /usr/share/fzf/shell/key-bindings.zsh


# Syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null


# Enable starship
eval "$(starship init zsh)"

# Nix
export GIT_SSH_COMMAND="/usr/bin/ssh"
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
. $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

# For non nixos :/
export XDG_DATA_DIRS=$XDG_DATA_DIRS:~/.nix-profile/share
cp -f ~/.nix-profile/share/applications/*.desktop ~/.local/share/applications/

eval "$(direnv hook zsh)"
