local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Build user plugin override specs from EcoVim.plugin_overrides
-- Users can define overrides in user.lua like:
--   EcoVim.plugin_overrides["snacks.nvim"] = { picker = { layout = "vertical" } }
--   EcoVim.plugin_overrides["blink.cmp"] = function(_, opts) opts.completion.menu.auto_show = false end
local spec = { { import = "plugins" } }
for plugin_name, override in pairs(EcoVim.plugin_overrides) do
  if type(override) == "function" or type(override) == "table" then
    spec[#spec + 1] = { plugin_name, opts = override }
  end
end

require("lazy").setup({
  spec = spec,
  defaults = { lazy = false },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  concurrency = 10,
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
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

vim.keymap.set("n", "<leader>/l", "<cmd>:Lazy<cr>")
