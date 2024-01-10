return {
  'stevearc/conform.nvim',
  opts = { formatters_by_ft = { lua = { 'stylua' } } },
  init = function()
    vim.keymap.set('n', '<leader>f', function()
      require('conform').format()
    end, { desc = '[F]ormat buffer' })
  end,
}
