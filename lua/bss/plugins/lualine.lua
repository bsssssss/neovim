---@diagnostic disable: undefined-field
return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	config = function()
		local colors = require("bss.themes.lualine.kanagawa")
		local theme = colors.theme
		local palette = colors.palette

		local blendColor = function(color, blend)
			local c = require("kanagawa.lib.color")
			return { fg = color, bg = c(color):blend(palette.bg, blend):to_hex() }
		end

		require("lualine").setup({
			options = {
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				theme = theme,
				disabled_filetypes = {
					-- "help",
					-- "neo-tree",
					-- "snacks_picker_list",
					-- "snacks_picker_input",
					-- "snacks_terminal",
					-- "snacks_notif_history",
				},
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
						color = blendColor(palette.primary, 0.9),
						separator = { right = "" },
					},
					{ "diff" },
					{ "diagnostics", source = { "nvim" } },
					{ "filename", color = { fg = palette.text } },
				},
				lualine_c = {},

				lualine_x = {},
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
					{ "filename", color = { fg = palette.secondary, bg = palette.bg } },
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
