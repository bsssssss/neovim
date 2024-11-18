-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw", ".root" }, { upward = true })[1])
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
	cmd = {
		vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls"),
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	settings = {
		java = {
			-- eclipse = {
			-- 	downloadSources = true,
			-- },
		},
	},
}

-- print("Java root directory: " .. config.root_dir)
require("jdtls").start_or_attach(config)
