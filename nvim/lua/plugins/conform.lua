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
    },
    formatters = {
      prettierd = {
        options = {
          ft_parsers = {
            -- javascript = "babel",
            -- javascriptreact = "babel",
            -- typescript = "typescript",
            -- typescriptreact = "typescript",
            -- vue = "vue",
            -- css = "css",
            -- scss = "scss",
            -- less = "less",
            -- html = "html",
            json = 'json',
            -- jsonc = "json",
            -- yaml = "yaml",
            -- markdown = "markdown",
            -- ["markdown.mdx"] = "mdx",
            -- graphql = "graphql",
            -- handlebars = "glimmer",
          },
        },
      },
    },
  },
  init = function()
    vim.keymap.set('n', '<leader>f', function()
      require('conform').format()
    end, { desc = '[F]ormat buffer' })
  end,
}
