return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
    },
    opts = {
      char = {
        keys = { "f", "F", "t", "T" },
      },
      highlight = {
        backdrop = false,
      },
      jump = {
        autojump = true,
        nohlsearch = true,
      },
      modes = {
        char = {
          -- repeat with the same key: f/t -> next, F/T -> prev (works for t/T too)
          char_actions = function(motion)
            return {
              [";"] = "next",
              [","] = "prev",
              [motion:lower()] = "next",
              [motion:upper()] = "prev",
            }
          end,
          enabled = true,
          keys = { "f", "F", "t", "T", ";", "," },
          highlight = {
            backdrop = false,
          },
          jump_labels = false,
          multi_line = true,
        },
        search = {
          enabled = true,
          highlight = {
            backdrop = false,
          },
          jump = {
            autojump = false,
          },
        },
      },
      prompt = {
        win_config = { border = "none" },
      },
      search = {
        wrap = true,
      },
    },
  },
}
