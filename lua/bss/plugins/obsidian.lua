return {
	"epwalsh/obsidian.nvim",
	enabled = true,
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- ft = "markdown",
	--
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		"BufReadPre " .. vim.fn.expand("~/Vaults/Personal/") .. "*.md",
		"BufNewFile " .. vim.fn.expand("~/Vaults/Personal/") .. "*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Vaults/Personal",
			},
		},
	},
	ui = { enable = false },
}
