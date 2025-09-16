return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        -- enabled = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            heading = {
                backgrounds = {},
            },
            bullet = {
                icons = { "•", "•", "•", "•" },
            },
            code = {
                enabled = true,
                language_name = false,
                sign = false,
                width = "block",
                border = "thick",
                disable_background = true,
                highlight_border = false,
                -- left_pad = 1,
                -- right_pad = 1,
            },
        },
    },
}
