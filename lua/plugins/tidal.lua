return {
	{
		-- "bsssssss/tidal.nvim",
		dir = "/Users/bss/dev/personal/tidal.nvim",
		-- branch = "dev",
		ft = "tidal",
		enabled = true,
		config = function()
			require("tidal").setup({
				tidal_boot = "/Users/bss/livecoding/tidal/setup/BootTidal.hs",
			})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "tidal",
				callback = function()
					vim.keymap.set(
						{ "n", "i" },
						"<C-e>",
						"<cmd>TidalEval<CR>",
						{ desc = "Send to Tidal" }
					)
					vim.keymap.set(
						{ "n", "i" },
						"<C-.>",
						"<cmd>TidalHush<CR>",
						{ desc = "Hush Tidal" }
					)
					vim.keymap.set(
						"n",
						"<CR>",
						"<cmd>TidalPostWindowToggle<CR>",
						{ desc = "Toggle Tidal post window" }
					)
				end,
			})
		end,
	},
	-- {
	-- 	"grddavies/tidal.nvim",
	-- 	opts = {
	-- 		boot = {
	-- 			tidal = {
	-- 				cmd = "ghci",
	-- 				args = { "-v0" },
	-- 				-- file = vim.api.nvim_get_runtime_file("bootfiles/BootTidal.hs", false)[1],
	-- 				file = "/Users/bss/livecoding/tidal/setup/BootTidal.hs",
	-- 				enabled = true,
	-- 			},
	-- 			sclang = {
	-- 				cmd = "sclang",
	-- 				args = {},
	-- 				file = vim.api.nvim_get_runtime_file(
	-- 					"bootfiles/BootSuperDirt.scd",
	-- 					false
	-- 				)[1],
	-- 				enabled = false, -- Set to true for auto-start SuperCollider
	-- 			},
	-- 			split = "v", -- Vertical split for REPL
	-- 		},
	-- 		mappings = {
	-- 			send_line = { mode = { "i", "n" }, key = "<S-CR>" },
	-- 			send_visual = { mode = { "x" }, key = "<S-CR>" },
	-- 			send_block = { mode = { "i", "n", "x" }, key = "<M-CR>" },
	-- 			send_node = { mode = "n", key = "<leader><CR>" },
	-- 			send_silence = { mode = "n", key = "<leader>m" },
	-- 			send_hush = { mode = "n", key = "<leader><Esc>" },
	-- 		},
	-- 		selection_highlight = {
	-- 			highlight = { link = "IncSearch" },
	-- 			timeout = 150,
	-- 		},
	-- 	},
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		opts = { ensure_installed = { "haskell", "supercollider" } },
	-- 	},
	-- },
	--
	-- -- HighTideLight.nvim configuration
	-- {
	-- 	"b0id/HighTideLight.nvim", -- Replace with your GitHub username
	-- 	branch = "master", -- or "feature/ast-parsing" for latest development
	-- 	lazy = false,
	-- 	dependencies = { "grddavies/tidal.nvim" },
	-- 	config = function()
	-- 		require("tidal-highlight").setup({
	-- 			debug = true, -- Enable for development/troubleshooting
	-- 			enabled = true,
	-- 			osc = {
	-- 				ip = "127.0.0.1",
	-- 				port = 6011,
	-- 			},
	-- 			animation = {
	-- 				fps = 30,
	-- 			},
	-- 			highlights = {
	-- 				groups = {
	-- 					{
	-- 						name = "TidalEvent1",
	-- 						fg = "#ff0000",
	-- 						bg = "#000000",
	-- 						blend = 20,
	-- 					},
	-- 					{
	-- 						name = "TidalEvent2",
	-- 						fg = "#00ff00",
	-- 						bg = "#000000",
	-- 						blend = 20,
	-- 					},
	-- 					{
	-- 						name = "TidalEvent3",
	-- 						fg = "#0000ff",
	-- 						bg = "#000000",
	-- 						blend = 20,
	-- 					},
	-- 				},
	-- 				outline_style = "underline",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
