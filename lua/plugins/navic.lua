return {
  {
    "SmiteshP/nvim-navic",
    event = { "CursorMoved", "BufWinEnter", "BufFilePost" },
    config = function()
      vim.api.nvim_set_hl(0, "NavicText", { link = "Winbar" })
      vim.api.nvim_set_hl(0, "NavicSeparator", { link = "Winbar" })

      require('nvim-navic').setup({
        lsp = {
          auto_attach = true,
          preference = nil,
        },
        highlight = true,
        separator = " " .. EcoVim.icons.caretRight .. " ",
        depth_limit = 0,
        depth_limit_indicator = "..",
        safe_output = true
      })

      require('internal.winbar')
    end,
    dependencies = "neovim/nvim-lspconfig",
  },
}
