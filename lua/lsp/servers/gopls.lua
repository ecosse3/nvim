local M = {}

-- Auto-install

local lsp_installer_servers = require"nvim-lsp-installer.servers"

local ok, gopls = lsp_installer_servers.get_server("gopls")
if ok then
  if not gopls:is_installed() then
    gopls:install()
  end
end

-- Settings

M.settings = {}

return M
