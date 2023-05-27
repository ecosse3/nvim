local bufferline = require("bufferline")

bufferline.setup({
  options = {
    close_command = function(n)
      require("mini.bufremove").delete(n, false)
    end,
    right_mouse_command = function(n)
      require("mini.bufremove").delete(n, false)
    end,
    show_buffer_close_icons = false,
    separator_style = { "|", "|" },
    always_show_bufferline = true,
    style_preset = bufferline.style_preset.no_italic,
    numbers = function(opts)
      return string.format("%s", opts.ordinal)
    end,
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
