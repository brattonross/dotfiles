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
	{
		"tpope/vim-sleuth",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("todo-comments").setup({
				signs = false,
			})
		end,
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
		},
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = true,
			},
		},
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				modules = {},
				sync_install = false,
				ignore_install = {},
				ensure_installed = {
					"lua",
					"tsx",
					"typescript",
					"vimdoc",
					"vim",
					"css",
					"astro",
					"go",
					"rust",
					"ocaml",
					"html",
					"templ",
				},
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<M-space>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})

			local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

			parser_configs.templ = {
				install_info = {
					url = "https://github.com/vrischmann/tree-sitter-templ.git",
					files = { "src/parser.c", "src/scanner.c" },
					branch = "master",
				},
			}

			vim.treesitter.language.register("templ", "templ")
		end,
	},
	{
		"echasnovski/mini.comment",
		config = function()
			require("mini.comment").setup()
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			luasnip.config.setup({})

			cmp.setup({
				enabled = true,
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-y>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = {
					{ name = "cody" },
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
			})
		end,
		event = "InsertEnter",
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					astro = { { "prettierd", "prettier" } },
					css = { { "prettierd", "prettier" } },
					go = { { "gofmt" } },
					html = { { "prettierd", "prettier" } },
					javascript = { { "biome", "prettierd", "prettier" } },
					javascriptreact = { { "biome", "prettierd", "prettier" } },
					json = { { "biome", "prettierd", "prettier" } },
					lua = { "stylua" },
					markdown = { { "prettierd", "prettier" } },
					templ = { "rustywind" },
					typescript = { { "biome", "prettierd", "prettier" } },
					typescriptreact = { { "biome", "prettierd", "prettier" } },
					yaml = { { "prettierd", "prettier" } },
				},
				format_on_save = {
					timeout_ms = 2000,
					lsp_fallback = true,
				},
			})

			local util = require("conform.util")

			require("conform.formatters.biome").cwd = require("conform.util").root_file({ "biome.json" })
			require("conform.formatters.biome").condition = function(self, ctx)
				return util.root_file({ "biome.json" })(self, ctx) ~= nil
			end

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({
						bufnr = args.buf,
						timeout_ms = 2000,
						-- lsp_fallback = true,
					})
				end,
			})
			vim.api.nvim_create_user_command("Format", function()
				local result = require("conform").format({
					timeout_ms = 2000,
					-- lsp_fallback = true,
				})
				if result == nil then
					vim.notify("No formatter found for this filetype", vim.log.levels.WARN)
				end
			end, {
				desc = "Format current buffer",
			})
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
		keys = {
			{
				"<leader>ra",
				"<cmd>lua require('spectre').toggle()<cr>",
				desc = "[R]epalce [A]ll",
			},
		},
	},
}
