vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "neo-tree" then
			vim.opt.signcolumn = "no"
		end
		vim.wo.fillchars = "eob: "
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "Comment", timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
	pattern = { "gitcommit", "markdown", "md" },
	callback = function()
		vim.opt_local.textwidth = 80
		vim.opt_local.wrap = false
		vim.api.nvim_set_option_value("linebreak", true, { filetype = "markdown" })
		vim.opt_local.spell = false
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tidal",
	callback = function()
		-- local logfile = "/tmp/tidal_ls.log"
		local client_id = vim.lsp.start({
			name = "tidal_ls",
			cmd = { vim.fn.expand("~/.local/bin/tidal-ls") },
			handlers = {
				["window/showMessage"] = function(_, result, ctx)
					vim.notify("LSP Message: " .. result.message, vim.log.levels.INFO, { title = "Tidal LSP" })
				end,
				["window/logMessage"] = function(_, result, ctx)
					vim.notify("LSP Log: " .. result.message, vim.log.levels.DEBUG, { title = "Tidal LSP Log" })
				end,
			},
		})
		if not client_id then
			vim.notify("Failed to start LSP client", vim.log.levels.ERROR)
		else
			vim.notify("LSP client started", vim.log.levels.INFO)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "genexpr",
	callback = function()
		vim.lsp.start({
			name = "genexpr_ls",
			cmd = { "node", vim.fn.expand("~/Code/projects/genexpr_ls/out/server/server.js"), "--stdio" },
			handlers = {
				["window/showMessage"] = function(_, result, ctx)
					vim.notify(result.message, vim.log.levels.INFO, { title = "GenExpr LSP" })
				end,
				["window/logMessage"] = function(_, result, ctx)
					vim.notify(result.message, vim.log.levels.DEBUG, { title = "GenExpr LSP Log" })
				end,
			},
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "haskell",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		vim.bo[bufnr].softtabstop = 2
		vim.bo[bufnr].shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "help",
-- 	callback = function()
-- 		vim.keymap.set("n", "q", "<cmd>q<cr>", {})
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {"maxpat", "maxtheme", "maxstx"},
--   callback = function ()
--     vim.cmd('set filetype=json')
--   end
-- })
