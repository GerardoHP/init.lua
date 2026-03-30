return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "ramboe/dap-dll-autopicker", -- Elige automáticamente el archivo DLL a depurar [23, 24]
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Configuración adaptadora para .NET [5, 25]
        dap.adapters.coreclr = {
            type = 'executable',
            command = 'netcoredbg',
            args = {'--interpreter=vscode'}
        }

        -- Interfaz gráfica minimalista (solo muestra las variables locales) [26, 27]
        dapui.setup({
            layouts = {
                {
                    elements = { { id = "scopes", size = 1.0 } }, -- Solo variables locales [27]
                    size = 15, -- 15 líneas de altura [27]
                    position = "bottom",
                }
            },
            controls = { enabled = false } -- Oculta los controles de reproducción visuales [28]
        })

        -- Abrir UI al iniciar depuración [29]
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    end
}
