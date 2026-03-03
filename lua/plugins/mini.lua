return {
  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    version = "*",
    opts = {}
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("mini.ai").setup()
    end,
  },
}
