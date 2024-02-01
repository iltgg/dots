vim.keymap.set({ 'i' }, '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u') -- Thank you Gilles Castel
vim.keymap.set({ 'n' }, '<C-l>', '[s1z=`]')

vim.keymap.set({ 'n' }, '<leader>wc', "<Cmd>echo system('texcount " .. vim.fn.expand('%:p') .. "')<CR>", { desc = '[W]ord [C]ount' })
