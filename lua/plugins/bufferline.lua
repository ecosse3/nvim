local bufferline = require("bufferline")

bufferline.setup({
  options = {
    close_command = function(n)
      require("mini.bufremove").delete(n, false)
    end,
    right_mouse_command = function(n)
      require("mini.bufremove").delete(n, false)
    end,
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    show_buffer_close_icons = false,
    separator_style = "slant", -- { "|", "|" },
    always_show_bufferline = true,
    diagnostics = "nvim_lsp",
    -- luacheck: push ignore unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    style_preset = bufferline.style_preset.default,
    numbers = function(opts)
      return string.format("%s", opts.ordinal)
    end,
    hover = {
      enabled = true,
      delay = 250,
      reveal = { 'close' }
    },
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "qf" then
        return true
      end
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "EcovimNvimTreeTitle",
        text_align = "center",
        separator = true,
      },
    },
  },
})
