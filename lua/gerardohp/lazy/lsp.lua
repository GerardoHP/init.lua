return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp", -- Aseguramos que cmp esté presente
        "seblyng/roslyn.nvim",
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Función para otros servidores (Lua, Go, etc.)
        local on_attach_common = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end

        -- MAPEOS AGRESIVOS PARA C#: Funcionarán siempre en archivos .cs
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "cs",
            callback = function()
                local opts = { buffer = true, remap = false }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
            end,
        })

        require("mason").setup()
        require("mason-lspconfig").setup({
            -- IMPORTANTE: "roslyn" NO debe estar aquí
            ensure_installed = { "lua_ls", "rust_analyzer", "gopls" },
            handlers = {
                function(server_name)
                    if server_name == "roslyn" or server_name == "omnisharp" then return end
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach_common,
                    })
                end,
            },
        })

        require("roslyn").setup({
            config = {
                capabilities = capabilities,
                -- No dependemos del on_attach para los mapeos de C# ahora
                settings = {
                    ["dotnet|projects"] = { enableDefaultBinaries = true },
                },
            },
        })
    end
}
