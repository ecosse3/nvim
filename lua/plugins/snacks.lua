Snacks = Snacks

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile      = { enabled = false },
      dashboard    = { enabled = false },
      indent       = { enabled = false },
      input        = { enabled = false },
      notifier     = { enabled = false },
      quickfile    = { enabled = false },
      scroll       = { enabled = false },
      statuscolumn = { enabled = false },
      words        = { enabled = false },
    },
    keys = {
      { "<leader>gg",  function() Snacks.lazygit() end,          desc = "Lazygit" },
      { "<leader>gla", function() Snacks.lazygit.log() end,      desc = "Lazygit Log (cwd)" },
      { "<leader>glc", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
      {
        "<leader>z",
        function()
          Snacks.zen({
            win = {
              width = 200,
            },
          })
        end,
        desc = "Zen Mode"
      },
      { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Zoom Mode" },
    },
  }
}
