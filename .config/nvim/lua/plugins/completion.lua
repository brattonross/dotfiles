return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			-- cmdline = {
			-- 	sources = {},
			-- },
			completion = {
				accept = {
					auto_brackets = {
						enabled = false,
					},
				},
			},
			keymap = { preset = "default" },
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
}
