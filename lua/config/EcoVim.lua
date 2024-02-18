------------------------------------------------
--                                            --
--    This is a main configuration file for    --
--                    EcoVim                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local icons = require("utils.icons")

EcoVim = {
  --colorscheme = "tokyonight",
  --colorscheme = "onedark_dark",
  -- colorscheme = "selenized",
  -- colorscheme = "modus_vivendi",     -- the dark theme.
  -- colorscheme = "palenight",
  -- colorscheme = "everforest",
  colorscheme = "gruvbox",
  -- colorscheme = "modus_operandi", -- the light theme.
  ui = {
    float = {
      border = "rounded",
    },
  },
  plugins = {
    ai = {
      chatgpt = {
        enabled = false,
      },
      codeium = {
        enabled = false,
      },
      copilot = {
        enabled = true,
      },
      tabnine = {
        enabled = false,
      },
    },
    completion = {
      select_first_on_enter = false,
    },
    -- Completely replaces the UI for messages, cmdline and the popupmenu
    experimental_noice = {
      enabled = true,
    },
    -- Enables moving by subwords and skips significant punctuation with w, e, b motions
    jump_by_subwords = {
      enabled = false,
    },
    rooter = {
      -- Removing package.json from list in Monorepo Frontend Project can be helpful
      -- By that your live_grep will work related to whole project, not specific package
      patterns = { "*.git", ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" }, -- Default
    },
    -- <leader>z
    zen = {
      alacritty_enabled = true,
      kitty_enabled = false,
      wezterm_enabled = false,
      enabled = true, -- sync after change
    },
  },
  -- Please keep it
  icons = icons,
  -- Statusline configuration
  statusline = {
    path_enabled = true,
    path = "relative", -- absolute/relative
  },
  lsp = {
    virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
  },
}
