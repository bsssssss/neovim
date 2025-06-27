return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- enabled = false,
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		}, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			heading = {
				backgrounds = {},
			},
			bullet = {
				icons = { "•", "•", "•", "•" },
				left_pad = 2,
			},
			code = {
				sign = false,
				width = "block",
				left_margin = 2,
				left_pad = 2,
				right_pad = 2,
				border = "thin",
			},
		},
	},
}
