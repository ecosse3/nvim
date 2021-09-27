vim.opt.listchars = {
  space = "⋅",
  eol = "↴",
}

require("indent_blankline").setup {
  char = "|",
  buftype_exclude = {"terminal", "startify"},
  space_char_blankline = " ",
  show_current_context = true,
  show_end_of_line = true,
  use_treesitter = true,
}
