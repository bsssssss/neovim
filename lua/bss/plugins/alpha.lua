return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      [[                                                            ]],
      [[ 888b    888                  888     888 d8b               ]],
      [[ 8888b   888                  888     888 Y8P               ]],
      [[ 88888b  888                  888     888                   ]],
      [[ 888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b.  ]],
      [[ 888 Y88b888 d8P  Y8b d88""88b Y88b d88P  888 888 "888 "88b ]],
      [[ 888  Y88888 88888888 888  888  Y88o88P   888 888  888  888 ]],
      [[ 888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888 ]],
      [[ 888    Y888  "Y8888   "Y88P"     Y8P     888 888  888  888 ]],
      [[                                                            ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '  > Find file', ':cd $HOME | Telescope find_files<CR>'),
      dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('s', '  > Settings', ':e $MYVIMRC | :cd %:p:h | <CR>'),
      dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
    }

    alpha.setup(dashboard.opts)
  end,
}
