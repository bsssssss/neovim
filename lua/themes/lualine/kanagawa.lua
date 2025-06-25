local colors = require("kanagawa.colors").setup()
local palette_colors = colors.palette
local theme_colors = colors.theme

local c = {
	bg = theme_colors.ui.bg_p1,
	primary = palette_colors.dragonBlue,
	secondary = palette_colors.fujiGray,
	text = palette_colors.fujiWhite,
}

local theme = {
	normal = {
		a = { bg = c.primary, fg = c.bg, gui = "bold" },
		b = { bg = c.bg, fg = c.secondary },
		c = { bg = c.bg, fg = c.secondary },

		x = { bg = c.bg, fg = c.secondary },
		y = { bg = c.bg, fg = c.secondary },
		z = { bg = c.bg, fg = c.primary },
	},
	insert = {
		a = { bg = c.primary, fg = c.bg, gui = "bold" },
		b = { bg = c.bg, fg = c.secondary },
		c = { bg = c.bg, fg = c.secondary },

		x = { bg = c.bg, fg = c.secondary },
		y = { bg = c.bg, fg = c.secondary },
		z = { bg = c.bg, fg = c.primary },
	},
	visual = {
		a = { bg = c.primary, fg = c.bg, gui = "bold" },
		b = { bg = c.bg, fg = c.secondary },
		c = { bg = c.bg, fg = c.secondary },

		x = { bg = c.bg, fg = c.secondary },
		y = { bg = c.bg, fg = c.secondary },
		z = { bg = c.bg, fg = c.primary },
	},
	replace = {
		a = { bg = c.primary, fg = c.bg, gui = "bold" },
		b = { bg = c.bg, fg = c.secondary },
		c = { bg = c.bg, fg = c.secondary },

		x = { bg = c.bg, fg = c.secondary },
		y = { bg = c.bg, fg = c.secondary },
		z = { bg = c.bg, fg = c.primary },
	},
	inactive = {
		a = { bg = c.bg, fg = c.primary, gui = "bold" },
		b = { bg = c.bg, fg = c.secondary },
		c = { bg = c.bg, fg = c.secondary },

		x = { bg = c.bg, fg = c.secondary },
		y = { bg = c.bg, fg = c.secondary },
		z = { bg = c.bg, fg = c.primary },
	},
}

return theme
