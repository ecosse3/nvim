local on_attach = require('lsp.on_attach')

-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
})
