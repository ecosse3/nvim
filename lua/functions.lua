local utils = require('utils')
local async = require("plenary.async")

-- Custom Folds, make them look better
vim.cmd([[
  function! CustomFold()
    return printf('   %-6d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
  endfunction
]])

-- It manages folds automatically based on treesitter
local parsers = require'nvim-treesitter.parsers'
local configs = parsers.get_parser_configs()
local ft_str = table.concat(vim.tbl_map(function(ft) return configs[ft].filetype or ft end, parsers.available_parsers()), ',')
print()
vim.cmd('autocmd Filetype ' .. ft_str .. ' setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()')

-- Exported functions
local M = {}

M.first_ecovim_run = function()
  local is_first_run = utils.file_exists('/tmp/first-ecovim-run')

  if is_first_run then
    async.run(function()
      require('notify')("Welcome to Ecovim! Hope you'll have a nice experience!", "info", { title = "Ecovim", timeout = 5000 })
      require('notify')("Please install treesitter servers manually by :TSInstall (maintained) command.", "info", { title = "Installation", timeout = 10000 })
      require('notify')("LSP Servers needs to be enabled manually in lsp/config.lua file.", "info", { title = "Installation", timeout = 12000 })
    end)
    local suc = os.remove('/tmp/first-ecovim-run')
    if (not suc) then print("Error: Couldn't remove /tmp/first-ecovim-run!") end
  end
end

M.first_ecovim_run()

return M
