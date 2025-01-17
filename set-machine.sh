#!/usr/bin/env bash

# set config files to [l]aptop or [d]esktop
# TODO:
#   - fix linting issues
#   - make more efficient

# USAGE GUIDE:
# prefix all mods with
#   ==set
# use [machine] to specify lines to comment in.
# separate multiple machines with spaces.
# script will search file(s) for lines with ==set
#
# MACHINE:
# can be any word or combination of characters
# e.g. l d laptop desktop tablet
#
# EXAMPLE:
# monitor=,preferred,auto,1 # ==set l v
# comments out if l and/or v not specified, comments in if l and/or v specified
#
# MULTI-LINE BLOCKS:
# specify start with
#   <<start [machine] ...
# specify end with
#   >>end
# entire block will be commented in/out
# unclosed blocks have undefined behaviour
# nested blocks are not supported
#
# RUNNING SCRIPT:
# ./set-machine.sh [machines comma separated]
#
# EXAMPLE:
# ./set-machine.sh 'l,lt1440'
# sets configs to laptop with 1440 external monitor on top

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
    IFS=$','
    machines=($1)
    IFS=$SAVEIFS


    for (( i=0; i<${#lines[@]}; i++ ))
    do
        line=$(echo ${lines[$i]} | awk -F ":" '{print $1}')    # get line number
        cmd=$(echo ${lines[$i]} | awk -F "==set" '{print $2}') # get machines

        sed -i "${line}s/^$2//" $3                    # remove comments
        contains=0
        for (( j=0; j<${#machines[@]}; j++ ))
        do
            if echo $cmd | grep -q -E "(\s|^)${machines[$j]}\b"; then  # if present
                contains=1
            fi
        done
        if [[ contains -eq 0 ]]; then
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
        # if ! echo $cmd | grep -q -E "(\s|^)$1\b"; then # if not present
        #     for (( j=$start; j<=$end; j++ ))
        #     do
        #         sed -i "${j}s/^/$2/" $3                # add comment
        #     done
        # fi
        contains=0
        for (( j=0; j<${#machines[@]}; j++ ))
        do
            if echo $cmd | grep -q -E "(\s|^)${machines[$j]}\b"; then  # if present
                contains=1
            fi
        done
        if [[ contains -eq 0 ]]; then
            for (( j=$start; j<=$end; j++ ))
            do
                sed -i "${j}s/^/$2/" $3                # add comment
            done
        fi
    done
}

# ADD FILES HERE:

setMachine "$1" '# ' ./hypr/apps.conf
setMachine "$1" '# ' ./hypr/binds.conf
setMachine "$1" '# ' ./hypr/options.conf
setMachine "$1" '# ' ./hypr/hyprland.conf
setMachine "$1" '# ' ./fish/config.fish

case "$1" in
    "l")
        echo "set configs to laptop"
        ;;
    "d")
        echo "set configs to desktop"
        ;;
    *) echo "set configs to $1"
        ;;
esac
