return {
    {
        dir = "/Users/bss/dev/personal/sapf.nvim",
        enabled = false,
        opts = {},
        config = function(_, opts)
            require("sapf").setup(opts)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "sapf",
                callback = function()
                    vim.keymap.set(
                        { "n", "i" },
                        "<C-e>",
                        "<cmd>SapfEval<CR>",
                        { desc = "Send to Sapf" }
                    )
                    vim.keymap.set(
                        { "n", "i" },
                        "<C-.>",
                        "<cmd>SapfStop<CR>",
                        { desc = "Stop Sapf" }
                    )
                    vim.keymap.set(
                        "n",
                        "<CR>",
                        "<cmd>SapfPostWindowToggle<CR>",
                        { desc = "Toggle Sapf post window" }
                    )
                    vim.keymap.set(
                        "n",
                        "<C-S-X>",
                        "<cmd>SapfPostWindowClear<CR>",
                        { desc = "Toggle Sapf post window" }
                    )
                end,
            })
        end,
    },
    -- {
    --  "vasilymilovidov/sapf.nvim",
    --  lazy = false,
    --  enabled = true,
    --  config = function()
    --      require("sapf").setup({
    --          interpreter = "sapf", -- path to sapf
    --          debug = false,
    --          window = {
    --              width = 0.4,
    --              position = "right",
    --          },
    --          buffer = {
    --              syntax_highlighting = false, -- toggle syntax highlighting in REPL (uses Scheme highlighting)
    --          },
    --      })
    --  end,
    --  keys = {
    --      -- { "<leader>on", "<cmd>SapfStart<cr>", desc = "Start Sapf" },
    --      -- { "<leader>ok", "<cmd>SapfKill<cr>", desc = "Kill Sapf" },
    --      { "<C-.>", "<cmd>SapfStop<cr>", desc = "Send Stop Message" },
    --      { "<C->>", "<cmd>SapfClear<cr>", desc = "Send Clear Message" },
    --      {
    --          "<C-e>",
    --          "<cmd>SapfEvalParagraph<cr>",
    --          desc = "Evaluate Paragraph",
    --      },
    --      {
    --          "<C-S-E>",
    --          "<cmd>SapfRunMultiple<cr>",
    --          desc = "Run Multiple Paragraphs",
    --      },
    --      -- {
    --      --  "K",
    --      --  "<cmd>SapfStopAndEval<cr>",
    --      --  desc = "Send Stop and Reeval",
    --      -- },
    --      { "K", "<cmd>SapfFunctionHelp<cr>", desc = "Function Help" },
    --  },
    -- },
}
