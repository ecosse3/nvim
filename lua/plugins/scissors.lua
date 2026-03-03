return {
  {
    "chrisgrieser/nvim-scissors",
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
    keys = {
      { "<leader>asa", '<cmd>lua require("scissors").addNewSnippet()<CR>', desc = "Add new snippet" },
      { "<leader>ase", '<cmd>lua require("scissors").editSnippet()<CR>', desc = "Edit snippet" },
      { "<leader>asa", '<cmd>lua require("scissors").addNewSnippet()<CR>', desc = "Add new snippet from selection", mode = "x" },
    },
  }
}
