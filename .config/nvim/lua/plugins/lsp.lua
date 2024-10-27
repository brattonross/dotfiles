return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Single border around LSP floating windows
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
			})

			require("lspconfig.ui.windows").default_options.border = "rounded"
		end,
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{
				"gd",
				"<cmd>lua require('telescope.builtin').lsp_definitions()<cr>",
				desc = "Goto Definition",
			},
			{
				"gr",
				"<cmd>lua require('telescope.builtin').lsp_references()<cr>",
				desc = "Goto References",
			},
			{
				"gI",
				"<cmd>lua require('telescope.builtin').lsp_implementations()<cr>",
				desc = "Goto Implementation",
			},
			{
				"<leader>D",
				"<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>",
				desc = "Type Definition",
			},
			{
				"<leader>ds",
				"<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
				desc = "Document Symbols",
			},
			{
				"<leader>ws",
				"<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>",
				desc = "Workspace Symbols",
			},
			{
				"<leader>rn",
				"<cmd>lua vim.lsp.buf.rename()<cr>",
				desc = "Rename",
			},
			{
				"<leader>ca",
				"<cmd>lua vim.lsp.buf.code_action()<cr>",
				desc = "Code Action",
			},
			{
				"K",
				"<cmd>lua vim.lsp.buf.hover()<cr>",
				desc = "Hover Documentation",
			},
			{
				"gD",
				"<cmd>lua vim.lsp.buf.declaration()<cr>",
				desc = "Goto Declaration",
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		tag = "legacy",
		event = "LspAttach",
		opts = {
			window = {
				blend = 0,
			},
		},
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					border = "single",
				},
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local mason_lspconfig = require("mason-lspconfig")
			local servers = {
				lua_ls = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = { enable = false },
					},
				},
			}

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					["biome"] = function()
						require("lspconfig")["biome"].setup({
							capabilities = capabilities,
							root_dir = require("lspconfig").util.root_pattern("biome.json"),
							single_file_support = false,
						})
					end,
					["gopls"] = function()
						require("lspconfig")["gopls"].setup({
							capabilities = capabilities,
							settings = {
								gopls = {
									staticcheck = true,
								},
							},
						})
					end,
					function(server_name)
						if server_name == "tsserver" then
							server_name = "ts_ls"
						end
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
							settings = servers[server_name],
							filetypes = (servers[server_name] or {}).filetypes,
						})
					end,
				},
			})
		end,
	},
}
