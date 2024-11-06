return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			styles = {
				bold = true,
				italic = true,
			},
			highlight_groups = {
				CurSearch = { fg = "base", bg = "leaf", inherit = false },
				Search = { fg = "Normal", bg = "leaf", blend = 25, inherit = false },

				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },

				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "base" },
				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

				["@keyword.return.java"] = { fg = "#8985D4" },
				["@keyword.exception.java"] = { fg = "#8985D4" },

				["@tag.html"] = { fg = "pine" },
				["@lsp.type.modifier.java"] = { fg = "pine" },
				["@type.builtin.java"] = { fg = "pine" },
				["@lsp.type.class.java"] = { fg = "leaf" },
			},
		})
		vim.cmd("colorscheme rose-pine-moon")
	end,
}
