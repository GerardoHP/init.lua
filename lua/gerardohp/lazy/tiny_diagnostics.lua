return {
    "rachartier/tiny-inline-diagnostic.nvim", -- Plugin de diagnósticos en línea [31]
    event = "VeryLazy",
    config = function()
        require('tiny-inline-diagnostic').setup()
        -- Te proveerá de una interfaz limpia sin inundar tu código de texto [32]
    end
}
