local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")
local colors = {
  gray = "#4b5263",
  red = "#FF0000",
  yellow = "#FFCC00",
  green = "#00FF00",
}

gl.short_line_list = {'NvimTree'}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gls.left[1] = {
  ViMode = {
    provider = function()
      local mode = {
        n = {color = "String", icon = ""},
        i = {color = "Function", icon = ""},
        v = {color = "Conditional", icon = ""},
        V = {color = "Conditional", icon = ""},
        [""] = {color = "Conditional", icon = ""},
        c = {color = "Keyword", icon = ""},
        ['!'] = {color = "Keyword", icon = ""},
        R = {color = "Keyword", icon = "﯒"},
        r = {color = "Keyword", icon = "﯒"},
      }
      vim.api.nvim_command("hi link GalaxyViMode " .. mode[vim.fn.mode()].color)
      if mode[vim.fn.mode()].icon ~= nil then
        return "    " .. mode[vim.fn.mode()].icon
      end
    end,
    separator = "  ",
    condition = condition.hide_in_width
  }
}
gls.left[2] = {
  FileName = {
    provider = {"FileName"},
    condition = condition.hide_in_width or condition.buffer_not_empty
  }
}
gls.left[3] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "".. " " .. dir_name .. " "
        end,
    }
}
gls.left[4] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = " ".. "" .. " ",
        highlight = {colors.red},
    }
}
gls.left[5] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.yellow}
    }
}
gls.right[1] = {
lsp_status = {
    provider = function()
        local clients = vim.lsp.get_active_clients()
          if next(clients) ~= nil then
              return " " .. "  " .. " LSP "
          else
              return ""
          end
      end,
  }
}
gls.right[2] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.hide_in_width or condition.buffer_not_empty,
    separator = " ",
  }
}
gls.right[3] = {
  FileTypeName = {
    provider = "FileTypeName",
    condition = condition.hide_in_width or condition.buffer_not_empty,
  }
}
gls.right[4] = {
  GitBranch = {
    provider = "GitBranch",
    icon = "" .. " ",
    separator = "  ",
    condition = require("galaxyline.condition").check_git_workspace and condition.hide_in_width,
  }
}
gls.right[5] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
}
gls.right[6] = {
  Time = {
    provider = function()
      return '  ' .. os.date('%H:%M') .. ' '
    end,
    highlight = {colors.green, colors.gray},
    separator = ' ',
  }
}
gls.right[7] = {
  EndGap = {
    provider = function()
      return ''
    end,
    condition = condition.hide_in_width,
    separator = ' ',
  }
}
