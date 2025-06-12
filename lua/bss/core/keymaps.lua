vim.keymap.set({ "n", "x" }, "s", "<Nop>") -- Delete "s" mapping

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open Quickfix list" })

vim.keymap.set({ "n", "i" }, "<C-h>", "<C-w>h", { desc = "Switch left window" })
vim.keymap.set({ "n", "i" }, "<C-l>", "<C-w>l", { desc = "Switch right window" })
vim.keymap.set({ "n", "i" }, "<C-j>", "<C-w>j", { desc = "Switch down window" })
vim.keymap.set({ "n", "i" }, "<C-k>", "<C-w>k", { desc = "Switch up window" })

-- vim.keymap.set("n", "<leader>fb", "<cmd>Neotree toggle float reveal_force_cwd<CR>", { desc = "Neotree: Toggle" })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- return to the cursor pos
vim.keymap.set("n", "J", "m'J`'")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "-- ZEN --" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>cR", ":IncRename ", { desc = "Incremenal Rename" })
