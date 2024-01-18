vim.keymap.set('n', 'mi', 'ysiw*e', { remap = true })
vim.keymap.set('n', 'mI', 'ds*', { remap = true })
vim.keymap.set('v', 'mi', 'S*e', { remap = true })
vim.keymap.set('v', 'mI', '<Esc>ds*', { remap = true })

vim.keymap.set('n', 'mb', 'ysiw*l.e', { remap = true })
vim.keymap.set('n', 'mB', 'ds*.', { remap = true })
vim.keymap.set('v', 'mb', 'S*gvS*e', { remap = true })
vim.keymap.set('v', 'mB', '<Esc>ds*.', { remap = true })

vim.keymap.set('n', 'ms', 'ysiw~l.e', { remap = true })
vim.keymap.set('n', 'mS', 'ds~.', { remap = true })
vim.keymap.set('v', 'ms', 'S~gvS~e', { remap = true })
vim.keymap.set('v', 'mS', '<Esc>ds~.', { remap = true })

vim.keymap.set('n', 'mc', 'ysiw`e', { remap = true })
vim.keymap.set('n', 'mC', 'ds`', { remap = true })
vim.keymap.set('v', 'mc', 'S`e', { remap = true })
vim.keymap.set('v', 'mC', '<Esc>ds`', { remap = true })
