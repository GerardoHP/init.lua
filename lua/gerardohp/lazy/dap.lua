return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "Issafalcon/neotest-dotnet",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()

            -- Configurar netcoredbg (ajustado a tu ruta de Mason)
            local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
            
            dap.adapters.coreclr = {
                type = "executable",
                command = mason_path,
                args = { "--interpreter=vscode" },
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file")
                    end,
                },
            }

            -- Atajos para depuración (F5, F9, etc.)
            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
            vim.keymap.set("n", "<F10>", dap.step_over)
            vim.keymap.set("n", "<F11>", dap.step_into)
            
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        end
    }
}
