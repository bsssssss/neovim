return {
	"mfussenegger/nvim-dap",

	config = function()
		local dap = require("dap")

		dap.configurations.cpp = {
			---@diagnostic disable-next-line: missing-fields
			{
				-- Change it to "cppdbg" if you have vscode-cpptools
				type = "codelldb",
				request = "launch",
				program = function()
					-- Compile and return exec name
					local filetype = vim.bo.filetype
					local filename = vim.fn.expand("%")
					local basename = vim.fn.expand("%:t:r")
					local makefile = os.execute("(ls | grep -i makefile)")
					if makefile == "makefile" or makefile == "Makefile" then
						os.execute("make debug")
					else
						if filetype == "c" then
							os.execute(string.format("gcc -g -o %s %s", basename, filename))
						else
							os.execute(string.format("g++ -g -o %s %s", basename, filename))
						end
					end
					return basename
				end,
				args = function()
					local argv = {}
					arg = vim.fn.input(string.format("argv: "))
					for a in string.gmatch(arg, "%S+") do
						table.insert(argv, a)
					end
					vim.cmd('echo ""')
					return argv
				end,
				cwd = "${workspaceFolder}",
				-- Uncomment if you want to stop at main
				-- stopAtEntry = true,
				MIMode = "gdb",
				miDebuggerPath = "/usr/bin/gdb",
				setupCommands = {
					{
						text = "-enable-pretty-printing",
						description = "enable pretty printing",
						ignoreFailures = false,
					},
				},
			},
		}
		-- You can even copy configurations
		dap.configurations.c = dap.configurations.cpp

		local function juce_host_dap()
			dap.adapters.lldb = {
				type = "executable",
				command = string.format("%s/opt/llvm/bin/lldb-dap", os.getenv("HOMEBREW_PREFIX")),
				name = "lldb",
			}

			dap.configurations.cpp = {
				{
					name = "Debug JuceHost",
					type = "lldb",
					request = "launch",
					program = os.getenv("JUCE_HOST"),
					args = {},
					cwd = vim.fn.getcwd(),
					stopOnEntry = false,
					runInTerminal = false,
				},
			}
		end

		vim.api.nvim_create_user_command("DebugPlugin", function()
			juce_host_dap()
			dap.continue()
		end, {})
	end,
}
