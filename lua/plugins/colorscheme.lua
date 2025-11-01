return {
    -- {
    --  "f-person/auto-dark-mode.nvim",
    --  enabled = false,
    --  opts = {
    --      set_dark_mode = function()
    --          vim.api.nvim_set_option_value("background", "dark", {})
    --          vim.cmd("colorscheme kanagawa-dragon")
    --      end,
    --      set_light_mode = function()
    --          vim.api.nvim_set_option_value("background", "light", {})
    --          vim.cmd("colorscheme solarized")
    --      end,
    --      update_interval = 3000,
    --      fallback = "dark",
    --  },
    -- },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,

        config = function()
            local ui = {
                p1 = "#1d1b19",
                p2 = "#23201e",
                p3 = "#282523",
                p4 = "#49443f",
                p5 = "#655e57",
                fg = "#c6b7a0"
            }
            -- Default options:
            require("kanagawa").setup({
                compile = false,
                undercurl = true,
                commentStyle = { italic = false },
                functionStyle = {},
                keywordStyle = { italic = false, bold = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = true,
                dimInactive = false,
                terminalColors = true,
                colors = {
                    palette = {},
                    theme = {
                        wave = {},
                        lotus = {},
                        dragon = {
                            ui = {
                                bg = "#222222",
                                float = {
                                    fg = ui.fg,
                                },
                            },
                        },
                        all = {
                            ui = {
                                float = {
                                    bg = "none",
                                    bg_border = "none",
                                },
                                bg_gutter = "none",
                            },
                            diag = {
                                error = "#E46876",
                                warning = "#DCA561",
                            },
                            vcs = {
                                removed = "#c4746e",
                                added = "#8a9a7b",
                                changed = ui.p4,
                            },
                        },
                    },
                },
                overrides = function(colors) -- add/modify highlights
                    local theme = colors.theme
                    return {
                        EndOfBuffer = { link = "LineNr" },
                        CursorLine = { bg = "NONE" },
                        CursorLineNr = { fg = colors.palette.dragonTeal, bold = true },
                        LineNr = { fg = ui.p4 },
                        TabLine = { bg = "NONE" },
                        TabLineFill = { link = "TabLine" },
                        StatusLine = { bg = "NONE", fg = "#c6b7a0" },
                        StatusLineNC = { bg = "NONE" },
                        MsgArea = { fg = colors.palette.dragonViolet },

                        IblIndent = { fg = colors.palette.sumiInk4 },
                        MiniIndentscopeSymbol = { fg = colors.palette.sumiInk6 },

                        LspReferenceText = { bg = ui.p1 },
                        LspReferenceWrite = { bg = "none", underline = true },

                        Pmenu = { fg = theme.ui.shade0, bg = ui.p1, blend = 50 }, -- add `blend = vim.o.pumblend` to enable transparency
                        PmenuSel = { fg = "NONE", bg = ui.p3 },
                        PmenuSbar = { bg = ui.p1 },
                        PmenuThumb = { bg = ui.p3 },
                        PmenuExtra = { bg = "NONE" },

                        TelescopeResultsBorder = { link = "FloatBorder" },
                        TelescopePromptBorder = { link = "FloatBorder" },
                        TelescopePreviewBorder = { link = "FloatBorder" },

                        Normal = { fg = ui.fg },
                        Visual = { bg = ui.p2 },
                        FloatBorder = { fg = ui.p4 },
                        LazyGitFloat = { fg = "#c6b7a0" },
                        LazyGitBorder = { link = "FloatBorder" },
                        Comment = { fg = ui.p5 },
                        Operator = { fg = colors.palette.dragonGray3 },
                        Special = { bold = true },
                        ["@markup.heading"] = { fg = colors.palette.dragonOrange2, bold = true },
                        ["@method"] = { link = "Function" },
                    }
                end,
                -- theme = "dragon",
                -- background = {
                --  dark = "dragon",
                --  light = "lotus",
                -- },
            })

            -- setup must be called before loading
            vim.cmd("colorscheme kanagawa-dragon")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        -- config = function()
        --     vim.cmd("colorscheme rose-pine")
        -- end
    },
}
