return {
    "stevearc/oil.nvim",
    enabled = true,
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        columns = {
            "icon",
            -- "permissions",
            -- "size",
            -- "mtime",
        },
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<C-l>"] = "actions.select",
            ["<C-h>"] = { "actions.parent", mode = "n" },

            ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            -- ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        -- Configuration for the floating action confirmation window
        confirmation = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = 0.9,
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
        },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
