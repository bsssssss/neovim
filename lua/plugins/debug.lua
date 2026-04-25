return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error" })
            local dap = require("dap")

            -- stylua: ignore start
            vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "DAP: Continue" })
            vim.keymap.set("n", "<F1>", function() dap.step_over() end, { desc = "DAP: Step Over" })
            vim.keymap.set("n", "<F2>", function() dap.step_into() end, { desc = "DAP: Step Into" })
            vim.keymap.set("n", "<F3>", function() dap.step_out() end, { desc = "DAP: Step Out" })
            vim.keymap.set("n", "<F4>", function() dap.step_back() end, { desc = "DAP: Step Back" })
            vim.keymap.set("n", "<Leader>db", function() dap.toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
            vim.keymap.set("n", "<Leader>dB", function() dap.set_breakpoint() end, { desc = "DAP: Set Breakpoint" })
            vim.keymap.set("n", "<Leader>dp", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "DAP: Log Point" })
            vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "DAP: REPL" })
            vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end, { desc = "DAP: Run Last" })
            vim.keymap.set({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end, { desc = "DAP: Hover" })
            vim.keymap.set({ "n", "v" }, "<Leader>dP", function() require("dap.ui.widgets").preview() end, { desc = "DAP: Preview" })
            vim.keymap.set("n", "<Leader>df", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.frames) end, { desc = "DAP: Frame" })
            vim.keymap.set("n", "<Leader>ds", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end, { desc = "DAP: Scope" })
            vim.keymap.set("n", "<leader>dc", function() require("dap").disconnect(); require("dapui").close(); end)
            vim.keymap.set("n", "<leader>dt", function() require("dap").terminate(); require("dapui").close(); end)
            -- stylua: ignore end

            dap.adapters.lldb = {
                type = "executable",
                command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
                name = "lldb",
            }

            dap.adapters.gdb = {
                id = "gdb",
                type = "executable",
                command = "gdb",
                args = { "--quiet", "--interpreter=dap" },
            }

            dap.configurations.java = {
                {
                    name = "Debug launch (2GB)",
                    type = "java",
                    request = "launch",
                    vmArgs = "" .. "-Xmx2g",
                },
            }

            dap.configurations.c = {
                {
                    name = "Run executable (LLDB)",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
                {
                    name = "Run executable with arguments (LLDB)",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = function()
                        local arg_str = vim.fn.input("Arguments: ")
                        return vim.split(arg_str, " ")
                    end,
                },
                {
                    name = "Run executable (GDB)",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        local path = vim.fn.input({
                            prompt = "Path to executable: ",
                            default = vim.fn.getcwd() .. "/",
                            completion = "file",
                        })

                        return (path and path ~= "") and path or dap.ABORT
                    end,
                },
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "nvim-neotest/nvim-nio",
        },
        -- opts = {},
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("dapui").setup({
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.5 },
                            { id = "breakpoints", size = 0.5 / 3 },
                            { id = "stacks", size = 0.5 / 3 },
                            { id = "watches", size = 0.5 / 3 },
                        },
                        position = "left",
                        size = 40,
                    },
                    {
                        elements = {
                            { id = "repl", size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        position = "bottom",
                        size = 10,
                    },
                },
            })

            local dap, dapui = require("dap"), require("dapui")

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end

            dap.listeners.before.event_exited.dapui_config = function()
                -- dapui.close()
            end
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup({})
        end,
    },
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --     },
    --     opts = {
    --         ensure_installed = {
    --             "codelldb",
    --             "java-debug-adapter",
    --             "js-debug-adapter",
    --         },
    --         handlers = {},
    --     },
    -- },
}
