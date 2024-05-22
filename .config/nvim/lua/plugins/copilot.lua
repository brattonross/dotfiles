return {
	{
		-- "github/copilot.vim",
		"zbirenbaum/copilot.lua",
		enabled = false,
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
		enabled = false,
		event = { "InsertEnter" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
