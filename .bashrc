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
#   SOURCE

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
alias diff='diff --color=auto'

alias bd='cd "$OLDPWD"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias svi='sudo vim'
alias vin='nvim'
alias vi.='nvim .'
alias vic='nvim --clean' # nvim with no configs, probably just use "vim" though
alias vig='nvim +Git +only' # fugitive is the best git wrapper
alias viw='NVIM_MD_AUTO=true nvim' # mkdown auto preview

alias ra='. ranger'

alias sudo='sudo '

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# FUNCTIONS

# cd to dir or file dir if calling nvim from home dir
vi () {
    dir=$(dirname "$1")
    base=$(basename "$1")

    if [[ ! -n "$1" ]]; then # no parameter -> raw nvim
        nvim
    elif [[ $(pwd) == $HOME ]]; then # calling from HOME
        if [[ -d "$1" ]]; then # if directory -> enter and open
            cd "$1"
            nvim .
        elif [[ -e "$1" ]]; then # if file -> cd file dir and open
            cd "$dir"
            nvim "$base"
        else # otherwise open
            nvim $1
        fi
    elif [[ $(pwd) == "$HOME/$dir" ]]; then # if pwd matches file dir -> open base
        nvim "$base"
    elif [[ $(pwd) == "$HOME/$1" || "$(pwd)/" == "$HOME/$1" ]]; then # if pwd matches dir -> open dir
        nvim .
    else # otherwise open
        nvim $1
    fi
}

# always cd to dir or file dir before opening nvim
vid () {
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
    for archive in "$@"; do
        if [ -f "$archive" ] ; then
            case "$archive" in
                *.tar.bz2)   tar xvjf "$archive"    ;;
                *.tar.gz)    tar xvzf "$archive"    ;;
                *.bz2)       bunzip2 "$archive"     ;;
                *.rar)       rar x "$archive"       ;;
                *.gz)        gunzip "$archive"      ;;
                *.tar)       tar xvf "$archive"     ;;
                *.tbz2)      tar xvjf "$archive"    ;;
                *.tgz)       tar xvzf "$archive"    ;;
                *.zip)       unzip "$archive"       ;;
                *.Z)         uncompress "$archive"  ;;
                *.7z)        7z x "$archive"        ;;
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

# get current branch in git repo
function parse_git_branch () {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty () {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

function nonzero_return () {
    RETVAL=$?
    [ $RETVAL -ne 0 ] && echo "[$RETVAL]"
}

function prompt_command () {
    RET="$(nonzero_return)"
    BRANCH="$(parse_git_branch)"
    PS1="\[${GRN}\][\A]\[${CYN}\][\W]\[${ORA}\]$BRANCH\[${RED}\]$RET\[${PUR}\]\$ \[${RST}\]"
}

PROMPT_COMMAND="prompt_command"
PS1="\$ "

export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

export PATH=$HOME/bin:$PATH
export VISUAL=vim
export EDITOR=vim
export XDG_SCREENSHOTS_DIR=$HOME/screenshots
export QT_QPA_PLATFORMTHEME=gtk2
chmod -R 755 $HOME/bin

# SOURCE

if [ -f ~/.bash_shortcuts ]; then
    source ~/.bash_shortcuts
fi
