return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            -- Useful status updates for LSP.
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    window = {
                        winblend = 0,
                    },
                },
            },
        },
    },
}
