-- 使用lazy.nvim包管理器
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("config.plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  concurrency = 5,
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
  ui = {
    border = EcoVim.ui.float.border,
  }
})
-- 按键映射
vim.keymap.set("n", "<leader>/l", "<cmd>:Lazy<cr>")
