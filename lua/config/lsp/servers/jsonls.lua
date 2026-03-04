-- Configure jsonls with Neovim 0.11 API
-- Uses SchemaStore.nvim for comprehensive JSON schema support
local schemastore_ok, schemastore = pcall(require, "schemastore")

vim.lsp.config.jsonls = {
  settings = {
    json = {
      schemas = schemastore_ok and schemastore.json.schemas() or {},
      validate = { enable = true },
      format = { enable = true },
    }
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
}
