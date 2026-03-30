return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                cs = { "csharpier" }, -- Formateo de C# [19]
                -- Para Razor, conform usará html-lsp como fallback automático [3, 20]
            },
            formatters = {
                csharpier = {
                    command = "csharpier",
                    args = { "--write-stdout" }, -- Usa standard in/out para modificar el buffer [21]
                }
            }
        })
        -- Opcional: tu atajo de teclado, ej: vim.keymap.set("n", "<leader>fm", require("conform").format) [20]
    end
}
