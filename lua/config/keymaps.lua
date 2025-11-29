local map = vim.keymap.set

map({ "n", "x" }, "s", "<Nop>") -- Delete "s" mapping

map("n", "<C-i>", "<C-I>")

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open Quickfix list" })

map({ "n", "i" }, "<C-h>", "<C-w>h", { desc = "Switch left window" })
map({ "n", "i" }, "<C-l>", "<C-w>l", { desc = "Switch right window" })
map({ "n", "i" }, "<C-j>", "<C-w>j", { desc = "Switch down window" })
map({ "n", "i" }, "<C-k>", "<C-w>k", { desc = "Switch up window" })

-- map("n", "<leader>fb", "<cmd>Neotree toggle float reveal_force_cwd<CR>", { desc = "Neotree: Toggle" })

map("v", "<", "<gv")
map("v", ">", ">gv")

-- return to the cursor pos
map("n", "J", "m'J`'")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

map("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Zen mode" })

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map("v", "<leader>d", [["_d]], { desc = "Delete to void register" })

map("n", "<leader>cR", ":IncRename<CR>", { desc = "Incremenal Rename" })

map("n", "<leader>tc", function()
    if vim.bo.filetype == "java" then
        require("jdtls").test_class()
    end
end, { desc = "Java : Test Class" })

map("n", "<leader>tm", function()
    if vim.bo.filetype == "java" then
        require("jdtls").test_nearest_method()
    end
end, { desc = "Java : Test Method" })

map({ "n" }, "<leader>e", ":Oil<CR>", { desc = "File Explorer" })

map("n", "<TAB>", "<cmd>tabnext<CR>")
map("n", "<S-TAB>", "<cmd>tabprevious<CR>")

map("n", "<leader>m", "<cmd>make<CR>", { desc = "Run make" })

-- map({ "n", "t" }, "<leader>tt", function()
--  require("floaterm").toggle()
-- end, {})
