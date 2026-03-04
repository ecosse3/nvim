-- Configure yamlls with Neovim 0.11 API
-- Uses SchemaStore.nvim for comprehensive YAML schema support
local schemastore_ok, schemastore = pcall(require, "schemastore")

vim.lsp.config.yamlls = {
  settings = {
    yaml = {
      schemaStore = {
        -- Disable built-in schemaStore support to use SchemaStore.nvim
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = schemastore_ok and schemastore.yaml.schemas() or {},
      validate = true,
      format = { enable = true },
    }
  },
}
