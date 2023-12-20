return {
	{
		"folke/which-key.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"akinsho/toggleterm.nvim",
		enabled = false,
		config = function()
			require("toggleterm").setup({
				insert_mappings = false,
				open_mapping = [[<leader>tt]],
				shading_factor = 0,
				size = 20,
				terminal_mappings = false,
				winbar = {
					enabled = false,
				},
			})
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		enabled = false,
		event = "VeryLazy",
	},
	{
		"alexghergh/nvim-tmux-navigation",
		opts = {},
		lazy = false,
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
		}
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
