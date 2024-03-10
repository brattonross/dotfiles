return {
	{
		-- "github/copilot.vim",
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
					auto_trigger = true,
					keymap = {
						accept = "<C-j>",
					},
				},
				filetypes = {
					gitcommit = true,
					markdown = true,
					yaml = true,
				},
				panel = {
					enabled = false,
				},
			})
		end,
		event = "InsertEnter",
	},
	{
		"zbirenbaum/copilot-cmp",
		event = { "InsertEnter" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
