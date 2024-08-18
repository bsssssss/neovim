return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local codedark = require("lualine.themes.codedark")

		codedark.normal.a.bg = "#544F50"
		codedark.normal.a.fg = "#ddddd"
		codedark.insert.a.bg = "A1837E"
		codedark.visual.a.bg = "#D1C39F"
		codedark.replace.a.bg = "#B0B5A1"

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
			options = { theme = codedark },
			sections = {
				lualine_c = {
					{ "filename" },
					{ scstatus, color = {
						fg = "#55DD33",
						gui = "bold",
					} },
				},
			},
		})
	end,
}
