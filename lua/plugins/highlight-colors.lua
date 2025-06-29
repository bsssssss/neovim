return {
	"bsssssss/nvim-highlight-colors",
  branch = "fix/hex-pattern-dash-boundary",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "virtual",
			virtual_symbol = "●",
			virtual_symbol_prefix = "",
			virtual_symbol_suffix = "",
			virtual_symbol_position = "eol",
		})
	end,
}
