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
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_better_performance = true
			vim.g.everforest_cursor = "green"
			vim.g.everforest_diagnostic_virtual_text = "colored"
			vim.g.everforest_disable_italic_comment = true
			vim.g.everforest_enable_italic = false
			vim.g.everforest_float_style = "dim"
			vim.g.everforest_ui_contrast = "high"

			vim.cmd.colorscheme("everforest")
			vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#d3c6aa", bg = "#272e33" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#859289", bg = "#272e33" })
			vim.api.nvim_set_hl(0, "Visual", { bg = "#3e4452" })
		end,
	},
	{
		"savq/melange-nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("melange")
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("oxocarbon")
		end,
	},
	{
		"mcchrish/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.forestbones = {
				italic_comments = false,
				lighten_cursor_line = 10,
				solid_float_border = true,
				transparent_background = true,
			}

			vim.cmd([[autocmd ColorScheme * highlight! link Number Normal]])
			vim.cmd([[autocmd ColorScheme * highlight! link Conceal Normal]])
			vim.cmd([[autocmd ColorScheme * highlight! link SpecialKey Normal]])
			vim.cmd([[autocmd ColorScheme * highlight! link TSKeyword Normal]])
			vim.cmd([[autocmd ColorScheme * highlight! link Constant Normal]])
			vim.cmd([[autocmd ColorScheme * highlight! link TelescopeSelection Visual]])
			vim.cmd([[autocmd ColorScheme * highlight! link TelescopeSelectionCaret Visual]])

			vim.cmd.colorscheme("forestbones")
			vim.api.nvim_set_hl(0, "Search", { fg = "#EEEEEC", bg = "#2A2A28" })
			vim.api.nvim_set_hl(0, "Pmenu", { fg = "#EEEEEC", bg = "#212220" })
			vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#EEEEEC", bg = "#282A28" })
			vim.api.nvim_set_hl(0, "PmenuSbar", { fg = "#EEEEEC", bg = "#282A28" })
			vim.api.nvim_set_hl(0, "PmenuThumb", { fg = "#AFB5AD", bg = "#2F312E" })
			vim.api.nvim_set_hl(0, "NonText", { fg = "#494844" })
			vim.api.nvim_set_hl(0, "Comment", { fg = "#7C7B74" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#6F6D66" })
			vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#ECEEEC", bg = "#2A2A28" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#3A3A3A", bg = "#2A2A28" })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2A2A28" })
			vim.api.nvim_set_hl(0, "Visual", { fg = "#eceeec", bg = "#2F312E" })
			vim.api.nvim_set_hl(0, "Statement", { fg = "#FFC53D", bold = true })
			vim.api.nvim_set_hl(0, "PreProc", { fg = "#B5B3AD" })
			vim.api.nvim_set_hl(0, "Type", { fg = "#B5B3AD" })
			vim.api.nvim_set_hl(0, "Special", { fg = "#FFE7B3" })
			vim.api.nvim_set_hl(0, "Identifier", { fg = "#EEEEEC" })
			vim.api.nvim_set_hl(0, "Constant", { fg = "#E3F7BA" })
			vim.api.nvim_set_hl(0, "Structure", { fg = "#EEEEEC", bold = true })
			vim.api.nvim_set_hl(0, "IncSearch", { bg = "#FFC53D", fg = "#282A28", bold = true })
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
	{
		"navarasu/onedark.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "warm",
				transparent = true,
				code_style = {
					comments = "none",
				},
			})
			vim.cmd("colorscheme onedark")
		end,
	},
}
