-- ftplugin/java.lua: call start_or_attach when a Java file is loaded
require("jdtls").start_or_attach({
	cmd = {
		vim.fn.expand("$HOME/.local/share/nvim/mason/bin/jdtls"),
	},
})
