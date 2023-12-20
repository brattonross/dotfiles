return {
	{
		-- "github/copilot.vim",
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
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
			})
		end,
		event = "InsertEnter",
	},
	{
		"sourcegraph/sg.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
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
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"echasnovski/mini.surround",
		enabled = false,
		config = function()
			require("mini.surround").setup()
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"echasnovski/mini.comment",
		config = function()
			require("mini.comment").setup()
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"echasnovski/mini.misc",
		enabled = false,
		version = false,
		config = function()
			local MiniMisc = require("mini.misc")
			MiniMisc.setup()
			MiniMisc.setup_auto_root({
				".git",
			})
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
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = {
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
					javascript = { { "prettierd", "prettier" }, "biome" },
					javascriptreact = { { "prettierd", "prettier" }, "biome" },
					json = { { "prettierd", "prettier" }, "biome" },
					lua = { "stylua" },
					markdown = { { "prettierd", "prettier" } },
					templ = { "rustywind" },
					typescript = { { "prettierd", "prettier" }, "biome" },
					typescriptreact = { { "prettierd", "prettier" }, "biome" },
					yaml = { { "prettierd", "prettier" } },
				},
			})

			local util = require("conform.util")

			require("conform.formatters.biome").cwd = require("conform.util").root_file({ "biome.json" })
			require("conform.formatters.biome").condition = function(self, ctx)
				return util.root_file({ "biome.json" })(self, ctx) ~= nil
			end

			require("conform.formatters.prettier").condition = function(self, ctx)
				return util.root_file({
					".prettierrc",
					".prettierrc.json",
					".prettierrc.js",
					".prettierrc.cjs",
					"prettier.config.js",
					"prettier.config.cjs",
				})(self, ctx) ~= nil
			end

			require("conform.formatters.prettierd").condition = function(self, ctx)
				return util.root_file({
					".prettierrc",
					".prettierrc.json",
					".prettierrc.js",
					".prettierrc.cjs",
					"prettier.config.js",
					"prettier.config.cjs",
				})(self, ctx) ~= nil
			end

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({
						bufnr = args.buf,
						timeout_ms = 2000,
						lsp_fallback = "always",
					})
				end,
			})
			vim.api.nvim_create_user_command("Format", function()
				local result = require("conform").format({
					timeout_ms = 2000,
					lsp_fallback = "always",
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
}
