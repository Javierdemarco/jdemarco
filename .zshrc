# Starship Prompt
eval "$(starship init zsh)"
# Enable colors and change prompt
autoload -U colors && colors
# Lines configured by zsh-newuser-install
SAVEHIST=1000
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=1000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
# Vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
zstyle ':completion*' menu select
# Case insensitive completion
zstyle ':completion*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files
# End of lines added by compinstall

# Source config files
# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$HOME/.local/bin"
fi
# Add to path custom bin
if [ -d "$HOME/.scripts/apps" ] ; then
    PATH="$PATH:$HOME/.scripts/apps"
fi
for f in ~/.config/zsh/*.zsh; do source "$f"; done
eval "$(zoxide init zsh)"
# Variables
export EDITOR=nvim
export VISUAL=nvim
