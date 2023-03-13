require("mason-null-ls").setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
    },
    automatic_installation = false,
    automatic_setup = true, -- Recommended, but optional
})

require("null-ls").setup()
require "mason-null-ls".setup_handlers() -- If `automatic_setup` is true.
