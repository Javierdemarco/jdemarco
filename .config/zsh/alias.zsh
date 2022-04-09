# Aliases
# LS
alias ls="exa -l --color=always --group-directories-first"
alias ll="exa -al --color=always --group-directories-first"
alias l="exa --color=always --group-directories-first"
alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc
alias sc="source $HOME/.zshrc"          # reload zsh configuration
# PACMAN
alias dinstall="sudo dnf install"
alias dupdate="sudo dnf update"
alias dremove="sudo dnf uninstall"
alias dclean="sudo dnf autoremove"
# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
# Confirm rm file
alias rm="rm -i"
# Get top process eating memory
alias psmem="ps auxf | sort -nr -k 4 | head -10"
# Get top process eating cpu
alias pscpu="ps auxf | sort -nr -k 3 | head -10"
# shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"
# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"
# Logout from user
alias lgout="pkill -KILL -u javi"
# Neovim
alias v="nvim"
#Zoxide
alias z="zoxide"

export PATH=~/.local/bin:$PATH

function man() {
	env \
		LESS_TERMCAP_md=$(tput bold; tput setaf 4) \
		LESS_TERMCAP_me=$(tput sgr0) \
		LESS_TERMCAP_mb=$(tput blink) \
		LESS_TERMCAP_us=$(tput setaf 2) \
		LESS_TERMCAP_ue=$(tput sgr0) \
		LESS_TERMCAP_so=$(tput smso) \
		LESS_TERMCAP_se=$(tput rmso) \
		PAGER="${commands[less]:-$PAGER}" \
		man "$@"
}
