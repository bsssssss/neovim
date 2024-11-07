return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local palette = require("rose-pine.palette")
		local theme = {
			normal = {
				a = { bg = palette.base, fg = palette.pine, gui = "bold" },
				b = { bg = palette.base, fg = palette.muted },
				c = { bg = palette.base, fg = palette.muted },

				x = { bg = palette.base, fg = palette.muted },
				y = { bg = palette.base, fg = palette.muted },
				z = { bg = palette.base, fg = palette.muted },
			},
		}
		require("lualine").setup({
			options = {
				section_separators = { left = "⟩", right = "" },
				component_separators = { left = "⟩", right = "" },
				theme = theme,
				disabled_filetypes = {
					"neo-tree",
				},
			},
			sections = {
				lualine_a = { "branch" },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = {
					{
						"filename",
						color = { fg = palette.muted },
					},
				},

				lualine_x = {
					{
						"filetype",
						icon = { align = "right" },
					},
					"encoding",
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
