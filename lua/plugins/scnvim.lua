return {
    {
        "bsssssss/scnvim",
        -- dir = "/Users/bss/dev/forks/scnvim",
        branch = "dev",
        enabled = true,
        dependencies = { "davidgranstrom/telescope-scdoc.nvim" },
        event = { "FileType supercollider" },
        config = function()
            local scnvim = require("scnvim")
            local map = scnvim.map
            local map_expr = scnvim.map_expr

            -- Setup scnvim
            scnvim.setup({
                keymaps = {
                    ["<C-S-E>"] = map("editor.send_line", { "i", "n" }),
                    ["<C-E>"] = {
                        map("editor.send_block", { "n", "i" }),
                        map("editor.send_selection", "x"),
                    },
                    ["<CR>"] = map("postwin.toggle"),
                    ["<C-CR>"] = map("postwin.toggle", "i"),
                    ["<C-S-X>"] = map("postwin.clear", { "n", "i" }),
                    ["<C-.>"] = map("sclang.hard_stop", { "n", "x", "i" }),
                },
                editor = {
                    highlight = {
                        color = "LspReferenceText",
                        type = "flash",
                        flash = {
                            duration = 100,
                            repeats = 1,
                        },
                    },
                    force_ft_supercollider = false,
                    auto_start = false,
                },
                postwin = {
                    highlight = true,
                    auto_toggle_error = true,
                    horizontal = false,
                    direction = "right",
                    size = math.floor(vim.o.columns * 0.5),
                },
                documentation = {
                    cmd = "/opt/homebrew/bin/pandoc",
                },
            })

            -- Snippets
            vim.g.scnvim_snippet_format = "luasnip"
            require("luasnip").add_snippets(
                "supercollider",
                require("scnvim/utils").get_snippets()
            )
        end,
    },
}
