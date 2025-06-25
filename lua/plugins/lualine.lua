---@diagnostic disable: undefined-field
return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	config = function()
		local colors = require("kanagawa.colors").setup()
		local theme = require("themes.lualine.kanagawa")
		local blendColor = function(color, blend)
			local c = require("kanagawa.lib.color")
			return {
				fg = color,
				bg = c(color):blend(theme.normal.b.bg, blend):to_hex(),
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
					},
				},
				lualine_b = {
					{
						"branch",
						icons_enabled = false,
						color = blendColor(theme.normal.a.bg, 0.90),
						separator = { right = "" },
					},
					{
						"diff",
						color = { bg = blendColor(theme.normal.a.bg, 0.96).bg },
						separator = { right = "" },
					},
					{ "filename", color = { fg = colors.palette.dragonBlue2 } },
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
					{
						"location",
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", color = { fg = theme.inactive.b.fg } },
				},
				lualine_x = {
					{ "location" },
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
