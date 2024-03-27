require("sidebar-nvim").setup({

  disable_default_keybindings = 0,
  bindings = nil,
  open = false,
  side = "right",
  initial_width = 35,
  hide_statusline = false,
  update_interval = 1000,
  sections = { "todos", "git", "symbols", "diagnostics" },
  section_separator = { "", "-----", "" },
  section_title_separator = { "" },

  containers = {
    attach_shell = "/bin/sh", show_all = true, interval = 5000,
  },


  datetime = {
    format = "%a %b %d, %H:%M",
    clocks = { { name = "local" } },
    icon = '',
  },
  todos = {
    ignored_paths = { "~" },
    icon = ''
  },
  symbols = {
    icon = ''
  }

})


-- 防抖
local Debouncer = require("sidebar-nvim.debouncer")

local function expensive_computation(n)
  print(n + 1)
end

local expensive_computation_debounced = Debouncer:new(expensive_computation, 1000)

expensive_computation_debounced:call(42) -- print(43)
expensive_computation_debounced:call(42) -- does nothing

vim.defer_fn(function()
  expensive_computation_debounced:call(43) -- print(44)
  expensive_computation_debounced:call(43) -- does nothing
end, 1500)
