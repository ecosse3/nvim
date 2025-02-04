local present, wk = pcall(require, "which-key")
if not present then
  return
end

wk.setup {
  plugins = {
    marks = true,     -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false,   -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
      windows = false,   -- default bindings on <c-w>
      nav = false,       -- misc bindings to work with windows
      z = false,         -- bindings for folds, spelling and others prefixed with z
      g = false,         -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  win = {
    border = EcoVim.ui.float.border or "rounded", -- none, single, double, shadow, rounded
    padding = { 2, 2, 2, 2 },                     -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4,                    -- spacing between columns
    align = "left",                 -- align columns left, center or right
  },
  show_help = true,                 -- show help message on the command line when the popup is visible
}

-- ignore
wk.add({
  { "<leader><leader>", hidden = true },
  { "<leader>1",        hidden = true },
  { "<leader>2",        hidden = true },
  { "<leader>3",        hidden = true },
  { "<leader>4",        hidden = true },
  { "<leader>5",        hidden = true },
  { "<leader>6",        hidden = true },
  { "<leader>7",        hidden = true },
  { "<leader>8",        hidden = true },
  { "<leader>9",        hidden = true },
})

-- single
wk.add({
  { "<leader>=", "<cmd>vertical resize +5<CR>", desc = "resize +5" },
  { "<leader>-", "<cmd>vertical resize -5<CR>", desc = "resize -5" },
  { "<leader>v", "<C-W>v",                      desc = "split right" },
  { "<leader>V", "<C-W>s",                      desc = "split below" },
  { "<leader>q", desc = "quicklist" },
})

wk.add({
  { "<leader>/",  group = "Ecovim" },
  { "<leader>/s", group = "Session" },
  { "<leader>//", "<cmd>Alpha<CR>",       desc = "open dashboard" },
  { "<leader>/c", "<cmd>e $MYVIMRC<CR>",  desc = "open config" },
  { "<leader>/i", "<cmd>Lazy<CR>",        desc = "manage plugins" },
  { "<leader>/u", "<cmd>Lazy update<CR>", desc = "update plugins" },
})

wk.add({
  { "<leader>a",  group = "Actions",                mode = { "n", "v" } },
  { "<leader>an", "<cmd>set nonumber!<CR>",         desc = "line numbers" },
  { "<leader>ar", "<cmd>set norelativenumber!<CR>", desc = "relative number" },
})

wk.add({
  { "<leader>b",  group = "Buffer" },
  { "<leader>bs", group = "Sort" },
  { "<leader>bc", '<cmd>lua Snacks.bufdelete.other()<CR>', desc = "Close but current" },
  { "<leader>bf", "<cmd>bfirst<CR>",                                   desc = "First buffer" },
})

wk.add({
  { "<leader>c",  group = "LSP",                                      mode = { "n", "v" } },
  { "<leader>ca", desc = "code action",                               mode = { "n", "v" } },
  { "<leader>cf", desc = "format",                                    mode = { "n", "v" } },
  { "<leader>cl", desc = "line diagnostics" },
  { "<leader>cr", desc = "rename" },
  { "<leader>cR", desc = "structural replace" },
  { "<leader>ct", '<cmd>LspToggleAutoFormat<CR>',                     desc = "toggle format on save" },
})

wk.add({
  { "<leader>d", group = "Debug" },
})

wk.add({
  { "<leader>g",   group = "Git",                     mode = { "n", "v" } },
  { "<leader>ga",  "<cmd>!git add %:p<CR>",           desc = 'add current' },
  { "<leader>gA",  "<cmd>!git add .<CR>",             desc = 'add all' },
  { "<leader>gb",  "<cmd>BlameToggle window<CR>",     desc = 'blame' },
  { "<leader>gc",  group = "Conflict" },
  { "<leader>gh",  group = "Hunk" },
  { "<leader>ghr", desc = "reset hunk",               mode = { "v" } },
  { "<leader>ghs", desc = "stage hunk",               mode = { "v" } },
  { "<leader>gi",  "<cmd>Octo issue list<CR>",        desc = 'Issues List' },
  { "<leader>gl",  group = "Log" },
  { "<leader>gm",  desc = 'blame line' },
  { "<leader>gp",  "<cmd>Octo pr list<CR>",           desc = 'Pull Requests List' },
  { "<leader>gw",  group = "Worktree" },
  { "<leader>gww", desc = 'worktrees' },
  { "<leader>gwc", desc = 'create worktree' },
})

wk.add({
  { "<leader>p",  group = "Project" },
  { "<leader>pf", desc = "file" },
  { "<leader>pw", desc = "word" },
  { "<leader>pr", desc = "refactor",                                                                                                                                                                                             mode = { "v", "n" } },
  { "<leader>pt", "<cmd>TodoTrouble<CR>",                                                                                                                                                                                        desc = "todo" },
})

wk.add({
  { "<leader>r", group = "Refactor", mode = { "n", "v" } },
})

wk.add({
  { "<leader>s",  group = "Search" },
})

wk.add({
  { "<leader>t",  group = "Table Mode",  mode = { "n", "v" } },
  { "<leader>tm", desc = { "toggle" } },
  { "<leader>tt", desc = { "tableize" }, mode = { "n", "v" } },
})

wk.add({
  { "<leader>s", "<cmd>'<,'>sort<CR>", desc = "sort", mode = { "v" } }
})

local function attach_markdown(bufnr)
  wk.add({
    { "<leader>a",  group = "Actions",                buffer = bufnr },
    { "<leader>am", "<cmd>MarkdownPreviewToggle<CR>", desc = "markdown preview", mode = "n", buffer = bufnr },
  })
end

local function attach_typescript(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<leader>c",   group = "LSP", },
    { "<leader>ce",  "<cmd>TSC<CR>",                      desc = "workspace errors (TSC)" },
    { "<leader>cF",  "<cmd>TSToolsFixAll<CR>",            desc = "fix all" },
    { "<leader>ci",  "<cmd>TSToolsAddMissingImports<CR>", desc = "import all" },
    { "<leader>co",  "<cmd>TSToolsOrganizeImports<CR>",   desc = "organize imports" },
    { "<leader>cs",  "<cmd>TSToolsSortImports<CR>",       desc = "sort imports" },
    { "<leader>cu",  "<cmd>TSToolsRemoveUnused<CR>",      desc = "remove unused" },
    { "<leader>cR",  "<cmd>TSToolsRenameFile<CR>",        desc = "rename file" },
    { "<leader>cF",  "<cmd>TSToolsFileReferences<CR>",    desc = "file references" },
  })
