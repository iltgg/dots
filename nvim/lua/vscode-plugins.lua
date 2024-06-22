-- disables most plugins
require('lazy').setup({
  {
    'jinh0/eyeliner.nvim',
    event = 'BufEnter',
    opts = {
      highlight_on_key = true,
      dim = true,
    },
    config = function(_, opts)
      require('eyeliner').setup(opts)
      vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = '#e06c75', bold = true })
      vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = '#56b6c2', bold = true })
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}, {})
