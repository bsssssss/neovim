return {
	"sainnhe/edge",
	priority = 1000,
	config = function()
		vim.g.edge_style = "neon"
		vim.cmd.colorscheme("edge")
	end,
}
