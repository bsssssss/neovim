---@diagnostic disable: need-check-nil
-- Detect system appearance (macOS only)
local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
local result = handle:read("*a")
handle:close()
local is_dark = result:match("Dark") ~= nil

local theme = {}

if is_dark then
    theme = {
        dir = "/Users/bss/dev/personal/nvim-colorscheme",
        lazy = false,
        config = function()
            vim.cmd("colorscheme nvim_colorscheme_dark")
        end,
    }
else
    theme = {
        dir = "/Users/bss/dev/personal/nvim-colorscheme",
        lazy = false,
        config = function()
            vim.cmd("colorscheme nvim_colorscheme_light")
        end,
    }
end

return theme
