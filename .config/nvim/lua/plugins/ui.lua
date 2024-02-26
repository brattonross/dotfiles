return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.comment").setup()
			require("mini.statusline").setup({
				use_icons = false,
			})
			-- set highlight statusline
			vim.cmd("hi StatusLine cterm=NONE ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE gui=NONE")
			vim.cmd("hi StatusLineNC cterm=NONE ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE gui=NONE")

			require("mini.surround").setup()
		end,
	},
}
