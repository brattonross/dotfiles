return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate",
				opts = {
					ui = {
						border = "single",
					},
				},
			},
			{
				"williamboman/mason-lspconfig.nvim",
			},
			{
				"j-hui/fidget.nvim",
				tag = "legacy",
				event = "LspAttach",
				opts = {
					window = {
						blend = 0,
					},
				},
			},
			{
				"folke/neodev.nvim",
				config = true,
			},
		},
		config = function()
			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("gr", "<cmd>Telescope lsp_references<cr>", "[G]oto [R]eferences")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", "[D]ocument [S]ymbols")
				nmap("<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "[W]orkspace [S]ymbols")

				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")

				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				-- vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
				-- 	vim.lsp.buf.format()
				-- end, { desc = "Format current buffer with LSP" })
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local mason_lspconfig = require("mason-lspconfig")
			local servers = {
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			}

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			mason_lspconfig.setup_handlers({
				["biome"] = function()
					require("lspconfig")["biome"].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						root_dir = require("lspconfig").util.root_pattern("biome.json"),
						single_file_support = false,
					})
				end,
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					})
				end,
			})

			-- Single border around LSP floating windows
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
			})
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup({
				flags = {
					build = true,
					noEmit = true,
					project = function()
						return require("tsc.utils").find_nearest_tsconfig()
					end,
					-- project = false,
				},
			})
		end,
		keys = {
			{
				"<leader>tc",
				"<cmd>TSC<cr>",
				"[T]ype [C]heck",
			},
		},
	},
}
