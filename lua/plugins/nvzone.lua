return {
	{ "nvzone/volt", lazy = true },
	{
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
	},
	{
		"nvzone/floaterm",
		dependencies = "nvzone/volt",
		opts = {
      border = true
    },
		cmd = "FloatermToggle",
	},
}
