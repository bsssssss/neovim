return {
	"folke/noice.nvim",
	enabled = false,
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
	},

	config = function()
		require("noice").setup({

			message = {
				enabled = true,
				view = "notify",
				opts = {},
			},

			cmdline = {
				enabled = true,
				view = "cmdline",
				opts = {},
			},

			views = {
				notify = {
					enabled = true,
				},
				mini = {
					enabled = false,
				},
			},

			lsp = {
				progress = {
					enabled = false,
				},
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = false,
					["vim.lsp.util.stylize_markdown"] = false,
					["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
				},
				message = {
					enabled = true,
				},
			},
			-- hover = {
			-- 	enabled = false,
			-- 	view = nil, -- when nil, use defaults from documentation
			-- 	---@type NoiceViewOptions
			-- 	opts = {}, -- merged with defaults from documentation
			-- },

			routes = {
				-- {
				-- 	filter = {
				-- 		event = "msg_show",
				-- 		find = "(mini.align)",
				-- 	},
				-- 	-- skip = true,
				-- 	-- view = "cmdline",
				-- 	-- opts = {
				-- 	-- 	timeout = 3000,
				-- 	-- 	update = true,
				-- 	-- 	replace = true,
				-- 	-- },
				-- },
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						find = "written",
					},
					opts = { skip = true },
				},
				--    {
				--      filter = {
				--        event = "notify",
				--        find = "LSP: "
				--      },
				--      view = "cmdline_output",
				-- opts = {
				-- 	-- timeout = 3000,
				-- 	-- update = true,
				-- 	replace = true,
				-- },
				--    }
			},

			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				long_message_to_split = true, -- long messages will be sent to a split
				lsp_doc_border = true, -- add a border to hover docs and signature help
				command_palette = true,
			},
		})
	end,
}
