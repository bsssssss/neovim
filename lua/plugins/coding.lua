return {
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", { silent = true, desc = "Toggle Undo Tree" })
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
  {
    "echasnovski/mini.align",
    config = function()
      require("mini.align").setup({})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources({
        {
          name = "nvim_lsp",
        },
        { name = "path" },
      }, {
        {
          name = "buffer",
          -- entry_filter = function(entry, ctx)
          --   return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
          -- end,
        },
      })
    end,
  },
  { "Summeli/html-entities.nvim", config = true },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "haskell",
      })
    end,
  },
}
