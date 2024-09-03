return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local bss = require("lualine.themes.bss")

		local function scstatus()
			if vim.bo.filetype == "supercollider" then
				stat = vim.fn["scnvim#statusline#server_status"]()
				stat = stat:gsub("%%", "%%%%")
				return stat
			else
				return ""
			end
		end

		lualine.setup({
			options = {
				theme = "rose-pine",
				section_separators = "",
			},
			sections = {
				lualine_c = {
					{ "filename" },
					{ scstatus, color = {
						fg = "#55DD33",
					} },
				},
			},
		})
	end,
}
