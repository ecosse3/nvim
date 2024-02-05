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
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

return M
