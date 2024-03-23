return {
  'otavioschwanck/arrow.nvim',
  opts = {
    show_icons = true,
    leader_key = '\\',
  },
  config = function(_, opts)
    require('arrow').setup(opts)
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Constant' })
  end,
}
