function fish_right_prompt --description 'Right Fish Prompt'
    if test "$fish_private_mode"
        set_color magenta
        echo '[private]'
        set_color normal
    end
end
