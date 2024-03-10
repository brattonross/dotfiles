return {
	{
		"ThePrimeagen/harpoon",
		enable = false,
		keys = {
			{
				"<leader>1",
				"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
				desc = "Navigate to Harpoon file [1]",
			},
			{
				"<leader>2",
				"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
				desc = "Navigate to Harpoon file [2]",
			},
			{
				"<leader>3",
				"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
				desc = "Navigate to Harpoon file [3]",
			},
			{
				"<leader>4",
				"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
				desc = "Navigate to Harpoon file [4]",
			},
			{
				"<leader>m",
				"<cmd>lua require('harpoon.mark').add_file()<cr>",
				desc = "[M]ark file with Harpoon",
			},
			{
				"<C->",
				"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
				desc = "[C-e] Toggle Harpoon quick menu",
			},
		},
		event = { "BufReadPost", "BufNewFile" },
	},
}