end

local function attach_npm(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<leader>n",   group = "NPM" },
    { "<leader>nc",  '<cmd>lua require("package-info").change_version()<CR>', desc = "change version" },
    { "<leader>nd",  '<cmd>lua require("package-info").delete()<CR>',         desc = "delete package" },
    { "<leader>nh",  "<cmd>lua require('package-info').hide()<CR>",           desc = "hide" },
    { "<leader>ni",  '<cmd>lua require("package-info").install()<CR>',        desc = "install new package" },
    { "<leader>nr",  '<cmd>lua require("package-info").reinstall()<CR>',      desc = "reinstall dependencies" },
    { "<leader>ns",  '<cmd>lua require("package-info").show()<CR>',           desc = "show" },
    { "<leader>nu",  '<cmd>lua require("package-info").update()<CR>',         desc = "update package" },
  })
end

local function attach_jest(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<leader>j",   group = "Jest", },
    { "<leader>jf",  "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",   desc = "run current file" },
    { "<leader>ji",  "<cmd>lua require('neotest').summary.toggle()<CR>",              desc = "toggle info panel" },
    { "<leader>jj",  "<cmd>lua require('neotest').run.run()<CR>",                     desc = "run nearest test" },
    { "<leader>jl",  "<cmd>lua require('neotest').run.run_last()<CR>",                desc = "run last test" },
    { "<leader>jo",  "<cmd>lua require('neotest').output.open({ enter = true })<CR>", desc = "open test output" },
    { "<leader>js",  "<cmd>lua require('neotest').run.stop()<CR>",                    desc = "stop" },
  })
end

local function attach_spectre(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<LocalLeader>r", desc = "Replace all" },
    { "<LocalLeader>o", desc = "Show options" },
    { "<LocalLeader>q", desc = "Send all to Quicklist" },
    { "<LocalLeader>v", desc = "Change view mode" },
  })
end

local function attach_nvim_tree(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<leader>=",   "<cmd>NvimTreeResize +5<CR>", desc = "resize +5" },
    { "<leader>-",   "<cmd>NvimTreeResize -5<CR>", desc = "resize +5" },
  })
end

return {
  attach_markdown = attach_markdown,
  attach_typescript = attach_typescript,
  attach_npm = attach_npm,
  attach_jest = attach_jest,
  attach_spectre = attach_spectre,
  attach_nvim_tree = attach_nvim_tree,
}
