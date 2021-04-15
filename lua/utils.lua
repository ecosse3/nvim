local api = vim.api
local M = {
  path = nil
}

M.copy_path_to_clipboard = function()
  M.home_dir = os.getenv("HOME")..'/'
  M.path = require'nvim-tree.lib'.get_node_at_cursor().absolute_path:gsub(M.home_dir, '')
  os.execute("echo "..M.path.." | xclip -selection clipboard")
  api.nvim_out_write(M.path..' filepath added to clipboard.\n')
end

return M
