return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters = {
					biome = {
						require_cwd = true,
					},
					prettierd = {
						require_cwd = true,
					},
				},
				formatters_by_ft = {
					astro = {
						"biome",
						"prettierd",
						stop_after_first = true,
					},
					css = { "biome", "prettierd", stop_after_first = true },
					gleam = { "gleam", "rustywind" },
					go = { "gofmt" },
					html = { "biome" },
					javascript = { "biome", "prettierd", stop_after_first = true },
					javascriptreact = { "biome", "prettierd", stop_after_first = true },
					json = { "biome", "prettierd", stop_after_first = true },
					jsonc = { "biome", "prettierd", stop_after_first = true },
					lua = { "stylua" },
					markdown = { "prettierd" },
					templ = { "templ", "rustywind" },
					template = { "rustywind" },
					typescript = { "biome", "prettierd", stop_after_first = true },
					typescriptreact = { "biome", "prettierd", stop_after_first = true },
					yaml = { "prettierd" },
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

			vim.api.nvim_create_user_command("Format", function()
				local result = require("conform").format({
					timeout_ms = 2000,
					lsp_fallback = true,
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
