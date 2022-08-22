local present_dapui, dapui = pcall(require, "dapui")
local present_dap, dap = pcall(require, "dap")
local present_virtual_text, dap_vt = pcall(require, "nvim-dap-virtual-text")
local _, shade = pcall(require, "shade")

if not present_dapui or not present_dap or not present_virtual_text then
  return
end

-- ╭──────────────────────────────────────────────────────────╮
-- │ DAP Virtual Text Setup                                   │
-- ╰──────────────────────────────────────────────────────────╯
dap_vt.setup({
  enabled = true, -- enable this plugin (the default)
  enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true, -- show stop reason when stopped for exceptions
  commented = false, -- prefix virtual text with comment string
  only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
  all_references = false, -- show virtual text on all all references of the variable (not only definitions)
  filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)

  -- Experimental Features:
  virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ DAP UI Setup                                             │
-- ╰──────────────────────────────────────────────────────────╯
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = EcoVim.ui.float.border or "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ DAP Setup                                                │
-- ╰──────────────────────────────────────────────────────────╯
dap.set_log_level('TRACE');

-- Automatically open UI
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open();
  shade.toggle();
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close();
  shade.toggle();
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close();
  shade.toggle();
end

-- Enable virtual text
vim.g.dap_virtual_text = true

-- ╭──────────────────────────────────────────────────────────╮
-- │ Icons                                                    │
-- ╰──────────────────────────────────────────────────────────╯
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })

-- ╭──────────────────────────────────────────────────────────╮
-- │ Keybindings                                              │
-- ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_set_keymap("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dc", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", { noremap = true, silent = true })

-- ╭──────────────────────────────────────────────────────────╮
-- │ Adapters                                                 │
-- ╰──────────────────────────────────────────────────────────╯
-- NODE / TYPESCRIPT
dap.adapters.node2 = {
  type = 'executable';
  command = 'node',
  args = { vim.fn.stdpath "data" .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' };
}

-- Chrome
dap.adapters.chrome = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath "data" .. '/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js' };
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Configurations                                           │
-- ╰──────────────────────────────────────────────────────────╯
dap.configurations.javascript = {
  {
    type = 'node2';
    request = 'launch';
    program = '${file}';
    cwd = vim.fn.getcwd();
    sourceMaps = true;
    protocol = 'inspector';
    console = 'integratedTerminal';
  }
}

dap.configurations.javascript = {
  {
    type = 'chrome',
    request = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    webRoot = '${workspaceFolder}'
  }
}

dap.configurations.javascriptreact = {
  {
    type = 'chrome',
    request = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    webRoot = '${workspaceFolder}'
  }
}

dap.configurations.typescriptreact = {
  {
    type = 'chrome',
    request = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    webRoot = '${workspaceFolder}'
  }
}
