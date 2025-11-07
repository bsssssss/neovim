return {
  "ovalnine/processing.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    -- Optional dependencies
    -- "hrsh7th/cmp-nvim-lsp", -- For enhanced LSP completions
  },
  config = function()
    require("processing").setup({
      -- Optional: custom configuration
      processing_path = "processing", -- Path to processing executable
      mappings = {
        run = "<leader>pr",
        present = "<leader>pp",
        export = "<leader>pe",
        create = "<leader>pc",
      },
    })
  end,
  ft = { "processing", "pde" }, -- Load only for Processing files
}
