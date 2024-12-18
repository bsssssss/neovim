return {
	dir = vim.fn.expand("~/Code/projects/mocodo.nvim"),
  lazy = false,
	opts = {
		window = {
			border = "none",
		},
		colors = "ocean",
	},
  config = function ()
    require("mocodo").setup({})
    vim.keymap.set("n", "<leader>mcd", "<cmd>MocodoToggleView<CR>", {desc = "Mocodo: Toggle View"})
  end
}
