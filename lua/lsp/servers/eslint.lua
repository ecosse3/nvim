local M = {}

-- Auto-install

local status_ok, lsp_installer_servers = pcall(require, 'nvim-lsp-installer.servers')
if status_ok then
  local ok, eslint = lsp_installer_servers.get_server("eslint")
  if ok then
    if not eslint:is_installed() then
      eslint:install()
    end
  end
end

-- Settings

M.settings = {
  format = { enable = true }
}

return M
