return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    config = function()
        local kana = require("kanagawa.colors").setup()
        local colors = {
            -- bg = kana.theme.ui.bg_m1,
            bg = nil,
            fg = kana.theme.syn.keyword,
            -- warm = "#c4b28a",
            warm = kana.theme.syn.identifier,
            blue = kana.palette.dragonBlue2,
            green = kana.palette.dragonGreen2,
            orange = kana.palette.dragonOrange,
            black = "#000000",
        }
        local theme = {
            normal = {
                a = { bg = colors.bg, fg = colors.fg },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
                x = { bg = colors.bg, fg = colors.fg },
                y = { bg = colors.bg, fg = colors.fg },
                z = { bg = colors.bg, fg = colors.fg },
            },
        }

        local function encoding()
            local fencoding = vim.o.fileencoding
            if fencoding ~= "utf-8" then
                return fencoding
            else
                return ""
            end
        end

        local function scstatus()
            if vim.bo.filetype == "supercollider" or true then
                local stat = require("scnvim.statusline").get_server_status()
                stat = stat:gsub("%%", "%%%%")
                return stat
            else
                return ""
            end
        end

        require("lualine").setup({
            options = {
                globalstatus = true,
                component_separators = { left = "›", right = "" },
                section_separators = { left = "", right = "" },
                theme = theme,
                disabled_filetypes = {
                    "snacks_picker_list",
                    "snacks_dashboard",
                },
                refresh = {
                    statusline = 500,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16, -- ~60fps
                    events = {
                        "WinEnter",
                        "BufEnter",
                        "BufWritePost",
                        "SessionLoadPost",
                        "FileChangedShellPost",
                        "VimResized",
                        "Filetype",
                        "CursorMoved",
                        "CursorMovedI",
                        "ModeChanged",
                    },
                },
            },

            sections = {
                lualine_a = {
                    {
                        "branch",
                        icons_enabled = true,
                        color = { gui = "bold" },
                    },
                    { "filename", icons_enabled = true },
                    { "diagnostics", source = { "nvim" } },
                },
                lualine_b = {},
                lualine_c = {},

                lualine_x = {
                    { scstatus },
                },
                lualine_y = {
                    { "filetype", icons_enabled = false },
                    { encoding },
                },
                lualine_z = {
                    { "location", color = { gui = "bold" } },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    { "filename" },
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    { "location", color = { gui = "bold" } },
                },
            },
        })
    end,
}
