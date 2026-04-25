return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = [[<c-\>]],

            shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
            shading_factor = -8, -- the percentage by which to lighten dark terminal background, default: -30
            shading_ratio = -3, -- the ratio of shading factor for light/dark terminal background, default: -3
        },
    },
}
