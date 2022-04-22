local M = {}

-- Auto-install

local status_ok, lsp_installer_servers = pcall(require, 'nvim-lsp-installer.servers')
if status_ok then
  local ok, cssls = lsp_installer_servers.get_server("cssls")
  if ok then
    if not cssls:is_installed() then
      cssls:install()
    end
  end
end

-- Settings

M.settings = {}

return M
