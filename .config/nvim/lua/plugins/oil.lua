return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["gl"] = "actions.refresh",
				["<M-h>"] = "actions.select_split",
			},
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
		},
		event = "VeryLazy",
		keys = {
			{
				"-",
				"<cmd>Oil<cr>",
				{
					desc = "Open parent directory",
				},
			},
		},
	},
}
