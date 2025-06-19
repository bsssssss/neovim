local colors = require("kanagawa.colors").setup()
local palette_colors = colors.palette
local theme_colors = colors.theme

local palette = {
	bg = theme_colors.ui.bg_p1,
	primary = palette_colors.dragonBlue2,
	secondary = palette_colors.fujiGray,
	text = palette_colors.fujiWhite,
}

local theme = {
	normal = {
		a = { bg = palette_colors.dragonBlue2, fg = palette.bg, gui = "bold" },
		b = { bg = palette.bg, fg = palette.secondary },
		c = { bg = palette.bg, fg = palette.secondary },

		x = { bg = palette.bg, fg = palette.secondary },
		y = { bg = palette.bg, fg = palette.secondary },
		z = { bg = palette.bg, fg = palette.primary },
	},
	insert = {
		a = { bg = palette.primary, fg = palette.bg, gui = "bold" },
		b = { bg = palette.bg, fg = palette.secondary },
		c = { bg = palette.bg, fg = palette.secondary },

		x = { bg = palette.bg, fg = palette.secondary },
		y = { bg = palette.bg, fg = palette.secondary },
		z = { bg = palette.bg, fg = palette.primary },
	},
	visual = {
		a = { bg = palette.primary, fg = palette.bg, gui = "bold" },
		b = { bg = palette.bg, fg = palette.secondary },
		c = { bg = palette.bg, fg = palette.secondary },

		x = { bg = palette.bg, fg = palette.secondary },
		y = { bg = palette.bg, fg = palette.secondary },
		z = { bg = palette.bg, fg = palette.primary },
	},
	replace = {
		a = { bg = palette.primary, fg = palette.bg, gui = "bold" },
		b = { bg = palette.bg, fg = palette.secondary },
		c = { bg = palette.bg, fg = palette.secondary },

		x = { bg = palette.bg, fg = palette.secondary },
		y = { bg = palette.bg, fg = palette.secondary },
		z = { bg = palette.bg, fg = palette.primary },
	},
	inactive = {
		a = { bg = palette.bg, fg = palette.primary, gui = "bold" },
		b = { bg = palette.bg, fg = palette.secondary },
		c = { bg = palette.bg, fg = palette.secondary },

		x = { bg = palette.bg, fg = palette.secondary },
		y = { bg = palette.bg, fg = palette.secondary },
		z = { bg = palette.bg, fg = palette.primary },
	},
}

return {
	palette = palette,
	theme = theme,
}
