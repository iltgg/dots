return {
	"lervag/vimtex",
	config = function()
		vim.g.vimtex_view_method = 'zathura'
		-- vim.g.Tex_DefaultTargetFormat='pdf'
		-- vim.g.Tex_MultipleCompileFormats='pdf,bib,pdf'
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = '',
			out_dir = '',
			callback = 1,
			continuous = 1,
			executable = 'latexmk',
			hooks = {},
			options = {
				'-verbose',
				'-file-line-error',
				'-synctex=1',
				'-interaction=nonstopmode',
				'-shell-escape'
			},
		}
		-- vim.g.vimtex_log_ignore = {'/\\b(Warning)|(warning)/g'}
		vim.g.vimtex_quickfix_open_on_warning = 0
		vim.keymap.set({'n'}, '<leader>wc', "<Cmd>echo system('texcount ./document.tex')<CR>")
	end
}
