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
					-- text = "#D5D5DB",
					text = "#C8C8D0",
					prune = "#717BC7",
					mint = "#ACE697",
					-- sand = "#D1C9AD",
					sand = "#D1C29F",
					lagoon = "#75A6C7",
					turquoise = "#68DFC9",
					tea = "#ebbbb9",
					-- base = "none",
				},
			},
			highlight_groups = {

				FzfLuaBackdrop = { fg = "base" },

				CurSearch = { fg = "iris", bg = "iris", blend = 33, inherit = false },
				Search = { fg = "iris", bg = "iris", blend = 12, inherit = false },
				Comment = { fg = "muted" },
				CursorLine = { bg = "base" },
				LineNr = { fg = "highlight_med" },
				Visual = { bg = "highlight_med", blend = 66 },
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				WinSeparator = { fg = "highlight_high" },
				Special = { fg = "lagoon" },
				-- String = { fg = "sand" },

				MasonBackdrop = { bg = "base" },

				LspReferenceRead = { bg = "highlight_med" },
				LspReferenceWrite = { bg = "highlight_med" },

				NoiceVirtualText = { fg = "iris" },
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

				-- folke/which-key.nvim
				WhichKey = { fg = "iris" },
				WhichKeyDesc = { fg = "muted" },
				WhichKeyGroup = { fg = "pine" },
				WhichKeyIcon = { fg = "pine" },
				WhichKeyIconAzure = { fg = "pine" },
				WhichKeyIconBlue = { fg = "foam" },
				WhichKeyIconCyan = { fg = "foam" },
				WhichKeyIconGreen = { fg = "leaf" },
				WhichKeyIconGrey = { fg = "subtle" },
				WhichKeyIconOrange = { fg = "rose" },
				WhichKeyIconPurple = { fg = "iris" },
				WhichKeyIconRed = { fg = "love" },
				WhichKeyIconYellow = { fg = "sand" },
				WhichKeySeparator = { fg = "subtle" },
				WhichKeyValue = { fg = "text" },

				["@type"] = { fg = "leaf" },
				["@type.builtin"] = { fg = "pine" },
				-- ["@property"] = { fg = "lagoon" },

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

				-- ["@type"] = { fg = "pine" },

				["@keyword.return"] = { fg = "pine" },
				-- ["@keyword.return.lua"] = { fg = "love" },

				["@lsp.typemod.class.declaration.java"] = { fg = "gold" },
				-- ["@lsp.mod.importDeclaration.java"] = { fg = "pine" },
				["@keyword.exception.java"] = { fg = "pine" },
				["@keyword.conditional.java"] = { fg = "prune" },
				-- ["@keyword.return.java"] = { fg = "love" },
				["@lsp.type.modifier.java"] = { fg = "pine" },
				["@type.builtin.java"] = { fg = "pine" },
				-- ["@lsp.type.class.java"] = { fg = "leaf" },
				-- ["@lsp.type.property.java"] = { fg = "sand" },
				["@keyword.java"] = { fg = "prune" },

				["@type.typescript"] = { fg = "leaf" },
				["@type.builtin.typescript"] = { fg = "leaf" },
				["@lsp.type.enum.typescript"] = { fg = "leaf" },
				["@lsp.type.interface.typescript"] = { fg = "leaf" },
				["@function.method.call.typescript"] = { fg = "tea" },
				["@lsp.type.property.typescript"] = { fg = "lagoon" },
				["@lsp.type.variable.typescript"] = { fg = "foam" },
				["@lsp.typemod.variable.local.typescript"] = { fg = "text" },

				["@variable.builtin.supercollider"] = { fg = "pine" },
				["@constant.builtin.supercollider"] = { fg = "love" },
				["@function.method.call.supercollider"] = { fg = "foam" },
				["@string.special.symbol.supercollider"] = { fg = "leaf" },
				["@keyword.conditional.supercollider"] = { fg = "prune" },
				["@keyword.supercollider"] = { fg = "pine" },
				["@type.supercollider"] = { fg = "lagoon" },
				-- ["@number.supercollider"] = { fg = "iris" },
				-- ["@number.float.supercollider"] = { fg = "iris" },

				["@lsp.type.object.genexpr"] = { fg = "rose" },
				["@lsp.type.constant.genexpr"] = { fg = "lagoon" },
				["@lsp.type.attribute.genexpr"] = { fg = "iris" },
				-- ["@constant.builtin.genexpr"] = { fg = "pine" },
				["@lsp.typemod.variable.special.genexpr"] = { fg = "foam" },
				-- ["@lsp.typemod.function.builtin.genexpr"] = { fg = "foam" },
			},
		})
		vim.cmd("colorscheme rose-pine-moon")
	end,
}
