return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>sf",
        function()
          local function telescope_buffer_dir()
            return vim.fn.expand("%:h:p")
          end
          require("telescope").extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
        },
      }
      telescope.setup(opts)
      telescope.load_extension("file_browser")
    end,
  },
}
