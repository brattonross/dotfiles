return {
	{
		"gleam-lang/gleam.vim",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "gleam",
				callback = function()
					vim.lsp.start({
						name = "gleam",
						cmd = { "gleam", "lsp" },
						root_dir = vim.fs.dirname(vim.fs.find({ "gleam.toml" }, { upward = true })[1]),
					})
				end,
			})
		end,
	},
}
