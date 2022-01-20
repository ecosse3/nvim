local M = {}
local fn = vim.fn

M.file_exists = function(path)
  local f=io.open(path, "r")
   if f~=nil then io.close(f) return true else return false end
end

M.get_relative_fname = function()
  local fname = vim.fn.expand('%:p')
  return fname:gsub(vim.fn.getcwd() .. '/', '')
end

M.get_relative_gitdir = function()
  local fname = vim.fn.expand('%:p')
  local gitpath = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  return fname:gsub(gitpath .. '/', '')
end

M.sleep = function(n)
  os.execute("sleep " .. tonumber(n))
end

M.toggle_quicklist = function()
  if fn.empty(fn.filter(fn.getwininfo(), 'v:val.quickfix')) == 1 then
    vim.cmd('copen')
  else
    vim.cmd('cclose')
  end
end

return M
