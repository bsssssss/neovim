-- LSP --

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("K", function()
			vim.lsp.buf.hover({
				border = "single",
			})
		end, "Hover")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})

-- GenExpr language server
vim.api.nvim_create_autocmd("FileType", {
	pattern = "genexpr",
	callback = function()
		vim.defer_fn(function()
			vim.cmd(":InspectTree")
			local sendBottomKey = vim.api.nvim_replace_termcodes("<C-w>J", true, false, true)
			vim.api.nvim_feedkeys(sendBottomKey, "n", false)
		end, 100)
		vim.defer_fn(function()
			local goBack = vim.api.nvim_replace_termcodes("<C-w>k", true, false, true)
			vim.api.nvim_feedkeys(goBack, "n", false)
		end, 100)

		vim.lsp.start({
			name = "genexpr-language-server",
			cmd = { "node", vim.fn.expand("~/dev/github.com/bsssssss/genexpr-language-server/out/server/server.js"), "--stdio" },
			handlers = {
				["window/showMessage"] = function(_, result, ctx)
					vim.notify(result.message, vim.log.levels.INFO, { title = "GenExpr LSP" })
				end,
				["window/logMessage"] = function(_, result, ctx)
					vim.notify("LSP log: " .. result.message, vim.log.levels.DEBUG, {})
				end,
			},
			root_dir = vim.fn.getcwd(),
		})
	end,
})

-- Tidal language server
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

--------------------------------------------------------------------------------
-- OTHER --

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "qf" },
	desc = "Keymap to close help/qf window",
	callback = function()
		vim.keymap.set("n", "q", "<C-w>c<CR>", { buffer = true, desc = "Close help/qf split window" })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "LspReferenceText", timeout = 150 })
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

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "haskell", "c", "java" },
-- 	callback = function()
-- 		local bufnr = vim.api.nvim_get_current_buf()
-- 		vim.bo[bufnr].tabstop = 4
-- 		vim.bo[bufnr].softtabstop = 4
-- 		vim.bo[bufnr].shiftwidth = 4
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "lua", "json", "html" },
-- 	callback = function()
-- 		local bufnr = vim.api.nvim_get_current_buf()
-- 		vim.bo[bufnr].tabstop = 2
-- 		vim.bo[bufnr].softtabstop = 2
-- 		vim.bo[bufnr].shiftwidth = 2
-- 	end,
-- })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "max",
	callback = function()
		vim.cmd("set filetype=json")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "supercollider",
    callback = function ()
        vim.opt_local.expandtab = false;
    end
})
