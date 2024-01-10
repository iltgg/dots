return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    -- setting globals after init doesn't change plugin behaviour
    -- if nvim is called with NVIM_MD_AUTO=true then the plugin will load in "wiki" mode
    if os.getenv 'NVIM_MD_AUTO' == 'true' then
      print 'here'
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_combine_preview = 1
    end
  end,
  ft = { 'markdown' },
}
