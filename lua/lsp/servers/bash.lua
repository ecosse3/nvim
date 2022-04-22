local M = {}

-- Auto-install

local status_ok, lsp_installer_servers = pcall(require, 'nvim-lsp-installer.servers')
if status_ok then
  local ok, bashls = lsp_installer_servers.get_server("bashls")
  if ok then
    if not bashls:is_installed() then
      bashls:install()
    end
  end
end

-- Settings

M.settings = {}

return M
