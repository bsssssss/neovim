return {
	{
		"bsssssss/rose-pine.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "moon", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = false,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},

				groups = {
          -- stylua: ignore start
					border = "highlight_high",
					link   = "iris",
					panel  = "surface",

					error = "love",
					hint  = "iris",
					info  = "foam",
					note  = "pine",
					todo  = "rose",
					warn  = "gold",

					git_add       = "leaf",
					git_change    = "rose",
					git_delete    = "love",
					git_dirty     = "rose",
					git_ignore    = "muted",
					git_merge     = "iris",
					git_rename    = "pine",
					git_stage     = "iris",
					git_text      = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
					-- stylua: ignore end
				},

				palette = {},

				-- NOTE: Highlight groups are extended (merged) by default. Disable this
				-- per group via `inherit = false`
				highlight_groups = {
          -- stylua: ignore start
					LineNr                = { fg   = "highlight_med" },
          Visual                = { bg   = "subtle" },
          Comment               = { fg   = "muted" },
          BlinkCmpGhostText     = { link = "Comment" },
          MiniIndentscopeSymbol = { fg   = "highlight_high" },
          WinSeparator          = { fg   = "highlight_high" },
          Directory             = { fg   = "lagoon" },

					["@keyword.return"] = { fg = "pine"   },
					["@keyword.repeat"] = { fg = "prune"  },
					["@type"]           = { fg = "lagoon" },
					["@type.builtin"]   = { fg = "lagoon" },

					["@tag.xml"]  = { fg = "pine" },
					["@tag.html"] = { fg = "pine" },
					["@tag.css"]  = { fg = "pine" },

					["@function.method.call"]                           = { fg   = "rose"      },
          ["@lsp.typemod.variable.defaultLibrary.javascript"] = { link = "@operator"},
					["@variable.builtin.javascript"]                    = { link = "@operator" },
					["@lsp.type.modifier.java"]                         = { link = "Keyword" },
					-- stylua: ignore end
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			})

			vim.cmd("colorscheme rose-pine")
			-- vim.cmd("colorscheme rose-pine-main")
			-- vim.cmd("colorscheme rose-pine-moon")
			-- vim.cmd("colorscheme rose-pine-dawn")
		end,
	},
	{
		"rose-pine/neovim",
		enabled = false,
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
						foam = "#9CCFD8",
						base = "#262b38",
						-- base = "#1F232E",
						-- gold = "#DDB169",
						gold = "#D7B175",
						text = "#C8C8D0",
						prune = "#717BC7",
						mint = "#ACE697",
						sand = "#D1C29F",
						lagoon = "#75A6C7",
						turquoise = "#68DFC9",
						tea = "#ebbbb9",
						highlight_low = "#343B4C",
						highlight_med = "#48526a",
						highlight_high = "#535E79",
						muted = "#677598",
						surface = "#2D3343",
						overlay = "#353A52",
						subtle = "#8D92AA",
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

					PmenuSel = { bg = "highlight_med" },

					-- MasonBackdrop = { bg = "base" },
					MasonMuted = { fg = "muted" },
					MasonHighlight = { fg = "gold" },
					MasonMutedBlock = { fg = "iris" },
					MasonMutedBlockBold = { fg = "iris" },
					MasonHighlightBlock = { fg = "iris", bg = "iris", blend = 15 },
					MasonHighlightBlockBold = { fg = "iris", bg = "iris", blend = 15 },
					MasonHeader = { fg = "pine" },

					LspReferenceRead = { bg = "highlight_low" },
					LspReferenceWrite = { bg = "highlight_low" },
					LspReferenceText = { bg = "overlay" },

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

					["@type"] = { fg = "lagoon" },
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

					["@type.typescript"] = { fg = "lagoon" },
					-- ["@type.builtin.typescript"] = { fg = "lagoon" },
					["@lsp.type.enum.typescript"] = { fg = "lagoon" },
					["@lsp.type.interface.typescript"] = { fg = "lagoon" },
					["@lsp.type.class.typescript"] = { fg = "lagoon" },
					["@function.method.call.typescript"] = { fg = "tea" },
					["@lsp.type.property.typescript"] = { fg = "foam" },
					-- ["@lsp.type.variable.typescript"] = { fg = "foam" },
					-- ["@lsp.typemod.variable.local.typescript"] = { fg = "text" },

					["@variable.builtin.supercollider"] = { fg = "pine" },
					["@constant.builtin.supercollider"] = { fg = "love" },
					["@function.method.call.supercollider"] = { fg = "foam" },
					["@string.special.symbol.supercollider"] = { fg = "leaf" },
					["@keyword.conditional.supercollider"] = { fg = "prune" },
					["@keyword.supercollider"] = { fg = "pine" },
					["@type.supercollider"] = { fg = "lagoon" },
					-- ["@number.supercollider"] = { fg = "iris" },
					-- ["@number.float.supercollider"] = { fg = "iris" },

					["@lsp.type.variable.genexpr"] = { fg = "text" },
					["@lsp.type.object.genexpr"] = { fg = "rose" },
					["@lsp.type.constant.genexpr"] = { fg = "lagoon" },
					["@lsp.type.attribute.genexpr"] = { fg = "iris" },
					-- ["@constant.builtin.genexpr"] = { fg = "pine" },
					["@lsp.typemod.variable.special.genexpr"] = { fg = "foam" },
					-- ["@lsp.typemod.function.builtin.genexpr"] = { fg = "foam" },
					["@lsp.type.comment.genexpr"] = { fg = "muted" },

					["@string.documentation.python"] = { fg = "muted" },
				},
			})
			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
}
