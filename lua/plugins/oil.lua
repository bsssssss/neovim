return {
	"stevearc/oil.nvim",
	enabled = true,
	lazy = false,
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
