return {
    {
        -- "madskjeldgaard/fzf-sc",
        dir = "/Users/bss/dev/forks/fzf-sc",
        dependencies = {
            { dir = "/Users/bss/dev/forks/scnvim" },
            { "vijaymarupudi/nvim-fzf" },
            -- "davidgranstrom/scnvim",
        },
    },
    {
        -- "davidgranstrom/scnvim",
        dir = "/Users/bss/dev/forks/scnvim",
        -- "bsssssss/scnvim",
        -- branch = "dev",
        -- dev = true,
        enabled = true,
        dependencies = {
            { dir = "/Users/bss/dev/forks/telescope-scdoc.nvim" },
            { "madskjeldgaard/fzf-sc" },
            -- "davidgranstrom/telescope-scdoc.nvim"
        },
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
                    ["<C-x>"] = map("sclang.hard_stop", { "n", "x", "i" }),
                },
                editor = {
                    highlight = {
                        color = "LspReferenceText",
                        type = "flash",
                        flash = {
                            duration = 100,
                            repeats = 2,
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
                    size = math.floor(vim.o.columns * 0.4),
                },
                documentation = {
                    cmd = "/opt/homebrew/bin/pandoc",
                    tab = true,
                    horizontal = true,
                    direction = "top",
                },
                extensions = {
                    ["fzf-sc"] = {
                        options = {
                            title_pos = "left",
                            height = "max",
                            width = "max",
                            border = "rounded",
                            fzf_cli_args = "--height=~100% --prompt ' ' --pointer '>' --margin 1,2",
                        },
                    },
                },

                statusline = {
                    poll_interval = 0.2,
                },
            })

            ---@diagnostic disable-next-line: param-type-mismatch
            scnvim.load_extension("fzf-sc")

            -- apply custom options to documentation windows
            local on_open = require("scnvim.help").on_open
            ---@diagnostic disable-next-line: undefined-field
            on_open:append(function()
                vim.opt_local.number = false
                vim.opt_local.relativenumber = false
                vim.opt_local.wrap = true
            end)

            vim.api.nvim_create_user_command("SChelp", "SCNvimExt fzf-sc.fuzz help", { desc = "Supercollider: Open help (fzf-sc)" })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "supercollider" },
                callback = function()
                    -- vim.opt_local.statusline =
                    --     "%<%f %h%w%m%r %24.24{scnvim#statusline#server_status()}%=%{% luaeval('(package.loaded[''vim.diagnostic''] and next(vim.diagnostic.count()) and vim.diagnostic.status() .. '' '') or '''' ') %}%-14.(%l,%c%V%) %P"
                    vim.opt_local.statusline =
                        "%f %h%w%m%r %=%-40.32{scnvim#statusline#server_status()}%-14(%l,%c%V%) %P"
                end,
            })

            -- Snippets
            vim.g.scnvim_snippet_format = "luasnip"
            require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())
        end,
    },
}
