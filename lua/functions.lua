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
return M
