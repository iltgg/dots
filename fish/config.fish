if status is-interactive
    # Commands to run in interactive sessions can go here

    # FISH CONFIGURATION

    set -g fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
    function fish_mode_prompt; end

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

    alias vi='nvim' # TODO: translate bash function
    alias svi='sudo vim'
    alias vin='nvim'
    alias vi.='nvim .'
    alias vic='nvim --clean' # nvim with no configs, probably just use "vim" though
    alias vig='nvim +Git +only' # fugitive is the best git wrapper
    alias viw='NVIM_MD_AUTO=true nvim' # mkdown auto preview

    alias sudo='sudo '

    # EXPORTS

    set -gx MANPAGER "less -R --use-color -Dd+r -Du+b"
    set -gx MANROFFOPT "-P -c"

    set -gx PATH $HOME/bin:$PATH
    set -gx VISUAL vim
    set -gx EDITOR vim
    set -gx TERMINAL kitty
    set -gx XDG_SCREENSHOTS_DIR $HOME/screenshots
    set -gx QT_QPA_PLATFORMTHEME gtk2
    chmod -R 755 $HOME/bin
end
