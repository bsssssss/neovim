return {
    "f-person/auto-dark-mode.nvim",
    opts = {
        set_dark_mode = function()
            vim.cmd("colorscheme nvim_colorscheme_dark")
        end,
        set_light_mode = function()
            vim.cmd("colorscheme nvim_colorscheme_light")
        end,
        update_interval = 250,
        fallback = "dark",
    },
}
