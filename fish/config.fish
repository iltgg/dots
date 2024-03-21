if status is-interactive
# <<set l
#     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#         exec Hyprland
#     end
# >>set

    # FISH CONFIGURATION

    set -g fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
    function fish_mode_prompt; end
    # create a file in ./functions called `extra_terminal_shortcuts.fish` (this file is git ignored)
    # add a function called extra_terminal_shortcuts
    # place any per-machine aliases inside
    # place any per-machine functions outside
    extra_terminal_shortcuts

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

    alias sudo='sudo '

    ## FISH ALIASES

    alias bd='prevd'
    alias nd='nextd'

    # EXPORTS

    set -gx MANPAGER "less -R --use-color -Dd+r -Du+b"
    set -gx MANROFFOPT "-P -c"

    set -gx PATH $HOME/bin:$HOME/.local/bin:$PATH
    set -gx VISUAL vim
    set -gx EDITOR vim
    set -gx TERMINAL kitty
    set -gx XDG_SCREENSHOTS_DIR $HOME/screenshots
    set -gx QT_QPA_PLATFORMTHEME gtk2
    chmod -R 755 $HOME/bin
end
