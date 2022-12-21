local keys = require("keymaps.lsp")

local M = {}

M.settings = {
  css = {
    lint = {
      unknownAtRules = 'ignore',
    },
  },
  scss = {
    lint = {
      unknownAtRules = 'ignore',
    },
  },
}

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  keys.setup(client, bufnr)
end

return M
