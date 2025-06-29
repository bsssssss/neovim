---@diagnostic disable: undefined-field
return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	config = function()
		local kana = require("kanagawa.colors").setup()
		local colors = {
			bg = kana.theme.ui.bg_p1,
			fg = "#c4b28a",
			blue = kana.palette.dragonBlue,
			green = kana.palette.dragonGreen,
			orange = kana.palette.dragonOrange,
			black = "#000000",
		}
		local theme = {
			normal = {
				a = { bg = colors.fg, fg = colors.black },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
				x = { bg = colors.bg, fg = colors.fg },
				y = { bg = colors.bg, fg = colors.fg },
				z = { bg = colors.fg, fg = colors.bg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.black },
			},
			visual = {
				a = { bg = colors.blue, fg = colors.black },
			},
			replace = {
				a = { bg = colors.orange, fg = colors.black },
			},
		}

		local function blendColor(color, blend)
			local c = require("kanagawa.lib.color")
			return {
				fg = color,
				bg = c(color):blend(colors.bg, blend):to_hex(),
			}
		end

		require("lualine").setup({
			options = {
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				theme = theme,
				disabled_filetypes = {},
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},

			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
						color = { gui = "bold" },
					},
				},
				lualine_b = {
					{
						"branch",
						icons_enabled = true,
						color = blendColor(colors.fg, 0.90),
						separator = { right = "" },
					},
					{
						"diff",
						color = { bg = blendColor(theme.normal.a.bg, 0.96).bg },
						separator = { right = "" },
					},
					{ "filename" },
				},
				lualine_c = {},

				lualine_x = {
					{ "diagnostics", source = { "nvim" } },
				},
				lualine_y = {
					{ "filetype", icons_enabled = false },
					"encoding",
				},
				lualine_z = {
					{ "location", color = { gui = "bold" } },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename" },
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{ "location", color = { gui = "bold" } },
				},
			},
		})
	end,
}
