return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  version = false,
  config = function()
    require('mini.files').setup({ options = { use_as_default_explorer = false } })
    local minifiles_toggle = function()
      if not _G.MiniFiles.close() then
        _G.MiniFiles.open()
      end
    end
    vim.keymap.set({ 'n' }, '<leader>o', minifiles_toggle, { desc = '[O]pen Files' })
    vim.api.nvim_set_hl(0, 'MiniFilesNormal', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'MiniFilesBorder', { link = 'Normal' })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'minifiles',
      callback = function()
        vim.keymap.set('n', '<Esc>', function()
          _G.MiniFiles.close()
        end)
        vim.keymap.set('n', '<CR>', function()
          _G.MiniFiles.go_in({})
        end)
      end,
    })

    require('mini.pairs').setup()
    require('mini.move').setup()
  end,
}
