local present, wk = pcall(require, "which-key")
if not present then
  return
end

wk.setup {
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
    border = EcoVim.ui.float.border or "rounded", -- none, single, double, shadow, rounded
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
  triggers = {"<leader>", "<LocalLeader>"}, -- or specify a list manually
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

local visual_opts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local normal_mode_mappings = {
  -- ignore
  ['1'] = 'which_key_ignore',
  ['2'] = 'which_key_ignore',
  ['3'] = 'which_key_ignore',
  ['4'] = 'which_key_ignore',
  ['5'] = 'which_key_ignore',
  ['6'] = 'which_key_ignore',
  ['7'] = 'which_key_ignore',
  ['8'] = 'which_key_ignore',
  ['9'] = 'which_key_ignore',

  -- single
  ['='] = { '<cmd>vertical resize +5<CR>',                      'resize +5' },
  ['-'] = { '<cmd>vertical resize -5<CR>',                      'resize +5' },
  ['v'] = { '<C-W>v',                                           'split right' },
  ['V'] = { '<C-W>s',                                           'split below' },
  ['q'] = { 'quicklist' },

  ['/'] = {
    name = 'Ecovim',
    ['/'] = { '<cmd>Alpha<CR>',                                 'open dashboard' },
    c = { '<cmd>e $MYVIMRC<CR>',                                'open config' },
    i = { '<cmd>Lazy<CR>',                                      'manage plugins' },
    u = { '<cmd>Lazy update<CR>',                               'update plugins' },
    s = {
      name = 'Session',
    },
  },

  a = {
    name = 'Actions',
    n = { '<cmd>set nonumber!<CR>',                             'line numbers' },
    r = { '<cmd>set norelativenumber!<CR>',                     'relative number' },
  },

  b = {
    name = 'Buffer',
    c = { '<cmd>lua require("utils").closeOtherBuffers()<CR>',  'Close but current' },
    f = { '<cmd>bfirst<CR>',                                    'First buffer' },
    s = {
      name = 'Sort',
    },
  },

  c = {
    name = 'LSP',
    a = { 'code action' },
    d = { '<cmd>TroubleToggle<CR>',                           'local diagnostics' },
    D = { '<cmd>Telescope diagnostics wrap_results=true<CR>', 'workspace diagnostics' },
    f = { 'format' },
    l = { 'line diagnostics' },
    r = { 'rename' },
    R = { 'structural replace' },
    t = { '<cmd>LspToggleAutoFormat<CR>',                     'toggle format on save' },
  },

  d = {
    name = 'Debug',
    a = { 'attach' },
    b = { 'breakpoint' },
    c = { 'continue' },
    C = { 'close UI' },
    d = { 'continue' },
    h = { 'visual hover' },
    i = { 'step into' },
    o = { 'step over' },
    O = { 'step out' },
    r = { 'repl' },
    s = { 'scopes' },
    t = { 'terminate' },
    U = { 'open UI' },
    v = { 'log variable' },
    V = { 'log variable above' },
    w = { 'watches' },
  },

  g = {
    name = 'Git',
    a = { '<cmd>!git add %:p<CR>',                                        'add current' },
    A = { '<cmd>!git add .<CR>',                                          'add all' },
    b = { '<cmd>lua require("internal.blame").open()<CR>',                'blame' },
    B = { '<cmd>Telescope git_branches<CR>',                              'branches' },
    c = {
      name = 'Conflict',
    },
    h = {
      name = 'Hunk',
    },
    i = { '<cmd>Octo issue list<CR>',                                     'Issues List' },
    l = {
      name = 'Log',
      A = {'<cmd>lua require("plugins.telescope").my_git_commits()<CR>',  'commits (Telescope)'},
      a = {'<cmd>LazyGitFilter<CR>',                                      'commits'},
      C = {'<cmd>lua require("plugins.telescope").my_git_bcommits()<CR>', 'buffer commits (Telescope)'},
      c = {'<cmd>LazyGitFilterCurrentFile<CR>',                           'buffer commits'},
    },
    m = { 'blame line' },
    p = { '<cmd>Octo pr list<CR>',                                        'Pull Requests List' },
    s = { '<cmd>Telescope git_status<CR>',                                'telescope status' },
    w = {
      name = 'Worktree',
      w = 'worktrees',
      c = 'create worktree',
    }
  },

  p = {
    name = 'Project',
    f = { 'file' },
    w = { 'word' },
    l = { "<cmd>lua require'telescope'.extensions.repo.cached_list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%timeshift/', '/usr/', '/srv/', '/%.oh%-my%-zsh', '/Library/', '/%.cocoapods/'}}<CR>", 'list' },
    r = { 'refactor' },
    s = { "<cmd>SessionManager save_current_session<CR>",            'save session' },
    t = { "<cmd>TodoTrouble<CR>",                                    'todo' },
  },

  r = {
    name = 'Refactor',
  },

  s = {
    name = 'Search',
    c = { '<cmd>Telescope colorscheme<CR>',                              'color schemes' },
    d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>',     'dotfiles' },
    h = { '<cmd>Telescope oldfiles hidden=true<CR>',                     'file history' },
    H = { '<cmd>lua require("plugins.telescope").command_history()<CR>', 'command history' },
    s = { '<cmd>Telescope search_history theme=dropdown<CR>',            'search history' },
  },

  t = {
    name = 'Table Mode',
    m = { 'toggle' },
    t = { 'tableize' },
  },
}

local visual_mode_mappings = {
  -- single
  ["s"] = { "<cmd>'<,'>sort<CR>",               'sort' },

  a = {
    name = "Actions",
  },

  c = {
    name = "LSP",
    a = { 'range code action' },
    f = { 'range format' },
  },

  g = {
    name = "Git",
    h = {
      name = "Hunk",
      r = "reset hunk",
      s = "stage hunk",
    },
  },

  p = {
    name = "Project",
    r = { 'refactor' },
  },

  r = {
    name = "Refactor",
  },

  t = {
    name = "Table Mode",
    t = { 'tableize' },
  },
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Register                                                 │
-- ╰──────────────────────────────────────────────────────────╯

wk.register(normal_mode_mappings, opts)
wk.register(visual_mode_mappings, visual_opts)

local function attach_markdown(bufnr)
  wk.register({
    a = {
      name = "Actions",
      m = { '<cmd>MarkdownPreviewToggle<CR>', 'markdown preview' },
    }
  }, {
    buffer = bufnr ,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_typescript(bufnr)
  wk.register({
    c = {
      name = "LSP",
      e = { '<cmd>TSC<CR>',                               'workspace errors (TSC)'},
      F = { '<cmd>TSToolsFixAll<CR>',                     'fix all' },
      i = { '<cmd>TSToolsAddMissingImports<CR>',          'import all'},
      o = { '<cmd>TSToolsOrganizeImports<CR>',            'organize imports'},
      s = { '<cmd>TSToolsSortImports<CR>',                'sort imports'},
      u = { '<cmd>TSToolsRemoveUnused<CR>',               'remove unused' },
    }
  }, {
    buffer = bufnr ,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_npm(bufnr)
  wk.register({
    n = {
      name = "NPM",
      c = { '<cmd>lua require("package-info").change_version()<CR>', 'change version' },
      d = { '<cmd>lua require("package-info").delete()<CR>',         'delete package' },
      h = { "<cmd>lua require('package-info').hide()<CR>",           'hide'},
      i = { '<cmd>lua require("package-info").install()<CR>',        'install new package' },
      r = { '<cmd>lua require("package-info").reinstall()<CR>',      'reinstall dependencies' },
      s = { '<cmd>lua require("package-info").show()<CR>',           'show' },
      u = { '<cmd>lua require("package-info").update()<CR>',         'update package'},
    }
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_zen(bufnr)
  wk.register({
    ["z"] = { '<cmd>ZenMode<CR>',               'zen' },
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_jest(bufnr)
  wk.register({
    j = {
      name = "Jest",
      f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', 'run current file' },
      i = { '<cmd>lua require("neotest").summary.toggle()<CR>', 'toggle info panel' },
      j = { '<cmd>lua require("neotest").run.run()<CR>', 'run nearest test' },
      l = { '<cmd>lua require("neotest").run.run_last()<CR>', 'run last test' },
      o = { '<cmd>lua require("neotest").output.open({ enter = true })<CR>', 'open test output'},
      s = { '<cmd>lua require("neotest").run.stop()<CR>', 'stop' },
    }
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_spectre(bufnr)
  wk.register({
    ["R"] = { '[SPECTRE] Replace all'},
    ["o"] = { '[SPECTRE] Show options'},
    ["q"] = { '[SPECTRE] Send all to quicklist'},
    ["v"] = { '[SPECTRE] Change view mode'},
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_nvim_tree(bufnr)
  wk.register({
    ["="] = { "<cmd>NvimTreeResize +5<CR>", "resize +5" },
    ["-"] = { "<cmd>NvimTreeResize -5<CR>", "resize +5" },
  }, {
    buffer = bufnr,
    mode = "n",   -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

return {
  attach_markdown = attach_markdown,
  attach_typescript = attach_typescript,
  attach_npm = attach_npm,
  attach_zen = attach_zen,
  attach_jest = attach_jest,
  attach_spectre = attach_spectre,
  attach_nvim_tree = attach_nvim_tree,
}
