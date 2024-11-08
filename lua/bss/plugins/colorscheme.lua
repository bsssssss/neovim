return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		local colors = {
			gr = "#6ABDAD",
		}
		require("rose-pine").setup({

			extend_background_behind_borders = false,

			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},

			groups = {
				git_add = "leaf",
			},

			palette = {
				moon = {
					gold = "#E6C46E",
					-- gold = "#A7C995",
					text = "#D5D5DB",
				},
			},

			highlight_groups = {

				CurSearch = { fg = "base", bg = "iris", inherit = false },
				Search = { fg = "Normal", bg = "iris", blend = 25, inherit = false },

				Comment = { fg = "highlight_high" },

				-- MsgArea = { bg = "base" },

				CursorLine = { bg = "highlight_low" },
				-- CursorLineNr = { fg = "muted" },
				LineNr = { fg = "highlight_med" },
				Visual = { bg = "highlight_med", blend = 66 },

				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				WinSeparator = { fg = "highlight_high" },

				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "base" },
				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },
				TelescopeMatching = { fg = "muted" },

				NeoTreeFloatBorder = { fg = "highlight_high" },
				NeoTreeRootName = { fg = "muted" },
				NeoTreeWinSeparator = { fg = "highlight_high" },

				MiniIndentscopeSymbol = { fg = "highlight_high" },

				["@keyword.exception.java"] = { fg = "#8985D4" },
				["@keyword.conditional.java"] = { fg = "#8985D4" },

				["@lsp.type.modifier.java"] = { fg = "pine" },
				["@type.builtin.java"] = { fg = "pine" },
				["@lsp.type.class.java"] = { fg = "leaf" },

				["@constructor.lua"] = { fg = "leaf" },

				["@tag.html"] = { fg = "pine" },

				["@variable.builtin.supercollider"] = { fg = "leaf" },
				["@constant.builtin.supercollider"] = { fg = "love" },
				["@function.method.call.supercollider"] = { fg = "foam" },
				["@string.special.symbol.supercollider"] = { fg = "gold" },
				["@keyword.conditional.supercollider"] = { fg = "#8985D4" },
				["@keyword.supercollider"] = { fg = "#8985D4" },
				["@type.supercollider"] = { fg = "pine" },
				["@number.supercollider"] = { fg = "iris" },
				["@number.float.supercollider"] = { fg = "iris" },
			},
		})
		vim.cmd("colorscheme rose-pine-moon")
	end,
}
