local utils = require('utils')

local async_present, async = pcall(require, "plenary.async")
if not async_present then
  return
end

-- Custom Folds, make them look better
vim.cmd([[
  function! CustomFold()
    return printf('   %-6d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
  endfunction
]])

-- It manages folds automatically based on treesitter
local parsers_present, parsers = pcall(require, "nvim-treesitter.parsers")
if not parsers_present then
  return
end

local configs = parsers.get_parser_configs()
local ft_str = table.concat(vim.tbl_map(function(ft) return configs[ft].filetype or ft end, parsers.available_parsers()), ',')
vim.cmd('autocmd Filetype ' .. ft_str .. ' setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()')

-- Exported functions
local M = {}

M.first_ecovim_run = function()
  local is_first_run = utils.file_exists('/tmp/first-ecovim-run')

  if is_first_run then
    async.run(function()
      require('notify')("Welcome to Ecovim! Hope you'll have a nice experience!", "info", { title = "Ecovim", timeout = 5000 })
      require('notify')("Please install treesitter servers manually by :TSInstall command.", "info", { title = "Installation", timeout = 10000 })
    end)
    local suc = os.remove('/tmp/first-ecovim-run')
    if (not suc) then print("Error: Couldn't remove /tmp/first-ecovim-run!") end
  end
end

M.first_ecovim_run()

local present, win = pcall(require, "lspconfig.ui.windows")
if not present then
  return
end

local _default_opts = win.default_opts
win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = EcoVim.ui.float.border
  return opts
end

return M
