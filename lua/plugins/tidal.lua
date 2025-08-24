return {
	{
		-- "bsssssss/tidal.nvim",
		dir = "/Users/bss/dev/personal/tidal.nvim",
		-- branch = "dev",
		ft = "tidal",
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
	{
		"bsssssss/vim-tidal",
		enabled = false,
		config = function()
			vim.g.tidal_boot = "/Users/bss/Dropbox/bsupercollider/tidal/BootTidal.hs"
			vim.g.tidal_no_mappings = 1

			-- Create an autocommand group
			vim.api.nvim_create_augroup("TidalMappings", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = "TidalMappings",
				pattern = "tidal",
				callback = function()
					print("hello vim-tidal")
					vim.keymap.set(
						"n",
						"<leader>tds",
						":TidalStart<CR>",
						{ desc = "Tidal : [S]tart" }
					)
					vim.keymap.set(
						"n",
						"<leader>tdq",
						":TidalQuit<CR>",
						{ desc = "Tidal : [Q]uit" }
					)
					vim.keymap.set(
						"n",
						"<leader>tdr",
						":TidalRestart<CR>",
						{ desc = "Tidal : [R]estart" }
					)
					vim.keymap.set(
						"n",
						"<D-e>",
						"<Plug>TidalParagraphSend",
						{ desc = "Tidal: [E]valuate" }
					)
					vim.keymap.set(
						"n",
						"<D-.>",
						":TidalHush<CR>",
						{ desc = "Tidal: Hush" }
					)
					vim.keymap.set(
						"i",
						"<D-e>",
						"<Esc><Plug>TidalParagraphSend<Esc>i<Right>"
					)
					vim.keymap.set("i", "<D-.>", "<Esc>:TidalHush<CR><Esc>i<Right>")
				end,
			})
		end,
	},
}
