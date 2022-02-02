
-- vim.opt.listchars = {
--   space = "⋅",
--   eol = "↴",
-- }
-- https://github.com/lukas-reineke/indent-blankline.nvim

vim.opt.list = true

require("indent_blankline").setup {
  buftype_exclude = {"terminal", "telescope", "nofile"},
  filetype_exclude = {"help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float"},
  show_current_context = true,
  show_current_context_start = false,
  show_end_of_line = false,
  show_trailing_blankline_indent = false,
  space_char_blankline = " ",
  use_treesitter = true,
}