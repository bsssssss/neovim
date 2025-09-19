return {
    {
        "nvim-mini/mini.nvim",
        config = function()
            local map = function (mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { desc = "Search: " .. desc })
            end

            require("mini.ai").setup()
            require("mini.surround").setup()
            -- require("mini.pairs").setup()
            require("mini.align").setup()
            require("mini.extra").setup()
            -- require("mini.pick").setup()
            --
            -- map("n", "<leader>sf", ":Pick files<CR>", "Files")
            -- map("n", "<leader>sb", ":Pick buffers<CR>", "Buffers")
            -- map("n", "<leader>sg", ":Pick grep_live<CR>", "Grep")
            -- map("n", "<leader>sh", ":Pick help<CR>", "Help")
            -- map("n", "<leader>sd", ":Pick diagnostic<CR>", "Diagnostic")
            -- map("n", "<leader>sm", ":Pick marks<CR>", "Marks")
            -- map("n", "<leader>so", ":Pick oldfiles<CR>", "Old files")
            --
            -- vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { link = "Normal" })
            -- vim.api.nvim_set_hl(0, "MiniPickNormal", { link = "Comment" })

            -- local hipatterns = require("mini.hipatterns")
            -- hipatterns.setup({
            --  highlighters = {
            --      hex_color = hipatterns.gen_highlighter.hex_color(),
            --  },
            -- })

        end,
    },
}
