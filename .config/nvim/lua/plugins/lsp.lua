return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                build = ":MasonUpdate",
                config = true,
            },
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                opts = {},
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
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                    })
                end,
            })

            -- Format on save (except tsserver)
            local _augroups = {}
            local get_augroup = function(client)
                if not _augroups[client.id] then
                    local group_name = "formatter-" .. client.name
                    local id = vim.api.nvim_create_augroup(group_name, { clear = true })
                    _augroups[client.id] = id
                end

                return _augroups[client.id]
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("attach_formatter", { clear = true }),
                callback = function(args)
                    local client_id = args.data.client_id
                    local client = vim.lsp.get_client_by_id(client_id)
                    local bufnr = args.buf

                    if client == nil then
                        return
                    end

                    if not client.server_capabilities.documentFormattingProvider then
                        return
                    end

                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = get_augroup(client),
                        buffer = bufnr,
                        callback = function()
                            if client.name == "tsserver" then
                                return
                            end

                            vim.lsp.buf.format({
                                async = false,
                                filter = function(c)
                                    return c.id == client.id
                                end,
                            })
                        end
                    })
                end,
            })
        end,
        event = { "BufReadPost", "BufNewFile" },
    },
}
