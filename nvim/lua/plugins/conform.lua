return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      sh = { 'beautysh' },
      pyton = { 'autopep8' },
    },
  },
  init = function()
    vim.keymap.set('n', '<leader>f', function()
      require('conform').format()
    end, { desc = '[F]ormat buffer' })
  end,
}
