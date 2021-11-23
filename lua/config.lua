------------------------------------------------
--                                            --
--    This is a main configuation file for    --
--                    EcoVim                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local icons = require('icons')

EcoVim = {
  colorscheme = 'nightfly', -- nightfly/tokyonight
  plugins = {
    dashboard = {
      fuzzy_plugin = 'telescope' -- telescope/clap/fzf
    },
    package_info = {
      enabled = false
    },
    zen = {
      enabled = false,
      kitty_enabled = true
    },
  },
  icons = icons,
}
