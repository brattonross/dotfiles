return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"tpope/vim-rhubarb",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
					change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
					delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr" },
					topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr" },
					changedelete = { hl = "GitSignsDelete", text = "~", numhl = "GitSignsChangeNr" },
				},
				signcolumn = false,
				numhl = true,
			})
		end,
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{
				"<leader>tb",
				":lua require('gitsigns').toggle_current_line_blame()<CR>",
				desc = "[T]oggle [B]lame",
			},
		},
	},
}
