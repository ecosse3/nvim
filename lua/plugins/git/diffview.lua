-- ╭──────────────────────────────────────────────────────────╮
-- │ Custom Ecovim toggle function via <leader>gd             │
-- ╰──────────────────────────────────────────────────────────╯

local lib = require("diffview.lib")
local diffview = require("diffview")

local M = {}

M.toggle = function ()
  local view = lib.get_current_view()
  if view == nil then
    diffview.file_history();
    return
  end

  if view then
    view:close()
    lib.dispose_view(view)
  end
end

return M
