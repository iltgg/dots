return {
  'j-morano/buffer_manager.nvim',
  event = 'BufEnter',
  opts = {
    height = 20,
    highlight = 'Normal:BufferManagerBorder',
    win_extra_options = {
      winhighlight = 'Normal:BufferManagerNormal',
    },
    select_menu_item_commands = {
      v = {
        key = 'v',
        command = 'vsplit',
      },
      h = {
        key = 'h',
        command = 'split',
      },
    },
    focus_alternate_buffer = false,
    short_file_names = false,
    short_term_names = false,
    loop_nav = false,
  },
  config = function(_, opts)
    require('buffer_manager').setup(opts)
    vim.api.nvim_set_hl(0, 'BufferManagerModified', { fg = '#D19A66' })

    local map_opts = { noremap = true }
    local map = vim.keymap.set
    -- Navigate buffers bypassing the menu
    local bmui = require 'buffer_manager.ui'
    local keys = '1234567890'
    for i = 1, #keys do
      local key = keys:sub(i, i)
      map('n', string.format('<M-%s>', key), function()
        bmui.nav_file(i)
      end, map_opts)
    end
    -- Just the menu
    map({ 't', 'n' }, '<M-m>', bmui.toggle_quick_menu, map_opts)
    -- Open menu and search
    map({ 't', 'n' }, '<M-/>', function()
      bmui.toggle_quick_menu()
      -- wait for the menu to open
      vim.defer_fn(function()
        vim.fn.feedkeys '/'
      end, 50)
    end, map_opts)
    -- Next/Prev
    map('n', '<M-k>', bmui.nav_next, map_opts)
    map('n', '<M-j>', bmui.nav_prev, map_opts)
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
