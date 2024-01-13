#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias lsa='ls -A'
alias lsl='ls -l'
alias lsla='ls -l -A'
alias grep='grep --color=auto'
alias ..='cd ..'

alias vi='nvim' # speed is key
alias vic='nvim --clean' # nvim with no configs, probably just use "vim" though
alias vig='nvim +Git +only' # fugitive is the best git wrapper
alias viw='NVIM_MD_AUTO=true nvim' # mkdown auto preview

alias sudo='sudo '

diffstrings () {
diff <( printf '%s\n' "$1" ) <( printf '%s\n' "$2" )
}

WHI="$(tput setaf 7)"
CYA="$(tput setaf 6)"
PUR="$(tput setaf 5)"
BLU="$(tput setaf 4)"
ORA="$(tput setaf 3)"
GRE="$(tput setaf 2)"
RED="$(tput setaf 1)"
LWHI="$(tput setaf 15)"
LCYA="$(tput setaf 14)"
LPUR="$(tput setaf 13)"
LBLU="$(tput setaf 12)"
LORA="$(tput setaf 11)"
LGRE="$(tput setaf 10)"
LRED="$(tput setaf 9)"
RESET="$(tput sgr0)"

PS1='\[${WHI}\]\W \[${PUR}\]\$ \[${RESET}\]'

export PATH=$HOME/bin:$PATH
export VISUAL=nvim
export EDITOR=nvim
export XDG_SCREENSHOTS_DIR=$HOME/screenshots
export QT_QPA_PLATFORMTHEME=gtk2
chmod -R 755 $HOME/bin
