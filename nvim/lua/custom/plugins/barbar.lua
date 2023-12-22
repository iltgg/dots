return {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
		-- local map = vim.api.nvim_set_keymap
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }
		-- Move to previous/next
		map({ 'n', 'i' }, '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
		map({ 'n', 'i' }, '<A-.>', '<Cmd>BufferNext<CR>', opts)
		-- Re-order to previous/next
		map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
		map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

		map('n', '<A-x>', '<Cmd>BufferClose<CR>', opts)
		map('n', '<A-c>', '<Cmd>write<CR><Cmd>BufferClose<CR>', opts)

		map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

		vim.api.nvim_create_user_command('Q', function()
			vim.cmd.write()
			vim.cmd.BufferClose()
		end, {})
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
	version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
