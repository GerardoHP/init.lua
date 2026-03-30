return {
    "seblyng/roslyn.nvim", -- Plugin para integrar Roslyn [13]
    ft = { "cs", "razor" }, -- Cargar solo en archivos .NET
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("roslyn").setup({
            -- La configuración por defecto es suficiente si tienes Mason configurado correctamente [8, 14].
            -- Esto habilitará soporte rápido para ir a la definición y advertencias oficiales [15, 16].
        })
    end
}
