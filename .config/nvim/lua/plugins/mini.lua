return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.bracketed").setup()
			require("mini.comment").setup()
			require("mini.statusline").setup({
				use_icons = false,
			})
			vim.opt.laststatus = 3

			vim.cmd("hi StatusLine cterm=NONE ctermfg=NONE ctermbg=NONE guibg=#313131 guifg=NONE gui=NONE")
			vim.cmd("hi StatusLineNC cterm=NONE ctermfg=NONE ctermbg=NONE guibg=#2a2a2a guifg=NONE gui=NONE")
			vim.cmd("hi MiniStatuslineModeReplace guibg=#3a3a3a")
			vim.cmd("hi MiniStatuslineModeCommand guibg=#3a3a3a")
			vim.cmd("hi MiniStatuslineModeVisual guibg=#3a3a3a")
			vim.cmd("hi MiniStatuslineModeNormal guibg=#3a3a3a")
			vim.cmd("hi MiniStatuslineModeInsert guibg=#3a3a3a")
			vim.cmd("hi MiniStatuslineModeOther guibg=#3a3a3a")

			require("mini.surround").setup()
		end,
	},
}
