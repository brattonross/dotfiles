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
}
