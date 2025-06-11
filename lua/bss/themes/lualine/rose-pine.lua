local rose_pine = require("rose-pine.palette")
local palette = {
	bg = "#222222",
	primary = rose_pine.iris,
	secondary = rose_pine.muted,
	text = rose_pine.text,
}

local theme = {
	normal = {
		a = { bg = palette.bg, fg = palette.primary, gui = "bold" },
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
		a = { bg = palette.primary, fg = palette.base, gui = "bold" },
		b = { bg = palette.bg, fg = palette.secondary },
		c = { bg = palette.bg, fg = palette.secondary },

		x = { bg = palette.bg, fg = palette.secondary },
		y = { bg = palette.bg, fg = palette.secondary },
		z = { bg = palette.bg, fg = palette.primary },
	},
	replace = {
		a = { bg = palette.primary, fg = palette.base, gui = "bold" },
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
