return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-frecency.nvim",
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = require("telescope.themes").get_ivy({}),
				extensions = {
					fzf = {},
					["ui-select"] = {
						require("telescope.themes").get_ivy({}),
					},
				},
			})

			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "ui-select")
			pcall(telescope.load_extension, "frecency")

			vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles)
			vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers)
			vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files)
			vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags)
			vim.keymap.set("n", "<leader>si", require("telescope.builtin").highlights)
			vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string)
			vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep)
			vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps)
			vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume)
			vim.keymap.set("n", "<leader>sn", function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end)
		end,
		event = "VeryLazy",
	},
}
