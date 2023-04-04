local M = {}

local status_navic_ok, navic = pcall(require, "nvim-navic")
if not status_navic_ok then
  return
end

local function isempty(s)
  return s == nil or s == ""
end

M.filename = function()
  local filename = vim.fn.expand "%:t"
  local extension = ""
  local file_icon = ""
  local file_icon_color = ""
  local default_file_icon = ""
  local default_file_icon_color = ""

  if not isempty(filename) then
    extension = vim.fn.expand "%:e"

    local default = false

    if isempty(extension) then
      extension = ""
      default = true
    end

    file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = default })

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if file_icon == nil then
      file_icon = default_file_icon
      file_icon_color = default_file_icon_color
    end

    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
  end
end

M.gps = function()
  local status_ok, navic_location = pcall(navic.get_location, {})
  if not status_ok then
    return
  end

  if not navic.is_available() then -- Returns boolean value indicating whether a output can be provided
    return
  end

  local retval = M.filename()

  if navic_location == "error" then
    return ""
  else
    if not isempty(navic_location) then
      local hl_group = "LineNr"
      return retval .. " " .. "%#" .. hl_group .. "#" .. EcoVim.icons.caretRight .. "%*" .. " " .. navic_location
    else
      return retval
    end
  end
end

return M
