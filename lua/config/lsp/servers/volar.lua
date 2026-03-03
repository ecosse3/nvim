-- Configure volar (Vue Language Server) with Neovim 0.11 API
-- Replaces deprecated vuels (Vetur)
vim.lsp.config.volar = {
  filetypes = { "vue", "typescript", "javascript" },

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,

  init_options = {
    vue = {
      hybridMode = true,
    },
  },

  settings = {
    volar = {
      codeLens = {
        references = true,
        pugTools = false,
        scriptSetupTools = true,
      },
      completion = {
        autoImport = true,
        tagCasing = "kebab",
      },
    },
  },
}
