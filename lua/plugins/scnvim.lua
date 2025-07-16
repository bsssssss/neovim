return {
	{
		-- "bsssssss/scnvim",
		dir = "/Users/bss/dev/github.com/bsssssss/scnvim",
		-- branch = "feature/sclang-lsp",
		dependencies = { "davidgranstrom/telescope-scdoc.nvim" },
		event = { "FileType supercollider" },
		config = function()
			local scnvim = require("scnvim")
			local map = scnvim.map
			local map_expr = scnvim.map_expr

			-- Setup scnvim
			scnvim.setup({
				keymaps = {
					-- ["<C-E>"] = map("editor.send_line", { "i", "n" }),
					["<C-e>"] = {
						map("editor.send_block", { "n" }),
						map("editor.send_selection", "x"),
					},
					["<CR>"] = map("postwin.toggle"),
					["<C-CR>"] = map("postwin.toggle", "i"),
					["<C-x>"] = map("postwin.clear", { "n", "i" }),
					-- ["<C-k>"] = map("signature.show", { "n", "i" }),
					-- ["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
					-- ["<leader>st"] = map("sclang.start"),
					-- ["<leader>sk"] = map("sclang.recompile"),
					-- ["<F1>"] = map_expr("s.boot"),
					-- ["<F2>"] = map_expr("s.meter"),
				},
				editor = {
					highlight = {
						-- color = "IncSearch",
						color = "LspReferenceText",
						type = "flash",
						flash = {
							duration = 100,
							repeats = 1,
						},
					},
				},
				postwin = {
					highlight = true,
					auto_toggle_error = true,
					horizontal = false,
					direction = "right",
					size = 70,
				},
				documentation = {
					cmd = "/opt/homebrew/bin/pandoc",
				},
			})

			-- Snippets
			vim.g.scnvim_snippet_format = "luasnip"
			require("luasnip").add_snippets(
				"supercollider",
				require("scnvim/utils").get_snippets()
			)
		end,
	},
}
