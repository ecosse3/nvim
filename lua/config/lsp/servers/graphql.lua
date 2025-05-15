-- Configure graphql with Neovim 0.11 API
vim.lsp.config.graphql = {
  filetypes = { "graphql", "typescriptreact", "javascriptreact" },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
  settings = {
    graphql = {
      validateSchemas = true,
      schema = {
        introspection = {
          enable = true,
        },
      },
      linting = {
        enable = true,
        rules = {
          deprecatedFields = "warn",
          noAnonymousOperations = "warn",
          noSchemaIntrospectionCustomRootNames = "warn",
          noDuplicateFields = "error",
          uniqueOperationNames = "error",
          uniqueFragmentNames = "error",
        },
      },
    },
  },
  root_dir = function(fname, on_dir)
    local util = require("lspconfig.util")
    local root_patterns = {
      '.graphqlrc',
      '.graphqlrc.json',
      '.graphqlrc.yaml',
      '.graphqlrc.yml',
      '.graphqlrc.js',
      'graphql.config.json',
      'graphql.config.js',
      'graphql.config.yaml',
      'graphql.config.yml',
      '.git',
    }
    local root = util.root_pattern(unpack(root_patterns))(fname)
    if root then
      on_dir(root)
    end
  end,
}