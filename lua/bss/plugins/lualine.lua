---@diagnostic disable: undefined-field
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local palette = require("rose-pine.palette")

		local theme = {
			normal = {
				a = { bg = palette.iris, fg = palette.base, gui = "bold" },
				b = { bg = palette.base, fg = palette.muted },
				c = { bg = palette.base, fg = palette.muted },

				x = { bg = palette.base, fg = palette.muted },
				y = { bg = palette.base, fg = palette.muted },
				z = { bg = palette.base, fg = palette.iris },
			},
			insert = {
				a = { bg = palette.leaf, fg = palette.base, gui = "bold" },
				b = { bg = palette.base, fg = palette.muted },
				c = { bg = palette.base, fg = palette.muted },

				x = { bg = palette.base, fg = palette.muted },
				y = { bg = palette.base, fg = palette.muted },
				z = { bg = palette.base, fg = palette.leaf },
			},
			visual = {
				a = { bg = palette.pine, fg = palette.base, gui = "bold" },
				b = { bg = palette.base, fg = palette.muted },
				c = { bg = palette.base, fg = palette.muted },

				x = { bg = palette.base, fg = palette.muted },
				y = { bg = palette.base, fg = palette.muted },
				z = { bg = palette.base, fg = palette.pine },
			},
			replace = {
				a = { bg = palette.rose, fg = palette.base, gui = "bold" },
				b = { bg = palette.base, fg = palette.muted },
				c = { bg = palette.base, fg = palette.muted },

				x = { bg = palette.base, fg = palette.muted },
				y = { bg = palette.base, fg = palette.muted },
				z = { bg = palette.base, fg = palette.rose },
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
					"help",
					"neo-tree",
					"snacks_picker_list",
					"snacks_picker_input",
					"snacks_terminal",
					"snacks_notif_history",
				},
				refresh = {
					statusline = 100,
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
					{ "branch",
            color = { fg = palette.iris }
          },
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
					-- {
					-- 	require("noice").api.status.message.get_hl,
					-- 	cond = require("noice").api.status.message.has,
					-- },
					-- {
					-- 	require("noice").api.status.command.get,
					-- 	cond = require("noice").api.status.command.has,
					-- 	color = { fg = "#ff9e64" },
					-- },
				},

				lualine_x = {},
				lualine_y = {
					{ "filetype", icon = { align = "right" } },
					"encoding",
				},
				lualine_z = {
					{
						"location",
						-- color = { fg = palette.iris, bg = palette.base },
					},
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
