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
			groups = {
				git_add = "leaf",
			},
			palette = {
				moon = {
					gold = "#E6C46E",
					-- gold = "#A7C995",
					text = "#D5D5DB",
					-- prune = "#8985D4",
					prune = "#7874C2",
          -- mint = "#93CC93",
          mint = "#ACE697",
				},
			},
			highlight_groups = {

				CurSearch = { fg = "base", bg = "leaf", inherit = false },
				Search = { fg = "Normal", bg = "leaf", blend = 50, inherit = false },
				Comment = { fg = "highlight_high" },
				CursorLine = { bg = "highlight_low" },
				LineNr = { fg = "highlight_med" },
				Visual = { bg = "highlight_med", blend = 66 },
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				WinSeparator = { fg = "highlight_high" },

				NoiceVirtualText = { fg = "leaf" },
        NotifyInfoBorder = {fg = "muted"},
        NotifyINFOTitle = {fg = "muted"},

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

				-- String = { fg = "mint" },

				["@tag.html"] = { fg = "pine" },
				["@keyword.conditional"] = { fg = "prune" },
				["@keyword.repeat"] = { fg = "prune" },
				["@keyword.exception.java"] = { fg = "prune" },
				["@keyword.conditional.java"] = { fg = "prune" },
				["@lsp.type.modifier.java"] = { fg = "pine" },
				["@type.builtin.java"] = { fg = "pine" },
				["@lsp.type.class.java"] = { fg = "leaf" },
				["@keyword.java"] = { fg = "prune" },
				-- ["@constructor.lua"] = { fg = "prune" },
				["@variable.builtin.supercollider"] = { fg = "leaf" },
				["@constant.builtin.supercollider"] = { fg = "love" },
				["@function.method.call.supercollider"] = { fg = "foam" },
				["@string.special.symbol.supercollider"] = { fg = "gold" },
				["@keyword.conditional.supercollider"] = { fg = "prune" },
				["@keyword.supercollider"] = { fg = "prune" },
				["@type.supercollider"] = { fg = "pine" },
				["@number.supercollider"] = { fg = "iris" },
				["@number.float.supercollider"] = { fg = "iris" },
			},
		})
		vim.cmd("colorscheme rose-pine-moon")
	end,
}
