return {
  'jakewvincent/mkdnflow.nvim',
  lazy = true,
  ft = { 'markdown' },
  config = function()
    require('mkdnflow').setup {
      perspective = { priority = 'current' },
    }
  end,
}
