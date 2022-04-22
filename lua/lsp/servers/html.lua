local M = {}

-- Auto-install

local status_ok, lsp_installer_servers = pcall(require, 'nvim-lsp-installer.servers')
if status_ok then
  local ok, html = lsp_installer_servers.get_server("html")
  if ok then
    if not html:is_installed() then
      html:install()
    end
  end
end

-- Settings

-- Enable (broadcasting) snippet capability for completion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = capabilities
M.settings = {}

return M
