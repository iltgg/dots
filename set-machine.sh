#!/bin/bash

# set config files to [l]aptop or [d]esktop
# TODO:
#   - fix linting issues
#   - make more efficient

# USAGE GUIDE:
# prefix all mods with
#   ==set
# use [machine] to specify lines to comment in
# separate multiple machines with spaces.
# script will search file(s) for lines with ==set
#
# MACHINE:
# currently l or d
#
# EXAMPLE:
# monitor=,preferred,auto,1 # ==set l
# comments out if l not specified, comments in if l specified
#
# MULTI-LINE BLOCKS:
# specify start with
#   <<start [machine] ...
# specify end with
#   >>end
# entire block will be commented in/out
# unclosed blocks have undefined behaviour
# nested blocks are not supported

if [[ $# -eq 0 ]]; then
    echo "machine not supplied"
    exit 1
fi

# machine-code comment-string file
# setMachine {machine} {comment string} {file}
setMachine () {
    # get lines with ==set
    lines=$(grep "==set" -n "$3")
    SAVEIFS=$IFS
    IFS=$'\n'
    lines=($lines)
    IFS=$SAVEIFS

    for (( i=0; i<${#lines[@]}; i++ ))
    do
        line=$(echo ${lines[$i]} | awk -F ":" '{print $1}')    # get line number
        cmd=$(echo ${lines[$i]} | awk -F "==set" '{print $2}') # get machines

        sed -i "${line}s/^$2//" $3                    # remove comments
        if ! echo $cmd | grep -q -E "(\s|^)$1\b"; then  # if not present
            sed -i "${line}s/^/$2/" $3                # add comment
        fi
    done

    # get multi lines
    starts=$(grep -F "<<set" -n $3)
    ends=$(grep -F ">>set" -n $3)
    SAVEIFS=$IFS
    IFS=$'\n'
    starts=($starts)
    ends=($ends)
    IFS=$SAVEIFS

    if [[ ${#starts[@]} != ${#ends[@]} ]]; then
        echo "block start/end mismatch, skipping..."
        exit 1
    fi

    for (( i=0; i<${#starts[@]}; i++))
    do
        start=$(echo ${starts[$i]} | awk -F ":" '{print $1}')   # get line start
        end=$(echo ${ends[$i]} | awk -F ":" '{print $1}')       # get line end
        cmd=$(echo ${starts[$i]} | awk -F "<<set" '{print $2}') # get machines
        start=$((start + 1))
        end=$((end - 1))
        for (( j=$start; j<=$end; j++ ))
        do
            sed -i "${j}s/^$2//" $3                    # remove comments
        done
        if ! echo $cmd | grep -q -E "(\s|^)$1\b"; then # if not present
            for (( j=$start; j<=$end; j++ ))
            do
                sed -i "${j}s/^/$2/" $3                # add comment
            done
        fi
    done
}

if [[ $1 == "l" ]]; then
    setMachine 'l' '# ' ./hypr/apps.conf
    setMachine 'l' '# ' ./hypr/binds.conf
    setMachine 'l' '# ' ./hypr/hyprland.conf
    setMachine 'l' '# ' ./fish/config.fish
    echo "set hyprland config to laptop"
    exit 0
fi

if [[ $1 == "d" ]]; then
    setMachine 'd' '# ' ./hypr/apps.conf
    setMachine 'd' '# ' ./hypr/binds.conf
    setMachine 'd' '# ' ./hypr/hyprland.conf
    setMachine 'd' '# ' ./fish/config.fish
    echo "set hyprland config to desktop"
    exit 0
fi
