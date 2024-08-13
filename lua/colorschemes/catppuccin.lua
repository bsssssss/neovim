return {
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			styles = {
				comments = {},
				conditionals = {},
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
