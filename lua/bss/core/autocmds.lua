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

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "haskell", "c", "java" },
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		vim.bo[bufnr].tabstop = 4
		vim.bo[bufnr].softtabstop = 4
		vim.bo[bufnr].shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "html", "json" },
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		vim.bo[bufnr].tabstop = 2
		vim.bo[bufnr].softtabstop = 2
		vim.bo[bufnr].shiftwidth = 2
	end,
})

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

-- Allow to save folds
-- vim.api.nvim_create_augroup("view_save", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufWrite" }, {
-- 	pattern = { "*" },
-- 	group = "view_save",
-- 	desc = "Save view state of current window when leaving",
-- 	callback = function()
-- 		vim.cmd("mkview")
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	group = "view_save",
-- 	pattern = { "*" },
-- 	desc = "Load view state of current window",
-- 	callback = function()
-- 		vim.cmd("silent! loadview")
-- 	end,
-- })

-- Force cursor reset on exit
-- vim.api.nvim_create_autocmd("VimLeave", {
--   callback = function()
--     vim.opt.guicursor = "a:ver25-blinkon1"
--   end,
-- })

-- Fix "Press Enter" bug with tmux splits
if os.getenv("TMUX") then
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*",
		command = "silent! redraw!",
	})
end
