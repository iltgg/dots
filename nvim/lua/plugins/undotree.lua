return {
  'mbbill/undotree',
  init = function()
    vim.keymap.set({ 'n' }, '<leader>z', vim.cmd.UndotreeToggle, { desc = 'Toggle Undo Tree' })
  end,
}
