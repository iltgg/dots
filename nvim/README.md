# Neovim Configuration

Based of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), more specifically the [modular fork](https://github.com/dam9000/kickstart-modular.nvim)

## File Structure:

- `init.lua` - require and run all files in `lua/`
- `lua/` - holds all lua files run by `init.lua`
    - `plugins/*.lua` - extra plugins
    - `*.lua` - base configurations and plugins
- `ftplugin/*.lua` - file type specific maps and options
