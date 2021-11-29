local M = {}

M.file_exists = function(path)
  local f=io.open(path, "r")
   if f~=nil then io.close(f) return true else return false end
end

M.get_relative_fname = function()
    local fname = vim.fn.expand('%:p')
    return fname:gsub(vim.fn.getcwd() .. '/', '')
end

M.sleep = function(n)
  os.execute("sleep " .. tonumber(n))
end

return M
