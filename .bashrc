#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias lsa='ls -a'
alias grep='grep --color=auto'
alias ..='cd ..'

# alias vim='nvim'
alias vi='nvim'
alias emacs='nvim'
alias nano='nvim'
alias cvi='nvim --clean'

alias sudo='sudo '

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

PS1='\[${PUR}\]\W \[${WHI}\]\$ \[${RESET}\]'
# PS1='\[${PUR}\]\u\[${WHI}\]@\[${LPUR}\]\h \[${BLU}\]\W \[${LBLU}\]\$ \[${RESET}\]'
# PS1='[\u@\h \W]\$ '

export PATH=$HOME/bin:$PATH
export VISUAL=nvim
export EDITOR=nvim
export XDG_SCREENSHOTS_DIR=$HOME/screenshots
chmod -R 755 $HOME/bin
ls
