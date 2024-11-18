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
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
	pattern = { "gitcommit", "markdown", "md" },
	callback = function()
		vim.opt_local.textwidth = 80
		vim.opt_local.wrap = true
		vim.api.nvim_set_option_value("linebreak", true, { filetype = "markdown" })
		vim.opt_local.spell = true
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {"loclist", "qf"},
--   callback = function ()
--     vim.opt_local.wrap = true
--     vim.opt_local.linebreak = true
--     vim.opt_local.breakindent = true
--   end
-- })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tidal",
	callback = function()
    local logfile = "/tmp/tidal_ls.log"
		vim.lsp.start({
			name = "tidal_ls",
			cmd = { "sh", "-c", vim.fn.expand("~/.local/bin/tidal-ls"), "2>" .. logfile },
			-- cmd = { vim.fn.expand("~/.local/bin/tidal-ls") },
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
