return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					dark = "mocha",
				},
				no_italic = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					harpoon = true,
					mason = true,
					native_lsp = {
						enabled = true,
					},
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					lsp_trouble = true,
					which_key = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"sainnhe/everforest",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_better_performance = true
			vim.g.everforest_cursor = "green"
			vim.g.everforest_diagnostic_virtual_text = "colored"
			vim.g.everforest_disable_italic_comment = true

			vim.cmd.colorscheme("everforest")
			vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#d3c6aa", bg = "#272e33" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#859289", bg = "#272e33" })
			vim.api.nvim_set_hl(0, "Visual", { bg = "#3e4452" })
		end,
	},
	{
		"neanias/everforest-nvim",
		enabled = false,
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",
				transparent_background_level = 2,
				disable_italic_comments = true,
				italics = false,
			})

			vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
