local utils = require('utils')
local async = require("plenary.async")

-- Custom Folds
vim.cmd([[
  function! CustomFold()
    return printf('   %-6d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
  endfunction
]])

local M = {}

M.erase_painter_line = function()
  vim.api.nvim_command("PainterEraseLine")
  require('notify')("Erased line", "info", { title = "Painter", timeout = 1000 })
end

M.first_ecovim_run = function()
  local is_first_run = utils.file_exists('/tmp/first-ecovim-run')

  if is_first_run then
    async.run(function()
      require('notify')("Welcome to Ecovim! Hope you'll have nice experience!", "info", { title = "Ecovim", timeout = 7000 })
      require('notify')("Please select 'Install Plugins' to continue.", "info", { title = "Installation", timeout = 10000 })
    end)
    local suc = os.remove('/tmp/first-ecovim-run')
    if (not suc) then print("Error: Couldn't remove /tmp/first-ecovim-run!") end
  end
end

M.first_ecovim_run()

return M
