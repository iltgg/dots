function vi
    if test -z "$argv[1]"  # no parameter -> raw nvim
        nvim
        return
    end

    set -l dir (dirname $argv[1])
    set -l base (basename $argv[1])
    if test (pwd) = $HOME # calling from HOME
        if test -d "$argv[1]" # if directory -> enter and open
            cd "$argv[1]"
            nvim . $argv[2..-1]
        else if test -e "$argv[1]" # if file -> cd file dir and open
            cd "$dir"
            nvim "$base" $argv[2..-1]
        else # otherwise open
            nvim $argv[1] $argv[2..-1]
        end
    else if test (pwd) = "$HOME/$dir" # if pwd matches file dir -> open base
        nvim "$base" $argv[2..-1]
    else if test (pwd) = "$HOME/$argv[1]" || test (pwd)/ = "$HOME/$argv[1]" # if pwd matches dir -> open dir
        nvim . $argv[2..-1]
    else # otherwise open
        nvim $argv[1] $argv[2..-1]
    end
end
