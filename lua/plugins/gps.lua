local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
  return
end

local icons = require "icons"
local hl_group = "LineNr"

gps.setup({
  icons = {
    ["class-name"] = "%#CmpItemKindClass#" .. icons.class .. "%*" .. "", -- Classes and class-like objects
    ["hook-name"] = "%#CmpItemKindMethodDefault#" .. icons.hook .. "%*" .. "", -- React Hooks
    ["function-name"] = "%#CmpItemKindFunction#" .. icons.func .. "%*" .. "", -- Functions
    ["method-name"] = "%#CmpItemKindMethod#" .. icons.method .. "%*" .. "", -- Methods (functions inside class-like objects)
    ["container-name"] = "%#CmpItemKindProperty#" .. icons.object .. "%*" .. "", -- Containers (example: lua tables)
    ["tag-name"] = "%#CmpItemKindKeyword#" .. icons.tag .. "%*" .. " ", -- Tags (example: html tags)
    ["mapping-name"] = "%#CmpItemKindProperty#" .. icons.object .. "%*" .. "",
    ["sequence-name"] = "%CmpItemKindProperty#" .. icons.array .. "%*" .. "",
    ["null-name"] = "%CmpItemKindField#" .. icons.field .. "%*" .. "",
    ["boolean-name"] = "%CmpItemKindValue#" .. icons.boolean .. "%*" .. "",
    ["integer-name"] = "%CmpItemKindValue#" .. icons.number .. "%*" .. "",
    ["float-name"] = "%CmpItemKindValue#" .. icons.number .. "%*" .. "",
    ["string-name"] = "%CmpItemKindValue#" .. icons.string .. "%*" .. "",
    ["array-name"] = "%CmpItemKindProperty#" .. icons.array .. "%*" .. "",
    ["object-name"] = "%CmpItemKindProperty#" .. icons.object .. "%*" .. "",
    ["number-name"] = "%CmpItemKindValue#" .. icons.number .. "%*" .. "",
    ["table-name"] = "%CmpItemKindProperty#" .. icons.table .. "%*" .. "",
    ["date-name"] = "%CmpItemKindValue#" .. icons.calendar .. "%*" .. "",
    ["date-time-name"] = "%CmpItemKindValue#" .. icons.table .. "%*" .. "",
    ["inline-table-name"] = "%CmpItemKindProperty#" .. icons.calendar .. "%*" .. "",
    ["time-name"] = "%CmpItemKindValue#" .. icons.watch .. "%*" .. "",
    ["module-name"] = "%CmpItemKindModule#" .. icons.module .. "%*" .. "",
  },
  -- Disable any languages individually over here
  -- Icons can be set here too for some specific languages (check in gps source code)
  -- Any language not disabled here is enabled by default
  languages = {
    ["html"] = false,
    ["tsx"] = {
      ["hook-name"] = "%#CmpItemKindMethodDefault#" .. icons.hook .. "%*" .. "", -- React Hooks
    }
  },

  separator = " " .. "%#" .. hl_group .. "#" .. EcoVim.icons.caretRight .. "%*",

  -- limit for amount of context shown
  -- 0 means no limit
  -- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
  -- in context names (eg: function names, class names, etc)
  depth = 0,

  -- indicator used when context is hits depth limit
  depth_limit_indicator = "..",
  text_hl = hl_group
})
