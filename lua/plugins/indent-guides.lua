return {
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = true,
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "snacks_dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                    "man",
                },
            },
        },
        main = "ibl",
    },
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = {
                try_as_border = true,
                border = "top",
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "alpha",
                    "dashboard",
                    "snacks_dashboard",
                    "fzf",
                    "help",
                    "lazy",
                    "lazyterm",
                    "mason",
                    "neo-tree",
                    "notify",
                    "toggleterm",
                    "Trouble",
                    "trouble",
                    "man",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
}
