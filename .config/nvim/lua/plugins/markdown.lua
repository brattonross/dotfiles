return {
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		cmd = {
			"MarkdownPreviewToggle",
			"MarkdownPreview",
			"MarkdownPreviewStop",
		},
	},
	{
		"brattonross/standup.nvim",
		-- dir = "~/personal/standup.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>nc",
				"<cmd>lua require('standup').current()<cr>",
				desc = "[N]ote [C]urrent",
			},
			{
				"<leader>nn",
				"<cmd>lua require('standup').next()<cr>",
				desc = "[N]ote [N]ext",
			},
			{
				"<leader>np",
				"<cmd>lua require('standup').previous()<cr>",
				desc = "[N]ote [P]revious",
			},
		},
	},
}
