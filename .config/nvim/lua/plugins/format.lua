return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					astro = { { "biome", "prettierd", "prettier" } },
					css = { { "biome", "prettierd", "prettier" } },
					go = { { "gofmt" } },
					html = { { "prettierd", "prettier" } },
					javascript = { { "biome", "prettierd", "prettier" } },
					javascriptreact = { { "biome", "prettierd", "prettier" } },
					json = { { "biome", "prettierd", "prettier" } },
					jsonc = { { "biome", "prettierd", "prettier" } },
					lua = { "stylua" },
					markdown = { { "prettierd", "prettier" } },
					templ = { "rustywind" },
					template = { "rustywind" },
					typescript = { { "biome", "prettierd", "prettier" } },
					typescriptreact = { { "biome", "prettierd", "prettier" } },
					yaml = { { "prettierd", "prettier" } },
				},
				format_on_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return {
						timeout_ms = 2000,
						lsp_fallback = true,
					}
				end,
			})

			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})
			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
			})

			local util = require("conform.util")

			require("conform.formatters.biome").cwd = require("conform.util").root_file({ "biome.json" })
			require("conform.formatters.biome").condition = function(self, ctx)
				return util.root_file({ "biome.json" })(self, ctx) ~= nil
			end

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
}
