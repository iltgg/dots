-- ThePrimeagen up down movement
vim.keymap.set({ 'n' }, '<C-d>', '<C-d>zz')
vim.keymap.set({ 'n' }, '<C-u>', '<C-u>zz')

vim.keymap.set({ 'i', 'n' }, '<C-s>', '<Cmd>w<CR>')
vim.keymap.set('n', 'cd', '<Cmd>cd %:h<CR>', { desc = '[C]hange working [d]irectory to current buffer' })

-- leader is space
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- 'j', 'k' as naturally when line is wrapped
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- add {number}{jk} to jump history, as well as allowing natural {jk} movement
vim.keymap.set('n', 'k', "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'", { expr = true, silent = true })
-- arrow key maps, consider the non-qwertyians among us
vim.keymap.set('n', '<Up>', "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'", { expr = true, silent = true })
vim.keymap.set('n', '<Left>', 'h')
vim.keymap.set('n', '<Right>', 'l')

-- diagnostic keymaps
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
