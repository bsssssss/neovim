return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    dark_variant = "moon", -- main, moon, or dawn
    extend_background_behind_borders = true,
    styles = {
      transparency = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
}
