-- Configure tailwindcss with Neovim 0.11 API
vim.lsp.config.tailwindcss = {
  capabilities = (function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.colorProvider = { dynamicRegistration = false }
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    return capabilities
  end)(),
  
  on_attach = function(client, bufnr)
    -- Empty on_attach maintained from original config
  end,
  
  filetypes = { "html", "mdx", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },
  
  init_options = {
    userLanguages = {
      eelixir = "html-eex",
      eruby = "erb",
    },
  },
  
  settings = {
    tailwindCSS = {
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      experimental = {
        classRegex = {
          "tw`([^`]*)",
          'tw="([^"]*)',
          'tw={"([^"}]*)',
          "tw\\.\\w+`([^`]*)",
          "tw\\(.*?\\)`([^`]*)",
          { "clsx\\(([^)]*)\\)",       "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "classnames\\(([^)]*)\\)", "'([^']*)'" },
          { "cva\\(([^)]*)\\)",        "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cn\\(([^)]*)\\)",         "[\"\'`]([^\"\'`]*)[\"\'`]" },
        },
      },
      validate = true,
    },
  },
  
  flags = {
    debounce_text_changes = 1000,
  },
}
