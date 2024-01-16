return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  version = false,
  config = function()
    require('mini.files').setup { options = { use_as_default_explorer = false } }
    vim.keymap.set({ 'n' }, '<leader>o', _G.MiniFiles.open, { desc = '[O]pen Files' })
    vim.api.nvim_set_hl(0, 'MiniFilesNormal', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'MiniFilesBorder', { link = 'Normal' })
  end,
}
