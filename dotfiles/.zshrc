# .zshrc

# Completion and colors
autoload -U colors && colors
autoload -U compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ""
zstyle ':completion:*' matcher-list "" 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
_comp_options+=(globdots)


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
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down      
bindkey "^[[3~" delete-char
bindkey "^[[3;5~" delete-char
bindkey '^H' backward-kill-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '\e[11~' "urxvt &\n"


# Aliases
alias vimdiff='nvim -d'
alias -g grep='grep --color=always'
alias -g gvim='nvim-qt'
alias -g img='eog'
alias -g l='ls -la'
alias -g ll='ls -l'
alias -g ls='ls --group-directories-first --color=auto'
alias -g pdf='evince'
alias -g play='celluloid'
alias -g poweroff='read \?"Poweroff? ENTER/Ctrl+C " && env poweroff'
alias -g reboot='read \?"Reboot? ENTER/Ctrl+C " && env reboot'
alias -g sl='sl -ead -999'
alias -g ssh='ssh -Y -C'

# Fuzzy search // TODO

# Enable starship
eval "$(starship init zsh)"
