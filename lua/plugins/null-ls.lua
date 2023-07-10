-- WARN: DEPRECATED
-- This file is not used anymore
-- It is kept here for reference for now

require("mason-null-ls").setup({
  ensure_installed = {
    -- Opt to list sources here, when available in mason.
  },
  automatic_installation = false,
  automatic_setup = true, -- Recommended, but optional
  handlers = {},
})

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.codespell.with({
      filetypes = { "markdown", "text" },
    }),
  },
})
