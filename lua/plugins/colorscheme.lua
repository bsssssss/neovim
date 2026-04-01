---@diagnostic disable: need-check-nil
-- Detect system appearance (macOS only)
local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
local result = handle:read("*a")
handle:close()
local is_dark = result:match("Dark") ~= nil

local theme = {}

if is_dark then
    theme = {
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
                            StatusLine = { bg = "NONE", fg = palette.dragonGray2 },
                            StatusLineNC = { bg = "NONE" },
                            MsgArea = { fg = palette.lotusGray3 },
                            Msg = { bg = "NONE" },
                            MsgSeparator = { bg = "NONE" },
                            TabLine = { bg = "NONE" },
                            TabLineFill = { link = "TabLine" },
                            SnacksIndentScope = { fg = palette.sumiInk6 },
                            SnacksIndent = { fg = palette.sumiInk4 },

                            LspReferenceText = { bg = palette.sumiInk5 },
                            LspReferenceWrite = { bg = "none", underline = true },

                            Folded = { link = "LineNr" },

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
                            Type = { bold = false, fg = palette.dragonTeal },
                            Comment = { fg = palette.dragonGray3 },
                            Operator = { fg = palette.dragonGray3 },
                            Special = { bold = true, fg = palette.lotusBlue3 },
                            Keyword = { bold = true, fg = palette.dragonBlue },
                            Boolean = { bold = false },

                            ["@markup.heading"] = { fg = palette.dragonOrange2, bold = true },
                            ["@method"] = { link = "Function" },
                            ["@variable"] = { fg = palette.dragonWhite },
                            ["@keyword.operator"] = { bold = true, fg = palette.dragonGray3 },
                            ["@lsp.type.macro.c"] = { bold = false, fg = palette.dragonRed },
                        }
                    end,
                    theme = "dragon",
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
else
    theme = {
        {
            "rose-pine/neovim",
            name = "rose-pine",
            config = function()
                require("rose-pine").setup({
                    variant = "dawn", -- auto, main, moon, or dawn
                    dark_variant = "main", -- main, moon, or dawn
                    dim_inactive_windows = false,
                    extend_background_behind_borders = true,

                    enable = {
                        terminal = true,
                        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                        migrations = true, -- Handle deprecated options automatically
                    },

                    styles = {
                        bold = true,
                        italic = true,
                        transparency = true,
                    },

                    groups = {
                        border = "muted",
                        link = "iris",
                        panel = "surface",

                        error = "love",
                        hint = "iris",
                        info = "foam",
                        note = "pine",
                        todo = "rose",
                        warn = "gold",

                        git_add = "foam",
                        git_change = "rose",
                        git_delete = "love",
                        git_dirty = "rose",
                        git_ignore = "muted",
                        git_merge = "iris",
                        git_rename = "pine",
                        git_stage = "iris",
                        git_text = "rose",
                        git_untracked = "subtle",

                        h1 = "iris",
                        h2 = "foam",
                        h3 = "rose",
                        h4 = "gold",
                        h5 = "pine",
                        h6 = "foam",

                        -- background = "none",
                    },

                    palette = {
                        -- Override the builtin palette per variant
                        -- moon = {
                        --     base = '#18191a',
                        --     overlay = '#363738',
                        -- },
                        dawn = {
                            gold = "#d58516",
                        },
                    },

                    -- NOTE: Highlight groups are extended (merged) by default. Disable this
                    -- per group via `inherit = false`
                    highlight_groups = {
                        Comment = { fg = "muted" },
                        -- StatusLine = { fg = "love", bg = "love", blend = 15 },
                        -- VertSplit = { fg = "muted", bg = "muted" },
                        -- Visual = { fg = "base", bg = "text", inherit = false },
                        Keyword = { bold = true },
                        Boolean = { bold = true },
                        String = { fg = "leaf" },
                        StatusLine = { bold = true },

                        -- Type = { bold = false },
                        ["@type"] = { bold = true },
                        ["@type.builtin"] = { bold = true },

                        ["@constant"] = { fg = "gold" },
                        ["@constant.macro"] = { fg = "love", bold = true },

                        ["@keyword.return"] = { bold = true },
                        ["@keyword.repeat"] = { bold = true },
                        ["@keyword.conditional"] = { bold = true },
                        -- ["@keyword.import"] = { bold = true },
                        ["@keyword.operator"] = { bold = true, fg = "muted" },

                        ["@string.escape"] = { bold = true },
                    },

                    -- before_highlight = function(group, highlight, palette)
                    --     -- Disable all undercurls
                    --     -- if highlight.undercurl then
                    --     --     highlight.undercurl = false
                    --     -- end
                    --     --
                    --     -- Change palette colour
                    --     -- if highlight.fg == palette.pine then
                    --     --     highlight.fg = palette.foam
                    --     -- end
                    -- end,
                })
                vim.cmd("colorscheme rose-pine")
            end,
        },
    }
end

return theme
