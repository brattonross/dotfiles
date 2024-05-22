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

			-- vim.cmd("hi StatusLine cterm=NONE ctermfg=NONE ctermbg=NONE guibg=#222222 guifg=NONE gui=NONE")
			-- vim.cmd("hi StatusLineNC cterm=NONE ctermfg=NONE ctermbg=NONE guibg=#191919 guifg=NONE gui=NONE")
			-- vim.cmd("hi MiniStatuslineModeReplace guibg=#2a2a2a")
			-- vim.cmd("hi MiniStatuslineModeCommand guibg=#2a2a2a")
			-- vim.cmd("hi MiniStatuslineModeVisual guibg=#2a2a2a")
			-- vim.cmd("hi MiniStatuslineModeNormal guibg=#2a2a2a")
			-- vim.cmd("hi MiniStatuslineModeInsert guibg=#2a2a2a")
			-- vim.cmd("hi MiniStatuslineModeOther guibg=#2a2a2a")

			require("mini.surround").setup()
		end,
	},
}
