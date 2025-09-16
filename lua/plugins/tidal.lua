return {
    -- {
    --  -- "bsssssss/tidal.nvim",
    --  dir = "/Users/bss/dev/personal/tidal.nvim",
    --  -- branch = "dev",
    --  ft = "tidal",
    --  enabled = true,
    --  config = function()
    --      require("tidal").setup({
    --          tidal_boot = "/Users/bss/livecoding/tidal/setup/BootTidal.hs",
    --      })
    --      vim.api.nvim_create_autocmd("FileType", {
    --          pattern = "tidal",
    --          callback = function()
    --              vim.keymap.set(
    --                  { "n", "i" },
    --                  "<C-e>",
    --                  "<cmd>TidalEval<CR>",
    --                  { desc = "Send to Tidal" }
    --              )
    --              vim.keymap.set(
    --                  { "n", "i" },
    --                  "<C-.>",
    --                  "<cmd>TidalHush<CR>",
    --                  { desc = "Hush Tidal" }
    --              )
    --              vim.keymap.set(
    --                  "n",
    --                  "<CR>",
    --                  "<cmd>TidalPostWindowToggle<CR>",
    --                  { desc = "Toggle Tidal post window" }
    --              )
    --          end,
    --      })
    --  end,
    -- },
    {
        -- "thgrund/tidal.nvim",
        dir = "/Users/bss/dev/forks/tidal.nvim",
        dev = true,
        ft = "tidal",
        opts = {
            --- Configure TidalLaunch command
            boot = {
                tidal = {
                    --- Command to launch ghci with tidal installation
                    cmd = "ghci",
                    args = { "-v0" },
                    --- Tidal boot file path
                    file = "/Users/bss/livecoding/tidal/setup/BootTidal.hs",
                    enabled = true,
                    highlight = {
                        autostart = true,
                        osc = {
                            ip = "127.0.0.1",
                            port = 6013,
                        },
                        styles = {
                            osc = {
                                ip = "127.0.0.1",
                                port = 3335,
                            },
                               global = {
                                   baseName = "TidalPattern",
                                   --- @type vim.api.keyset.highlight
                                   style = {
                                       bg = "NONE",
                                       foreground = "NONE",
                                       underline = true,
                                   },
                               },
                        },
                        fps = 30,
                    },
                },
                sclang = {
                    --- Command to launch SuperCollider
                    cmd = "sclang",
                    args = {},
                    -- SuperCollider boot file
                    -- file = vim.api.nvim_get_runtime_file(
                    --  "bootfiles/BootSuperDirt.scd",
                    --  false
                    -- )[1],
                    file = "/Users/bss/supercollider/superdirt-setup/superdirt-startup.scd",
                    enabled = true,
                },
                split = "v",
            },
            --- Default keymaps
            --- Set to false to disable all default mappings
            --- @type table | nil
            mappings = {
                send_line = { mode = { "i", "n" }, key = "<S-CR>" },
                send_visual = { mode = { "x" }, key = "<M-CR>" },
                send_block = { mode = { "i", "n" }, key = "<M-CR>" },
                -- send_node = { mode = "n", key = "<leader><CR>" },
                send_silence = { mode = "n", key = "<leader>d" },
                send_hush = { mode = "n", key = "<C-.>" },
            },
            ---- Configure highlight applied to selections sent to tidal interpreter
            selection_highlight = {
                --- Highlight definition table
                --- see ':h nvim_set_hl' for details
                --- @type vim.api.keyset.highlight
                highlight = { link = "Comment" },
                --- Duration to apply the highlight for
                timeout = 150,
            },
        },
        -- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            opts = { ensure_installed = { "haskell", "supercollider" } },
        },
        -- config = function(_, opts)
        --  require("tidal").setup(opts)
        --  vim.api.nvim_set_hl(0, "CodeHighlight", { fg = "NONE", underline = true })
        -- end,
    },
}
