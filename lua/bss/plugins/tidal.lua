return {
	{
		-- dir = "/Users/bss/Code/git/bsssssss/tidal.nvim",
		"bsssssss/tidal.nvim",
		enabled = true,
		config = function()
			require("tidal").setup({
				tidal_boot = "/Users/bss/Dropbox/bsupercollider/tidal/BootTidal.hs",
			})

			vim.api.nvim_create_augroup("Tidal", { clear = true })
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				group = "Tidal",
				pattern = "*.tidal",
				callback = function()
					-- print("entering a tidal file..")
					-- vim.bo.filetype = "haskell"
					vim.keymap.set({ "n", "i" }, "<C-e>", "<cmd>TidalSend<CR>", { desc = "Send to tidal" })
					vim.keymap.set({ "n", "i" }, "<C-.>", "<cmd>TidalHush<CR>", { desc = "Silence tidal" })
					vim.keymap.set("n", "<CR>", "<cmd>TidalPost<CR>", { desc = "Toggle Postwindow" })
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
					vim.keymap.set("n", "<leader>tds", ":TidalStart<CR>", { desc = "Tidal : [S]tart" })
					vim.keymap.set("n", "<leader>tdq", ":TidalQuit<CR>", { desc = "Tidal : [Q]uit" })
					vim.keymap.set("n", "<leader>tdr", ":TidalRestart<CR>", { desc = "Tidal : [R]estart" })
					vim.keymap.set("n", "<D-e>", "<Plug>TidalParagraphSend", { desc = "Tidal: [E]valuate" })
					vim.keymap.set("n", "<D-.>", ":TidalHush<CR>", { desc = "Tidal: Hush" })
					vim.keymap.set("i", "<D-e>", "<Esc><Plug>TidalParagraphSend<Esc>i<Right>")
					vim.keymap.set("i", "<D-.>", "<Esc>:TidalHush<CR><Esc>i<Right>")
				end,
			})
		end,
	},
}
