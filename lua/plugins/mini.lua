return {
  {
    "echasnovski/mini.align",
    lazy = false,
    version = "*",
    opts = {}
  },
  {
    "echasnovski/mini.ai",
    lazy = false,
    version = "*",
    config = function()
      require("mini.ai").setup()
    end,
  },
}
