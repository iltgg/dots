-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between system and Neovim.
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- highlight current line cursor is on
vim.o.cursorline = true
-- vim.cmd("hi CursorLine gui=underline cterm=underline")

-- Minimum lines to show above and around cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- tab style
vim.o.tabstop = 4
vim.o.listchars = 'tab:▹▹▸,trail:~'
vim.cmd('set invlist')

-- let Neovim control terminal name, behavior will vary by terminal
vim.o.title = true
