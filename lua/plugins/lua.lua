return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                plugins = {
                    "nvim-dap-ui",
                    types = true,
                },
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "Bilal2453/luvit-meta",
        lazy = true,
    },
}
