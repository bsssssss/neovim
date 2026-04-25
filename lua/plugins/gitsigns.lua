return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gs = require("gitsigns")
                vim.keymap.set("n", "]h", function()
                    if vim.wo.diff then
                        return "]h"
                    end
                    vim.schedule(function()
                        gs.nav_hunk("next")
                    end)
                    return "<Ignore>"
                end, { buf = bufnr, expr = true, desc = "Git: next hunk" })
                vim.keymap.set("n", "[h", function()
                    if vim.wo.diff then
                        return "[h"
                    end
                    vim.schedule(function()
                        gs.nav_hunk("prev")
                    end)
                    return "<Ignore>"
                end, { buf = bufnr, expr = true, desc = "Git: previous hunk" })
            end,
        })
    end,
}
