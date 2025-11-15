return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
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
                    ---@type PaletteColors
                    palette = {},
                    theme = {
                        wave = {},
                        lotus = {},
                        dragon = {
                            ui = {
                                bg = "#222222",
                                fg = "#c6b7a0",
                                float = {
                                    fg = "#c6b7a0",
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
                                added = "#8a9a7b",
                                changed = "#a292a3",
                                removed = "#c4746e",
                            },
                        },
                    },
                },
                ---@param colors KanagawaColorsSpec
                overrides = function(colors) -- add/modify highlights
                    ---@type ThemeColors
                    local theme = colors.theme
                    ---@type PaletteColors
                    local palette = colors.palette
                    return {
                        EndOfBuffer = { link = "LineNr" },
                        CursorLine = { bg = "NONE" },
                        CursorLineNr = { fg = palette.dragonViolet, bold = true },
                        LineNr = { fg = palette.sumiInk6 },
                        StatusLine = { bg = "NONE", fg = "#c6b7a0" },
                        StatusLineNC = { bg = "NONE" },
                        MsgArea = { fg = palette.lotusGray3 },
                        TabLine = { bg = "NONE" },
                        TabLineFill = { link = "TabLine" },
                        -- IblIndent = { fg = palette.sumiInk4 },
                        -- MiniIndentscopeSymbol = { fg = palette.sumiInk6 },
                        SnacksIndentScope = { fg = palette.sumiInk6 },
                        SnacksIndent = { fg = palette.sumiInk4 },

                        LspReferenceText = { bg = palette.sumiInk5 },
                        LspReferenceWrite = { bg = "none", underline = true },

                        Pmenu = { bg = palette.sumiInk4 }, -- add `blend = vim.o.pumblend` to enable transparency
                        PmenuSel = { fg = "NONE", bg = palette.sumiInk5, bold = true },
                        PmenuSbar = { bg = palette.sumiInk4 },
                        PmenuThumb = { bg = palette.sumiInk6 },
                        PmenuExtra = { bg = "NONE" },

                        TelescopeResultsBorder = { link = "FloatBorder" },
                        TelescopePromptBorder = { link = "FloatBorder" },
                        TelescopePreviewBorder = { link = "FloatBorder" },

                        -- Normal = { fg = "#c6b7a0" },
                        Visual = { bg = palette.sumiInk5 },
                        LazyGitFloat = { fg = "#c6b7a0" },
                        LazyGitBorder = { link = "FloatBorder" },
                        Comment = { fg = palette.dragonAsh },
                        Operator = { fg = palette.dragonGray3 },
                        Special = { bold = true },
                        ["@markup.heading"] = { fg = palette.dragonOrange2, bold = true },
                        ["@method"] = { link = "Function" },
                        ["@variable"] = { fg = palette.dragonWhite },
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
}
