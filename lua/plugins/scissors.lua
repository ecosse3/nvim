return {
  {
    "chrisgrieser/nvim-scissors",
    event = "BufEnter",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
    keys = {
      "<Leader>asa",
      "<Leader>ase",
    },
    config = function()
      local present, wk = pcall(require, "which-key")
      if not present then
        return
      end

      wk.add({
        { "<leader>as",  group = "Snippets",                                 nowait = false,           remap = false },
        { "<leader>asa", '<cmd>lua require("scissors").addNewSnippet()<CR>', desc = "Add new snippet", nowait = false, remap = false },
        { "<leader>ase", '<cmd>lua require("scissors").editSnippet()<CR>',   desc = "Edit snippet",    nowait = false, remap = false },
      })

      wk.add({
        { "<leader>as",  group = "Snippets",                                 mode = "x",                              nowait = false, remap = false },
        { "<leader>asa", '<cmd>lua require("scissors").addNewSnippet()<CR>', desc = "Add new snippet from selection", mode = "x",     nowait = false, remap = false },
      })
    end
  }
}
