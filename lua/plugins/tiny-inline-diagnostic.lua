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
        -- Auto-hide inline diagnostics when vim.diagnostic.open_float() is used (gl keymap)
        override_open_float = true,
      },
    })

    -- Disable native virtual text to avoid duplicates
    vim.diagnostic.config({ virtual_text = false })
  end,
}
