return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.fn.sign_define("DapBreakpoint", { text = "〇", texthl = "Comment" })
			local dap = require("dap")

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end, { desc = "DAP: Continue" })

			vim.keymap.set("n", "<F1>", function()
				dap.step_over()
			end, { desc = "DAP: Step Over" })

			vim.keymap.set("n", "<F2>", function()
				dap.step_into()
			end, { desc = "DAP: Step Into" })

			vim.keymap.set("n", "<F3>", function()
				dap.step_out()
			end, { desc = "DAP: Step Out" })

			vim.keymap.set("n", "<F4>", function()
				dap.step_back()
			end, { desc = "DAP: Step Back" })

			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "DAP: Toggle Breakpoint" })

			vim.keymap.set("n", "<Leader>B", function()
				dap.set_breakpoint()
			end, { desc = "DAP: Set Breakpoint" })

			vim.keymap.set("n", "<Leader>lp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "DAP: Log Point" })

			vim.keymap.set("n", "<Leader>dr", function()
				dap.repl.open()
			end, { desc = "DAP: Open" })

			vim.keymap.set("n", "<Leader>dl", function()
				dap.run_last()
			end, { desc = "DAP: Run Last" })

			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "DAP: Hover" })

			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "DAP: Preview" })

			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end, { desc = "DAP: Frame" })

			vim.keymap.set("n", "<Leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end, { desc = "DAP: Scope" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
