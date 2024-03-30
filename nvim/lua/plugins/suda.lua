return {
  'lambdalisue/suda.vim',
  lazy = true,
  cmd = { 'SudaRead', 'SudaWrite' },
  init = function()
    vim.api.nvim_create_user_command('W', 'SudaWrite', { desc = 'sudo write' })
  end,
}
