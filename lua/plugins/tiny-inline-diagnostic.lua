return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "modern",
      options = {
        show_source = true,
        multilines = {
          enabled = true,
          always_show = true,
        },
      },
    })

    -- Disable native virtual text to avoid duplicates
    vim.diagnostic.config({ virtual_text = false })
  end,
}
