  require('gitsigns').setup {
    signs = {
      add          = {hl = 'GitGutterAdd',    text = '│', numhl='GitSignsAddNr'},
      change       = {hl = 'GitGutterChange', text = '│', numhl='GitSignsChangeNr'},
      delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitSignsDeleteNr'},
      topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitSignsDeleteNr'},
      changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitSignsChangeNr'},
    },
    numhl = false,
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
      ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

      ['n <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>ghb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    },
    watch_index = {
      interval = 700
    },
    sign_priority = 6,
    status_formatter = nil, -- Use default
  }
