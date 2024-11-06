vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open Quickfix list" })

vim.keymap.set({ "n", "i" }, "<C-h>", "<C-w>h", { desc = "Switch left window" })
vim.keymap.set({ "n", "i" }, "<C-l>", "<C-w>l", { desc = "Switch right window" })
vim.keymap.set({ "n", "i" }, "<C-j>", "<C-w>j", { desc = "Switch down window" })
vim.keymap.set({ "n", "i" }, "<C-k>", "<C-w>k", { desc = "Switch up window" })

vim.keymap.set("n", "\\", "<cmd>Neotree toggle reveal_force_cwd<CR>", { desc = "Neotree: Toggle" })

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
