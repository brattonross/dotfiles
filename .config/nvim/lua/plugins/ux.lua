return {
	{
		"folke/which-key.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"alexghergh/nvim-tmux-navigation",
		opts = {},
		event = "VeryLazy",
		keys = {
			{
				"<C-h>",
				"<Cmd>NvimTmuxNavigateLeft<CR>",
			},
			{
				"<C-j>",
				"<Cmd>NvimTmuxNavigateDown<CR>",
			},
			{
				"<C-k>",
				"<Cmd>NvimTmuxNavigateUp<CR>",
			},
			{
				"<C-l>",
				"<Cmd>NvimTmuxNavigateRight<CR>",
			},
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		enabled = false,
		config = function()
			require("colorizer").setup({
				filetypes = { "*", "!TelescopeResults" },
			})
		end,
		event = { "BufRead", "BufNewFile" },
	},
}
