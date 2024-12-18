return {
	dir = vim.fn.expand("~/Code/projects/mermaid.nvim"),
  config = function ()
    require("mermaid").setup({ })
  end
}
