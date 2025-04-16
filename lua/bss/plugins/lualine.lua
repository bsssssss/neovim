return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local palette = require("rose-pine.palette")

		local theme = {
			normal = {
				a = { bg = palette.base, fg = palette.base, gui = "bold" },
				b = { bg = palette.base, fg = palette.muted },
				c = { bg = palette.base, fg = palette.muted },

				x = { bg = palette.base, fg = palette.muted },
				y = { bg = palette.base, fg = palette.muted },
				z = { bg = palette.base, fg = palette.muted },
			},
		}

		local rec_mode = function()
			---@diagnostic disable-next-line: undefined-field
			local mode = require("noice").api.status.mode.get()
			if mode:match("^%-%-.*%-%-$") then
				return ""
			end
			return tostring(mode)
		end

		require("lualine").setup({
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "⟩", right = "" },
				theme = theme,
				disabled_filetypes = {
					"neo-tree",
				},
			},

			sections = {
				lualine_a = {},
				lualine_b = {
					{ "branch", color = { fg = palette.iris } },
					"diff",
					{ "diagnostics", draw_empty = true },
				},
				lualine_c = {
					{ "filename", color = { fg = palette.text } },
					{
						rec_mode,
						---@diagnostic disable-next-line: undefined-field
						cond = require("noice").api.status.mode.has,
						color = { fg = palette.gold },
					},
				},

				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{ "filetype", icon = { align = "right" } },
					"encoding",
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", color = { fg = palette.muted, bg = palette.base } },
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
