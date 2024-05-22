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
			{
				"nvim-telescope/telescope-smart-history.nvim",
				dependencies = {
					"kkharji/sqlite.lua",
				},
			},
		},
		config = function()
			local telescope_config = require("telescope.config")
			local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

			table.insert(vimgrep_arguments, "--hidden")
			table.insert(vimgrep_arguments, "--glob")
			table.insert(vimgrep_arguments, "!**/{.git,.sl,node_modules}}")

			local data = assert(vim.fn.stdpath("data")) --[[@as string]]

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
					vimgrep_arguments = vimgrep_arguments,
				},
				extensions = {
					history = {
						path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
						limit = 100,
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					find_files = {
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob",
							"!**/{.git,.sl,node_modules}",
						},
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")
			require("telescope").load_extension("smart_history")
			require("telescope").load_extension("ui-select")
		end,
		keys = {
			{
				"<leader>?",
				"<cmd>Telescope oldfiles<cr>",
				desc = "[?] Find recently opened files",
			},
			{
				"<leader><space>",
				"<cmd>Telescope buffers<cr>",
				desc = "[ ] Find existing buffers",
			},
			{
				"<leader>/",
				"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
				desc = "[/] Fuzzy search in current buffer",
			},
			{
				"<leader>s/",
				"<cmd>lua require('telescope.builtin').live_grep({ grep_open_files = true, prompt_title = 'Live Grep in Open Files' })<cr>",
				desc = "Live grep in open files",
			},
			{
				"<leader>sf",
				"<cmd>Telescope find_files<cr>",
				desc = "[S]earch [F]iles",
			},
			{
				"<leader>sh",
				"<cmd>Telescope help_tags<cr>",
				desc = "[S]earch [H]elp",
			},
			{
				"<leader>si",
				"<cmd>Telescope highlights<cr>",
				desc = "[S]earch H[i]ghlights",
			},
			{
				"<leader>sw",
				"<cmd>Telescope grep_string<cr>",
				desc = "[S]earch current [W]ord",
			},
			{
				"<leader>sg",
				"<cmd>Telescope live_grep<cr>",
				desc = "[S]earch by [G]rep",
			},
			{
				"<leader>sd",
				"<cmd>Telescope diagnostics<cr>",
				desc = "[S]earch [D]iagnostics",
			},
			{
				"<leader>sc",
				"<cmd>Telescope commands<cr>",
				desc = "[S]earch [C]ommands",
			},
			{
				"<leader>sk",
				"<cmd>Telescope keymaps<cr>",
				desc = "[S]earch [K]eymaps",
			},
			{
				"<leader>sr",
				"<cmd>Telescope resume<cr>",
				desc = "[S]earch [R]esume",
			},
			{
				"<leader>gs",
				"<cmd>Telescope git_status<cr>",
				desc = "[G]it [S]tatus",
			},
			{
				"<leader>gc",
				"<cmd>Telescope git_commits<cr>",
				desc = "[G]it [C]ommits",
			},
			{
				"<leader>gb",
				"<cmd>Telescope git_branches<cr>",
				desc = "[G]it [B]ranches",
			},
			{
				"<leader>gf",
				"<cmd>Telescope git_bcommits<cr>",
				desc = "[G]it [F]ile History",
			},
			{
				"<leader>gS",
				"<cmd>Telescope git_stash<cr>",
				desc = "[G]it [S]tash",
			},
		},
		event = "VeryLazy",
	},
}
