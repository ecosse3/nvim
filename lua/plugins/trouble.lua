require("trouble").setup {
  height      = 10, -- height of the trouble list
  icons       = true, -- use dev-icons for filenames
  mode        = "workspace", -- "workspace" or "document"
  fold_open   = "", -- icon used for open folds
  fold_closed = "", -- icon used for closed folds
  action_keys = { -- key mappings for actions in the trouble list
      close       = "q", -- close the list
      refresh     = "r", -- manually refresh
      jump        = "<cr>", -- jump to the diagnostic or open / close folds
      toggle_mode = "m", -- toggle between "workspace" and "document" mode
      close_folds = "zM", -- close all folds
      cancel      = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
      open_folds  = "zR", -- open all folds
      previous    = "k", -- preview item
      next        = "j" -- next item
  },
  indent_lines = true, -- add an indent guide below the fold icons
  auto_open    = false, -- automatically open the list when you have diagnostics
  auto_close   = false, -- automatically close the list when you have no diagnostics
  signs = {
      -- icons / text used for a diagnostic
      error       = "",
      warning     = "",
      hint        = "",
      information = ""
  },
  use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
};

require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
};

