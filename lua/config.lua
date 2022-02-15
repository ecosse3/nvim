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
  ui = {
    float = {
      border = 'rounded',
      highlight = 'NightflyRed' -- check available by :Telescope highlights
    }
  },
  plugins = {
    dashboard = {
      fuzzy_plugin = 'telescope' -- telescope/clap/fzf
    },
    package_info = {
      enabled = false
    },
    rooter = {
      -- Removing package.json from list in Monorepo Frontend Project can be helpful
      -- By that your live_grep will work related to whole project, not specific package
      patterns = {'.git', 'package.json', '_darcs', '.bzr', '.svn', 'Makefile'} -- Default
    },
    zen = {
      enabled = false,
      kitty_enabled = false
    },
  },
  icons = icons,
  statusline = {
    path_enabled = true,
    path = 'relative' -- absolute/relative
  },
  -- LSP settings (for overriding per client)
  -- Load servers (They will be automatically installed after next "Sync plugins" launch)
  -- Check installed servers by :LspInstallInfo
  lsp = {
    'bash',
    'css',
    'eslint',
    'graphql',
    'html',
    'json',
    'lua',
    'tailwind',
    'tsserver',
    'vue2'
  }
}

