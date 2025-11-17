return {
    "Olical/conjure",
    ft = { "racket" },
    lazy = true,
    init = function()
        -- Set configuration options here
        -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
        -- This is VERY helpful when reporting an issue with the project
        -- vim.g["conjure#debug"] = true
        vim.keymap.set("n", "<leader>E", "<cmd>ConjureEval<CR>", { desc = "Evaluate expression" })
    end,
}
