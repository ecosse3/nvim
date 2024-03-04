-- https://github.com/lukas-reineke/indent-blankline.nvim

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("ibl").setup {
  -- show_current_context = true,
  -- show_current_context_start = false,
  -- show_end_of_line = false,
  exclude = {
    filetypes = { "help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
    buftypes = { "terminal", "nofile", "telescope" },
  },
  indent = {
    char = "│",
  },
  scope = {
    enabled = true,
    show_start = false,
  }
}
