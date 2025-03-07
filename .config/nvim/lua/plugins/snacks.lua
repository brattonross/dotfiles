return {
	"folke/snacks.nvim",
	enabled = true,
	priority = 1000,
	lazy = false,
	opts = {
		git = { enabled = true },
		rename = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>tb",
			function()
				Snacks.git.blame_line()
			end,
		},
		{
			"<leader>fn",
			function()
				Snacks.rename.rename_file()
			end,
		},
	},
}
