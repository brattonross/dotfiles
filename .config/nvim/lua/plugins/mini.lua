return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.bracketed").setup()
			require("mini.comment").setup()
			require("mini.statusline").setup({
				set_vim_settings = false,
				use_icons = false,
			})
			require("mini.surround").setup()
		end,
	},
}
