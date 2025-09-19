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
                                    fg = "#c4b28a",
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
                overrides = function(colors) -- add/modify highlights
                    local theme = colors.theme
                    return {
                        -- stylua: ignore start
                        Normal                = { fg = "#c6b7a0" },
                        Comment               = { fg = colors.palette.dragonBlack6 },
                        Visual                = { bg = theme.ui.bg_p2 },
                        -- CursorLine            = { bg = theme.ui.bg_p1 },
                        CursorLine            = { bg = "NONE" },
                        CursorLineNr          = { fg = colors.palette.dragonBlue2, bold = true },
                        LineNr                = { fg = colors.palette.dragonBlack6 },
                        -- StatusLine            = { bg = theme.ui.bg_p1, fg = "#c6b7a0" },
                        -- StatusLineNC          = { bg = theme.ui.bg_p1 },
                        -- StatusLine            = { bg = "#2f2b2b", fg = "#c6b7a0" },
                        -- StatusLineNC          = { bg = "#2f2b2b" },
                        StatusLine            = { bg = "NONE", fg = "#c6b7a0" },
                        StatusLineNC          = { bg = "NONE" },
                        Operator              = { fg = colors.palette.dragonGray3 },
                        MsgArea               = { fg = colors.theme.syn.keyword },
                        IblIndent             = { fg = theme.ui.bg_p2 },
                        MiniIndentscopeSymbol = { fg = colors.palette.dragonBlack6 },
                        -- Special               = { bold = true },
                        -- LspReferenceText      = { bg = "none", bold = true },
                        LspReferenceText      = { bg = theme.ui.bg_p2 },
                        LspReferenceWrite     = { bg = "none", underline = true },
                        Pmenu                 = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                        PmenuSel              = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar             = { bg = theme.ui.bg_m1 },
                        PmenuThumb            = { bg = theme.ui.bg_p2 },
                        PmenuExtra            = { bg = "NONE" },
                        ObsidianRefText       = { fg = colors.palette.dragonGray3 },
                        ["@markup.heading"]   = { fg = colors.palette.dragonOrange2, bold = true },
                        -- ["@keyword.operator"] = { link = "Operator" },

                        -- Keyword = { bold = true },
                        -- ["@variable"] = { link = "Normal" },
                        -- stylua: ignore end
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
