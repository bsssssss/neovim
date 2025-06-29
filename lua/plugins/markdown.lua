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
			},
			code = {
				sign = false,
				width = "block",
				border = "thin",
        left_pad = 1,
        right_pad = 1,
			},
		},
	},
}
