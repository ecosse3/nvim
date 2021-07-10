require'which-key'.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = { operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = {"<leader>"}, -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {

  -- ignore
  ["d"] = "which_key_ignore",
  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["5"] = "which_key_ignore",
  ["6"] = "which_key_ignore",
  ["7"] = "which_key_ignore",
  ["8"] = "which_key_ignore",
  ["9"] = "which_key_ignore",

  -- single
  ["/"] = { ':e $MYVIMRC<CR>',                                     'open init' },
  ["+"] = { '<cmd>vertical resize +2<CR>',                         'resize +2' },
  ["-"] = { '<cmd>vertical resize -2<CR>',                         'resize +2' },
  ["="] = { '<C-W>=',                                              'balance windows' },
  ["S"] = { '<cmd>Startify<CR>',                                   'startify' },
  ["u"] = { '<cmd>UndotreeToggle<CR>',                             'undo tree' },
  ["v"] = { '<C-W>v',                                              'split right' },
  ["V"] = { '<C-W>s',                                              'split below' },

  a = {
    name = "Actions",
    c = { '<cmd>ColorizerToggle<CR>',                              'colorizer' },
    l = { '<cmd>Bracey<CR>',                                       'start live server' },
    L = { '<cmd>BraceyStop<CR>',                                   'stop live server' },
    m = { '<cmd>MarkdownPreview',                                  'markdown preview' },
    M = { '<cmd>MarkdownPreviewStop',                              'markdown preview stop' },
    n = { '<cmd>set nonumber!',                                    'line numbers' },
    r = { '<cmd>set norelativenumber!',                            'relative number' },
    t = { '<cmd>FloatermNew<CR>',                                  'terminal' },
  },

  b = {
    name = "Buffer",
    b = { '<cmd>BufferMovePrevious<CR>',                           'Move back' },
    c = { '<cmd>BufferCloseAllButCurrent<CR>',                     'Close but current' },
    d = { '<cmd>BufferOrderByDirectory<CR>',                       'Order by directory' },
    f = { '<cmd>bfirst<CR>',                                       'First buffer' },
    h = { '<cmd>Startify<CR>',                                     'Home Buffer' },
    l = { '<cmd>BufferCloseBuffersLeft<CR>',                       'Close Left' },
    r = { '<cmd>BufferCloseBuffersRight<CR>',                      'Close Right' },
    n = { '<cmd>BufferMoveNext<CR>',                               'Move next' },
    p = { '<cmd>BufferPick<CR>',                                   'Pick Buffer' },
  },

  c = {
    name = "LSP",
    a = { 'code action' },
    c = "which_key_ignore",
    d = { '<cmd>LspTroubleToggle<CR>',                             'local diagnostics' },
    D = { '<cmd>Telescope lsp_document_diagnostics<CR>',           'diagnostics' },
    f = { 'format' },
    l = { 'line diagnostics ' },
    r = { 'rename' },
    q = { '<cmd>Lspsaga code_action<CR>',                          'quick fix' },
    s = { '<cmd>Telescope symbols',                                'symbols' },
  },

  g = {
    name = "Git",
    a = { '<cmd>!git add %:p<CR>',                                 'add current' },
    A = { '<cmd>!git add .<CR>',                                   'add all' },
    b = { '<cmd>GitBlameToggle<CR>',                               'toggle blame' },
    d = { '<cmd>Gitsigns diffthis<CR>',                            'diff' },
    g = { '<cmd>FloatermNew --height=1.0 --width=1.0 lazygit<CR>', 'lazygit' },
    h = {
      name = "Hunk",
      b = "blame line",
      p = "preview",
      r = "reset",
      s = "stage",
      u = "undo stage",
    },
    l = {
      name = "Log",
      a = "commits",
      c = "buffer commits",
    },
    m = { '<Plug>(git-messenger)',                                 'message' },
    s = { '<cmd>Telescope git_status<CR>',                         'status' },
  },

  p = {
    name = "Project",
    f = { 'file' },
    w = { 'word' },
    l = { '<cmd>Telescope project<CR>',                            'list' }
  },

  s = {
    name = "Search",
    c = { '<cmd>Telescope colorscheme<CR>',                        'color schemes' },
    h = { '<cmd>Telescope oldfiles<CR>',                           'file history' },
    H = { '<cmd>Telescope command_history<CR>',                    'command history' },
    s = { '<cmd>Telescope search_history<CR>',                     'search history' },
  },

  t = {
    name = "Table Mode",
    m = { 'toggle' },
    t = { 'tableize' },
  },
}

local wk = require "which-key"
wk.register(mappings, opts)
