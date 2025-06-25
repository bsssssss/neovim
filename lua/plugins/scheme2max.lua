return {
	-- dir = "/Users/bss/Code/projects/nvim-s4m/scheme2max.nvim",
	"bsssssss/scheme2max.nvim",
  lazy = true,
	dependencies = "davidgranstrom/osc.nvim",
	config = function()
		require("scheme2max").setup({})
	end,
}
