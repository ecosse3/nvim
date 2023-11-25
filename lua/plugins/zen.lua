require("zen-mode").setup({
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    width = 0.8, -- width of the Zen window
    height = 1,  -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false,                -- disables the ruler text in the cmd line area
      showcmd = false,              -- disables the command in the last line of the screen
    },
    twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = true },  -- disables git signs
    tmux = { enabled = false },     -- disables the tmux statusline
    alacritty = {
      enabled = EcoVim.plugins.zen.alacritty_enabled or false,
      font = "14", -- font size
    },
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = EcoVim.plugins.zen.kitty_enabled or false,
      font = "+3", -- font size increment
    },
    wezterm = {
      enabled = EcoVim.plugins.zen.wezterm_enabled or false,
      -- can be either an absolute font size or the number of incremental steps
      font = "+4", -- (10% increase per step)
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function()
    require("gitsigns.actions").toggle_current_line_blame()
    require("ibl").update({enabled = false})
    vim.opt.relativenumber = false
    vim.opt.signcolumn = "no"
    require("gitsigns.actions").refresh()
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
    require("gitsigns.actions").toggle_current_line_blame()
    require("ibl").update({enabled = true})
    vim.opt.relativenumber = true
    vim.opt.signcolumn = "yes:2"
    require("gitsigns.actions").refresh()
  end,
})
