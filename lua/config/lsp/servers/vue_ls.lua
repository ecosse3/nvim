-- Configure vue_ls (Vue Language Server) with Neovim 0.11 API
-- Note: mason-lspconfig v2.1.0 renamed "volar" to "vue_ls"
-- In hybrid mode, ts_ls/vtsls handles TypeScript; vue_ls handles .vue only
vim.lsp.config.vue_ls = {
  filetypes = { "vue" },

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,

  init_options = {
    vue = {
      hybridMode = true,
    },
  },

  settings = {
    vue = {
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
