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
        language_name = false,
				sign = false,
				width = "block",
				border = "thick",
        left_pad = 1,
        right_pad = 1,
			},
		},
	},
}
