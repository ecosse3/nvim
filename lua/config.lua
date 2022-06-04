------------------------------------------------
--                                            --
--    This is a main configuation file for    --
--                    EcoVim                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local icons = require('icons')

EcoVim = {
  colorscheme = 'tokyonight',
  ui = {
    float = {
      border = 'rounded'
    }
  },
  plugins = {
    completion = {
      select_first_on_enter = false
    },
    dashboard = {
      fuzzy_plugin = 'telescope' -- telescope/clap/fzf
    },
    rooter = {
      -- Removing package.json from list in Monorepo Frontend Project can be helpful
      -- By that your live_grep will work related to whole project, not specific package
      patterns = {'.git', 'package.json', '_darcs', '.bzr', '.svn', 'Makefile'} -- Default
    },
    zen = {
      kitty_enabled = false
      enabled = true, -- sync after change
    },
  },
  icons = icons,
  statusline = {
    path_enabled = true,
    path = 'relative' -- absolute/relative
  }
}

