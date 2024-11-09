return {
	{
		"mrhh69/nvim-kitty",
		config = function()
			vim.filetype.add({
				filename = {
					["kitty.conf"] = "kitty",
				},
				pattern = {
					[".*%.[sS]"] = "asm6502",
					[".*/kitty/.*%.conf"] = "kitty",
				},
			})
		end,
	},
	{
		"knubie/vim-kitty-navigator",
		config = function()
			vim.g.kitty_navigator_no_mappings = 1
			vim.keymap.set("n", "<C-`>h", "KittyNavigateLeft<CR>")
			vim.keymap.set("n", "<C-`>j", "KittyNavigateDown<CR>")
			vim.keymap.set("n", "<C-`>k", "KittyNavigateUp<CR>")
			vim.keymap.set("n", "<C-`>l", "KittyNavigateRight<CR>")
		end,
	},
}
