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
    zen = {
      enabled = true,
      kitty_enabled = true
    },
    package_info = {
      enabled = false
    }
  },
  icons = icons,
}
