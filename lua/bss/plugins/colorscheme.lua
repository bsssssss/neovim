return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({

			extend_background_behind_borders = false,

			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},

			highlight_groups = {

				CurSearch = { fg = "base", bg = "leaf", inherit = false },
				Search = { fg = "Normal", bg = "leaf", blend = 25, inherit = false },

				MsgArea = { bg = "base" },

				CursorLine = { bg = "highlight_low" },
				-- CursorLineNr = { fg = "muted" },
				LineNr = { fg = "highlight_med" },
				Visual = { bg = "iris", blend = 10 },

				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },

				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "base" },
				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },

        NeoTreeFloatBorder = { fg = "highlight_high" },
        NeoTreeRootName = {fg = "iris"},
        NeoTreeWinSeparator = {fg = "highlight_high"},

        MiniIndentscopeSymbol = {fg = "highlight_high"},

				["@keyword.exception.java"] = { fg = "#8985D4" },
				["@keyword.conditional.java"] = { fg = "#8985D4" },

				["@lsp.type.modifier.java"] = { fg = "pine" },
				["@type.builtin.java"] = { fg = "pine" },
				["@lsp.type.class.java"] = { fg = "leaf" },

				["@constructor.lua"] = { fg = "iris" },

				["@tag.html"] = { fg = "pine" },
			},
		})
		vim.cmd("colorscheme rose-pine-moon")
	end,
}
