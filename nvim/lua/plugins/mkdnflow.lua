return {
  'jakewvincent/mkdnflow.nvim',
  config = function()
    require('mkdnflow').setup {
      perspective = { priority = 'current' },
    }
  end,
}
