local M = {}
local fn = vim.fn

M.file_exists = function(path)
  local f = io.open(path, "r")
  if f ~= nil then io.close(f) return true else return false end
end

M.get_relative_fname = function()
  local fname = vim.fn.expand('%:p')
  return fname:gsub(vim.fn.getcwd() .. '/', '')
end

M.get_relative_gitpath = function()
  local fpath = vim.fn.expand('%:h')
  local fname = vim.fn.expand('%:t')
  local gitpath = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  local relative_gitpath = fpath:gsub(gitpath, '') .. '/' .. fname

  return relative_gitpath
end

M.sleep = function(n, callback)
  vim.defer_fn(callback or function() end, tonumber(n) * 1000)
end

M.toggle_quicklist = function()
  if fn.empty(fn.filter(fn.getwininfo(), 'v:val.quickfix')) == 1 then
    vim.cmd('copen')
  else
    vim.cmd('cclose')
  end
end

M.starts_with = function(str, start)
  return str:sub(1, #start) == start
end

M.end_with = function(str, ending)
  return ending == "" or str:sub(- #ending) == ending
end

M.split = function(s, delimiter)
  local result = {}
  for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end

  return result
end

M.handle_job_data = function(data)
  if not data then
    return nil
  end
  if data[#data] == "" then
    table.remove(data, #data)
  end
  if #data < 1 then
    return nil
  end
  return data
end

M.log = function(message, title)
  vim.notify(message, "info", { title = title or "Info" })
end

M.warnlog = function(message, title)
  vim.notify(message, "warn", { title = title or "Warning" })
end

M.errorlog = function(message, title)
  vim.notify(message, "error", { title = title or "Error" })
end

M.jobstart = function(cmd, on_finish)
  local has_error = false
  local lines = {}

  local function on_event(_, data, event)
    if event == "stdout" then
      data = M.handle_job_data(data)
      if not data then
        return
      end

      for i = 1, #data do
        table.insert(lines, data[i])
      end
    elseif event == "stderr" then
      data = M.handle_job_data(data)
      if not data then
        return
      end

      has_error = true
      local error_message = ""
      for _, line in ipairs(data) do
        error_message = error_message .. line
      end
      M.log("Error during running a job: " .. error_message)
    elseif event == "exit" then
      if not has_error then
        on_finish(lines)
      end
    end
  end

  vim.fn.jobstart(cmd, {
    on_stderr = on_event,
    on_stdout = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

M.remove_whitespaces = function(string)
  return string:gsub("%s+", "")
end

M.add_whitespaces = function(number)
  return string.rep(" ", number)
end

M.is_plugin_loaded = function(plugin_name)
  local lazy_status_ok, lazy = pcall(require, "lazy")
  if not lazy_status_ok then
    return
  end

  local plugin = lazy.plugins[plugin_name]
  return plugin and plugin.loaded
end

M.adjust_font_size = function (amount)
  local guifont = vim.o.guifont
  if guifont == "" then
    guifont = "FiraCode Nerd Font:h14"
  end
  local current_size = guifont:match("%d+")
  if not current_size then
    current_size = 14
  end
  local new_size = tonumber(current_size) + amount
  vim.o.guifont = guifont:gsub("%d+", new_size)
end

-- Apply user plugin overrides from EcoVim.plugin_overrides
-- Usage in plugin config: opts = require("utils").apply_plugin_overrides("plugin_name", default_opts)
M.apply_plugin_overrides = function(plugin_name, default_opts)
  if EcoVim.plugin_overrides and EcoVim.plugin_overrides[plugin_name] then
    local override = EcoVim.plugin_overrides[plugin_name]
    if type(override) == "function" then
      return override(default_opts) or default_opts
    elseif type(override) == "table" then
      return vim.tbl_deep_extend("force", default_opts, override)
    end
  end
  return default_opts
end


return M
