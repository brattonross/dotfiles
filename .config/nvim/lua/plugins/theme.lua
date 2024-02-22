return {
	{
		"rose-pine/nvim",
		enabled = false,
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				styles = {
					italic = false,
					transparency = true,
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"ramojus/mellifluous.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("mellifluous").setup({
				styles = {
					comments = {
						italic = false,
					},
				},
				transparent_background = {
					enabled = true,
				},
			})
			vim.cmd.colorscheme("mellifluous")
		end,
	},
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
