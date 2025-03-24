return {
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      })
    end,
    keys = {
      { "<leader>prr", function() require('grug-far').open() end, mode = "n", desc = "refactor" },
      { "<leader>pra", function() require('grug-far').open({ engine = 'astgrep' }) end, mode = "n", desc = "refactor (ast-grep)" },
      { "<leader>prw", function() require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>") } }) end, mode = {"n", "v"}, desc = "refactor with word under cursor" },
      { "<leader>prW", function() require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>"), paths = vim.fn.expand("%") } }) end, mode = {"n", "v"}, desc = "refactor with word under cursor" },
      { "<leader>prf", function() require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } }) end, mode = {"n", "v"}, desc = "refactor current file" },
    }
  },
}
