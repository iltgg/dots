-- [[ Basic Keymaps ]]

vim.keymap.set({ 'n' }, '<C-d>', '<C-d>zz')
vim.keymap.set({ 'n' }, '<C-u>', '<C-u>zz')

-- vim.keymap.set({ 'n' }, '<leader>pv', vim.cmd.Ex)

vim.keymap.set({ 'i' }, '<C-h>', '<Left>')
vim.keymap.set({ 'i' }, '<C-l>', '<Right>')
-- vim.keymap.set({ 'i' }, '<C-j>', '<Down>')
-- vim.keymap.set({ 'i' }, '<C-k>', '<Up>')
vim.keymap.set({ 'i' }, '<C-j>', '<C-o>gj')
vim.keymap.set({ 'i' }, '<C-k>', '<C-o>gk')

vim.keymap.set({ 'i', 'n' }, '<C-s>', '<Cmd>w<CR>')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
