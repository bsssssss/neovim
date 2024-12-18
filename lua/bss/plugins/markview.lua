return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false, -- Recommended
		-- ft = "markdown" -- If you decide to lazy-load anyway

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
      latex = {
        enable = false,
        block = {
          enable = false,
        },
      },
			list_items = {
				enable = true,

				--- Amount of spaces that defines an indent
				--- level of the list item.
				---@type integer
				indent_size = 2,

				--- Amount of spaces to add per indent level
				--- of the list item.
				---@type integer
				shift_width = 4,

				marker_minus = {
					add_padding = true,

					text = "•",
					-- hl = "MarkviewListItemMinus",
					hl = "Comment",
				},
				marker_plus = {
					add_padding = true,

					text = "⁍",
					hl = "MarkviewListItemPlus",
				},
				marker_star = {
					add_padding = true,

					text = "★",
					hl = "MarkviewListItemStar",
				},

				--- These items do NOT have a text or
				--- a hl property!

				--- n. Items
				marker_dot = {
					add_padding = true,
				},

				--- n) Items
				marker_parenthesis = {
					add_padding = true,
				},
			},
		},
	},
}
