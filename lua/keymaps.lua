-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y')

vim.keymap.set("n", "<leader>x", "<cmd> Explore <CR>", { desc = "Netrw: E[X]plore" })

vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Dap: Add [B]reakpoint at current line" })
vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Dap: Start or [R]esume the debugger" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Scheme for Max ]]
--
local function set_scm_keymaps()
	local path = "~/Code/projects/nvim-s4m/sendtomax/"
	local venv_activate = "source " .. path .. "venv/bin/activate && "
	local command = venv_activate .. "python3 " .. path .. "/sendtomax.py"

	vim.api.nvim_buf_set_keymap(
		0,
		"n",
		"<leader>e",
		"va):w !" .. command .. "<CR><CR>",
		{ noremap = true, silent = false, desc = "S4M: [E]valuate s-expr" }
	)
	vim.api.nvim_buf_set_keymap(
		0,
		"v",
		"<leader>e",
		":w !" .. command .. "<CR><CR>",
		{ noremap = true, silent = false, desc = "S4M: [E]valuate visual selection" }
	)
	vim.api.nvim_buf_set_keymap(
		0,
		"n",
		"<D-e>",
		"<Esc>va):w !" .. command .. "<CR><CR>va)dgg^i",
		{ noremap = true, silent = false }
	)
	vim.api.nvim_buf_set_keymap(
		0,
		"i",
		"<D-e>",
		"<Esc>va):w !" .. command .. "<CR><CR>va)dgg^i",
		{ noremap = true, silent = false }
	)
end

vim.api.nvim_create_augroup("SCMFileTypeGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "scheme", -- FileType for .scm files
	group = "SCMFileTypeGroup",
	callback = function()
		set_scm_keymaps()
		print("Scheme file detected ! <leader>e to send to max")
	end,
})

local telescope = require("telescope")
local dap = require("dap")
local dapui = require("dapui")
local remap = require("remap")
local nnoremap = remap.nnoremap

-- Start
nnoremap("<F9>", function()
	dap.continue()
	dapui.open()
end)
-- Exit
nnoremap("<F7>", function()
	dap.terminate()
	dapui.close()
	vim.cmd("sleep 50ms")
	dap.repl.close()
end)
-- Restart
nnoremap("<F21>", function()
	dap.terminate()
	vim.cmd("sleep 50ms")
	dap.repl.close()
	dap.continue()
end) -- Shift F9
nnoremap("<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
nnoremap("<F8>", function()
	dap.toggle_breakpoint()
end)
nnoremap("<F20>", function()
	dap.clear_breakpoints()
end) -- SHIFT+F8
nnoremap("<F10>", function()
	dap.step_over()
end)
nnoremap("<leader>rc", function()
	dap.run_to_cursor()
end)
nnoremap("<F11>", function()
	dap.step_into()
end)
nnoremap("<F12>", function()
	dap.step_out()
end)
nnoremap("<leader>dp", function()
	dap.pause()
end)
nnoremap("<leader>dtc", function()
	telescope.extensions.dap.commands({})
end)

-- vim: ts=2 sts=2 sw=2 et
