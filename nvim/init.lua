--[[
NEOVIM CONFIGURATION
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ vscode-neovim config ]]
if vim.g.vscode then
  require('lazy-bootstrap')
  require('vscode-plugins')
  require('vscode-options')
  require('keymaps')
  require('vscode-keymaps')
  return
end

-- [[ Install `lazy.nvim` plugin manager ]]
require('lazy-bootstrap')

-- [[ Configure plugins ]]
require('lazy-plugins')

-- [[ Setting options ]]
require('options')

-- [[ Basic Keymaps ]]
require('keymaps')

-- [[ Configure Telescope ]]
-- (fuzzy finder)
require('telescope-setup')

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require('treesitter-setup')

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require('lsp-setup')

-- [[ Configure nvim-cmp ]]
-- (completion)
require('cmp-setup')
