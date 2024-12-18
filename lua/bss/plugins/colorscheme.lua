return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
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
					-- gold = "#E6C46E",
					gold = "#DDB169",
					text = "#D5D5DB",
					prune = "#717BC7",
					mint = "#ACE697",
					sand = "#D1C9AD",
					lagoon = "#75A6C7",
          turquoise = "#68DFC9"
					-- base = "none",
				},
			},
			highlight_groups = {

				FzfLuaBackdrop = { fg = "base" },

				CurSearch = { fg = "turquoise", bg = "turquoise", blend = 33, inherit = false },
				Search = { fg = "turquoise", bg = "turquoise", blend = 12, inherit = false },
				Comment = { fg = "muted" },
				CursorLine = { bg = "base" },
				LineNr = { fg = "highlight_med" },
				Visual = { bg = "highlight_med", blend = 66 },
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				WinSeparator = { fg = "highlight_high" },
				Special = { fg = "lagoon" },
        -- String = { fg = "sand" },

				NoiceVirtualText = { fg = "turquoise" },
				NotifyINFOBorder = { fg = "muted", bg = "base" },
				NotifyINFOTitle = { fg = "text" },

				SnacksDashboardDesc = { fg = "lagoon" },
				SnacksDashboardKey = { fg = "foam" },
				SnacksDashboardTitle = { fg = "pine" },
				SnacksDashboardIcon = { fg = "pine" },

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

				mcdCardinality = { fg = "iris" },
				mcdEntity = { fg = "leaf" },
				mcdEntityRef = { fg = "leaf" },

				["@string.special.symbol.make"] = { fg = "pine" },

				["@module.latex"] = { fg = "leaf" },

				["@keyword.conditional"] = { fg = "prune" },
				["@keyword.repeat"] = { fg = "prune" },

				["@type.haskell"] = { fg = "leaf" },
				["@variable.member.haskell"] = { fg = "sand" },
				["@module.haskell"] = { fg = "lagoon" },
				-- ["@constructor.haskell"]  = {fg = "leaf"},

				["@tag.xml"] = { fg = "pine" },
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
