---@diagnostic disable: undefined-field
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local palette = require("rose-pine.palette")
		local bg = palette.base

		local theme = {
			normal = {
				a = { bg = bg, fg = palette.iris, gui = "bold" },
				b = { bg = bg, fg = palette.muted },
				c = { bg = bg, fg = palette.muted },

				x = { bg = bg, fg = palette.muted },
				y = { bg = bg, fg = palette.muted },
				z = { bg = bg, fg = palette.iris },
			},
			insert = {
				a = { bg = palette.iris, fg = palette.base, gui = "bold" },
				b = { bg = bg, fg = palette.muted },
				c = { bg = bg, fg = palette.muted },

				x = { bg = bg, fg = palette.muted },
				y = { bg = bg, fg = palette.muted },
				z = { bg = bg, fg = palette.iris },
			},
			visual = {
				a = { bg = palette.iris, fg = palette.base, gui = "bold" },
				b = { bg = bg, fg = palette.muted },
				c = { bg = bg, fg = palette.muted },

				x = { bg = bg, fg = palette.muted },
				y = { bg = bg, fg = palette.muted },
				z = { bg = bg, fg = palette.iris },
			},
			replace = {
				a = { bg = palette.iris, fg = palette.base, gui = "bold" },
				b = { bg = bg, fg = palette.muted },
				c = { bg = bg, fg = palette.muted },

				x = { bg = bg, fg = palette.muted },
				y = { bg = bg, fg = palette.muted },
				z = { bg = bg, fg = palette.iris },
			},
		}

		local rec_mode = function()
			---@diagnostic disable-next-line: undefined-field
			local mode = require("noice").api.status.mode.get()

			if mode:match("^%-%-.*%-%-$") then
				return ""
			end

			local suffix = mode:match("^%-%-.*%-%-(.*)$")

			if suffix then
				return suffix
			end

			return tostring(mode)
		end

		require("lualine").setup({
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "⟩", right = "" },
				theme = theme,
				disabled_filetypes = {
					-- "help",
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
					{ "branch", color = { fg = palette.iris } },
					{
						"diff",
						"diagnostics",
						-- draw_empty = true,
					},
					{ "filename", color = { fg = palette.text } },
				},
				lualine_c = {
					-- {
					-- 	require("noice").api.status.message.get_hl,
					-- 	cond = require("noice").api.status.message.has,
					-- },
				},

				lualine_x = {
					{
						-- rec_mode,
						-- ---@diagnostic disable-next-line: undefined-field
						-- cond = require("noice").api.status.mode.has,
						-- color = { fg = palette.gold },
					},
					{
						-- require("noice").api.status.command.get,
						-- cond = require("noice").api.status.command.has,
						-- color = { fg = "#ff9e64" },
					},
				},
				lualine_y = {
					{ "filetype", icon = { align = "right" } },
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
