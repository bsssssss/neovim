return {
  enabled = false,
	dir = vim.fn.expand("~/Code/projects/neovim-plugins/mermaid.nvim"),
  config = function ()
    require("mermaid").setup({ })
  end
}
