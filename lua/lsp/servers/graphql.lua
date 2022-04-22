local M = {}

-- Auto-install

local status_ok, lsp_installer_servers = pcall(require, 'nvim-lsp-installer.servers')
if status_ok then
  local ok, graphql = lsp_installer_servers.get_server("graphql")
  if ok then
    if not graphql:is_installed() then
      graphql:install()
    end
  end
end

-- Settings

M.settings = {}

return M
