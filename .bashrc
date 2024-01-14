#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# some configs from: https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c

# TOC:
#   CONFIGURATION
#   ALIASES
#   FUNCTIONS
#   EXPORTS

# CONFIGURATION

export HISTFILESIZE=10000
export HISTSIZE=500
export HISTCONTROL=erasedups:ignoredups:ignorespace

shopt -s checkwinsize

shopt -s histappend
PROMPT_COMMAND='history -a'

# ALIASES

alias ls='ls --color=auto'
alias lsa='ls -A'
alias lsl='ls -lh --time-style="+%Y-%m-%d %H:%M:%S"'
alias lsla='ls -lhA --time-style="+%Y-%m-%d %H:%M:%S"'

alias grep='grep --color=auto'

alias bd='cd "$OLDPWD"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias svi='sudo vim'
# alias vi='nvim' # speed is key
alias vi.='nvim .'
alias vic='nvim --clean' # nvim with no configs, probably just use "vim" though
alias vig='nvim +Git +only' # fugitive is the best git wrapper
alias viw='NVIM_MD_AUTO=true nvim' # mkdown auto preview

alias ra='. ranger'

alias sudo='sudo '

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# FUNCTIONS

# cd so new terminals can spawn in working dir
vi () {
    if [[ ! -n "$1" ]]; then
        nvim
    elif [[ -d "$1" ]]; then
        cd "$1"
        nvim .
    else
        dir=$(dirname "$1")
        file=$(basename "$1")
        cd "$dir"
        nvim "$file"
    fi
}

cdh() {
    cd "${HOME}/${1}"
}

diffstrings () {
    diff <( printf '%s\n' "$1" ) <( printf '%s\n' "$2" )
}

extract () {
    for archive in $*; do
        if [ -f $archive ] ; then
            case $archive in
                *.tar.bz2)   tar xvjf $archive    ;;
                *.tar.gz)    tar xvzf $archive    ;;
                *.bz2)       bunzip2 $archive     ;;
                *.rar)       rar x $archive       ;;
                *.gz)        gunzip $archive      ;;
                *.tar)       tar xvf $archive     ;;
                *.tbz2)      tar xvjf $archive    ;;
                *.tgz)       tar xvzf $archive    ;;
                *.zip)       unzip $archive       ;;
                *.Z)         uncompress $archive  ;;
                *.7z)        7z x $archive        ;;
                *)           echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

# EXPORTS

WHI="$(tput setaf 7)"
CYN="$(tput setaf 6)"
PUR="$(tput setaf 5)"
BLU="$(tput setaf 4)"
ORA="$(tput setaf 3)"
GRN="$(tput setaf 2)"
RED="$(tput setaf 1)"
LWHI="$(tput setaf 15)"
LCYA="$(tput setaf 14)"
LPUR="$(tput setaf 13)"
LBLU="$(tput setaf 12)"
LORA="$(tput setaf 11)"
LGRE="$(tput setaf 10)"
LRED="$(tput setaf 9)"
RST="$(tput sgr0)"

PS1='\[${GRN}\][\A]\[${CYN}\][\W]\[${PUR}\]\$ \[${RST}\]'

export PATH=$HOME/bin:$PATH
export VISUAL=vim
export EDITOR=vim
export XDG_SCREENSHOTS_DIR=$HOME/screenshots
export QT_QPA_PLATFORMTHEME=gtk2
chmod -R 755 $HOME/bin
