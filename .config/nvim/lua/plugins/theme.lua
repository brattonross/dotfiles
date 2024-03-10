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
			vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
			vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#43484E", bg = "None" })
			vim.api.nvim_set_hl(0, "winbar", {
				fg = "#777B84",
				bg = "None",
			})
		end,
	},
}
