return {
	{
		"nvim-lualine/lualine.nvim",
		enabled = true,
		config = function()
			local theme = require("lualine.themes.gruvbox-material")
			theme.normal.a.bg = "#B5B3AD"
			theme.normal.b.bg = "#3B3A37"
			theme.normal.c.bg = "#2A2A28"
			theme.insert.a.bg = "#FFC53D"
			theme.visual.a.bg = "#B1A9FF"
			theme.command.a.bg = "#FF801F"

			require("lualine").setup({
				options = {
					icons_enabled = false,
					-- theme = theme,
					component_separators = "|",
					section_separators = "",
				},
			})
		end,
		event = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		opts = {
			show_end_of_line = true,
			space_char_blankline = " ",
		},
		lazy = false,
	},
	{
		"folke/trouble.nvim",
		enabled = false,
		options = {
			icons = false,
		},
		cmd = { "TroubleToggle", "Trouble" },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						vim.cmd.cprev()
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						vim.cmd.cnext()
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"xiyaowong/transparent.nvim",
		enabled = false,
		opts = {
			extra_groups = {
				"NormalFloat",
				"FloatBorder",
				"CursorLine",
			},
		},
	},
}
