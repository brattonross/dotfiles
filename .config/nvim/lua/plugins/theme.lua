return {
	{
		"andreypopp/vim-colors-plain",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("plain")

			-- Set nvim colors
			vim.cmd("highlight NormalFloat guibg=none ctermbg=none")
			vim.cmd("highlight WinBarNC  guibg=none ctermbg=none")
		end,
	},
}
