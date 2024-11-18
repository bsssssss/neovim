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
					text = "#D5D5DB",
					prune = "#717BC7",
					mint = "#ACE697",
					sand = "#D1C9AD",
					lagoon = "#75A6C7",
				},
			},
			highlight_groups = {

				CurSearch = { fg = "base", bg = "leaf", inherit = false },
				Search = { fg = "text", bg = "leaf", blend = 50, inherit = false },
				Comment = { fg = "muted" },
				CursorLine = { bg = "highlight_low" },
				LineNr = { fg = "highlight_med" },
				Visual = { bg = "highlight_med", blend = 66 },
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				WinSeparator = { fg = "highlight_high" },

				NoiceVirtualText = { fg = "leaf" },
				NotifyINFOBorder = { fg = "muted", bg = "base" },
				NotifyINFOTitle = { fg = "text" },

				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "base" },
				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },
				TelescopeMatching = { fg = "leaf" },

				NeoTreeFloatBorder = { fg = "highlight_high" },
				NeoTreeRootName = { fg = "muted" },
				NeoTreeWinSeparator = { fg = "highlight_high" },

				MiniIndentscopeSymbol = { fg = "highlight_high" },
				MiniIndentscopeSymbolOff = { fg = "highlight_high" },

				["@keyword.conditional"] = { fg = "prune" },
				["@keyword.repeat"] = { fg = "prune" },

				["@type.haskell"] = { fg = "leaf" },
				["@variable.member.haskell"] = { fg = "sand" },
				["@module.haskell"] = { fg = "lagoon" },
				-- ["@constructor.haskell"]  = {fg = "leaf"},

				["@tag.html"] = { fg = "pine" },
				["@tag.attribute.html"] = { fg = "leaf" },

				["@tag.css"] = { fg = "pine" },

				["@keyword.exception.java"] = { fg = "prune" },
				["@keyword.conditional.java"] = { fg = "prune" },
				["@lsp.type.modifier.java"] = { fg = "pine" },
				["@type.builtin.java"] = { fg = "pine" },
				["@lsp.type.class.java"] = { fg = "leaf" },
				["@keyword.java"] = { fg = "prune" },

				["@variable.builtin.supercollider"] = { fg = "pine" },
				["@constant.builtin.supercollider"] = { fg = "love" },
				["@function.method.call.supercollider"] = { fg = "foam" },
				["@string.special.symbol.supercollider"] = { fg = "gold" },
				["@keyword.conditional.supercollider"] = { fg = "prune" },
				["@keyword.supercollider"] = { fg = "prune" },
				["@type.supercollider"] = { fg = "leaf" },
				["@number.supercollider"] = { fg = "iris" },
				["@number.float.supercollider"] = { fg = "iris" },
			},
		})
		vim.cmd("colorscheme rose-pine-moon")
	end,
}
