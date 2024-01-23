return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      sh = { 'beautysh' },
      python = { 'autopep8' },
      tex = { 'latexindent' },
    },
  },
  config = function(_, opts)
    require('conform').setup(opts)
    vim.keymap.set('n', '<leader>f', function()
      require('conform').format({ lsp_fallback = true })
    end, { desc = '[F]ormat buffer' })
  end,
}
