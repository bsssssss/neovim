return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        notify_on_error = false,
        -- stylua: ignore start
        formatters_by_ft = {
            c          = { "clang-format" },
            lua        = { "stylua" },
            html       = { "htmlbeautifier" },
            python     = { "black" },
            haskell    = { "stylish-haskell" },
            markdown   = { "mdformat" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
        },
        -- stylua: ignore end
    },
}
